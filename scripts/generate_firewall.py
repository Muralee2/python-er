import subprocess
import json
import sys

def create_firewall_rule(project, network, subnet, name="allow-gke"):
    # Define the allowed ports/protocols
    allowed = [
        {"IPProtocol": "tcp", "ports": ["22", "80", "443"]},  # SSH, HTTP, HTTPS
        {"IPProtocol": "icmp"}
    ]

    # Get the subnet CIDR
    cmd = [
        "gcloud", "compute", "networks", "subnets", "describe", subnet,
        "--project", project,
        "--region", "us-central1",  # change region as needed
        "--format", "json"
    ]
    result = subprocess.run(cmd, capture_output=True, text=True, check=True)
    subnet_info = json.loads(result.stdout)
    cidr_range = subnet_info["ipCidrRange"]

    # Create firewall rule (no tags so it applies to all VMs in subnet)
    subprocess.run([
        "gcloud", "compute", "firewall-rules", "create", name,
        "--project", project,
        "--network", network,
        "--allow", "tcp:22,tcp:80,tcp:443,icmp",
        "--source-ranges", cidr_range
    ], check=True)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: firewall.py <project> <network> <subnet>")
        sys.exit(1)

    project = sys.argv[1]
    network = sys.argv[2]
    subnet = sys.argv[3]

    create_firewall_rule(project, network, subnet)

