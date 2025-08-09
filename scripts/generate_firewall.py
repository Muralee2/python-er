#!/usr/bin/env python3
import json
import sys
import requests

def main():
    # Read input from Terraform
    try:
        raw_input = sys.stdin.read()
        params = json.loads(raw_input)
        project_id = params.get("project_id")
        location = params.get("location", "us-central1")
    except Exception as e:
        print(json.dumps({"error": f"Invalid input: {e}"}))
        sys.exit(1)

    # GKE master authorized networks API endpoint (public info)
    try:
        # Get GKE master CIDR ranges (this is normally known from GCP docs or API)
        master_cidrs = [
            "172.16.0.0/28",  # Example control plane range
            "34.68.0.0/14"    # Example GKE master range (change per region)
        ]
    except Exception as e:
        print(json.dumps({"error": f"Failed fetching GKE master CIDRs: {e}"}))
        sys.exit(1)

    # Define firewall rules
    firewall_rules = [
        {
            "name": "allow-egress-to-gke-master",
            "direction": "EGRESS",
            "priority": 1000,
            "ranges": master_cidrs,
            "allow": [{"IPProtocol": "tcp", "ports": ["443"]}],
            "description": "Allow egress from nodes to GKE master"
        },
        {
            "name": "allow-node-pod-communication",
            "direction": "INGRESS",
            "priority": 1000,
            "ranges": ["10.0.0.0/8"],  # VPC range, adjust as needed
            "allow": [{"IPProtocol": "all"}],
            "description": "Allow all communication between nodes and pods"
        }
    ]

    # Output as JSON for Terraform external data source
    print(json.dumps({"rules": firewall_rules}))

if __name__ == "__main__":
    main()
