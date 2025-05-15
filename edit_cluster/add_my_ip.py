import requests
import json
from datetime import datetime

# Config
project_id = "65f617a6cdafb5108b9c6ef2"  # Enter your project ID
tfvars_file = "ip_access_list.auto.tfvars.json"
comment = f"My IP added on {datetime.utcnow().isoformat()}"

def get_my_ip():
    try:
        response = requests.get("https://api.ipify.org?format=json", timeout=5)
        response.raise_for_status()
        return response.json()["ip"]
    except requests.RequestException as e:
        print(f"Error fetching IP: {e}")
        return None

def write_tfvars(ip, project_id, comment):
    entry = {
        "ip_access_list": [
            {
                "ip_address": ip,
                "comment": comment
            }
        ],
        "project_id": project_id
    }

    with open(tfvars_file, "w") as f:
        json.dump(entry, f, indent=2)
    print(f"Wrote IP to {tfvars_file}: {ip}")

if __name__ == "__main__":
    ip = get_my_ip()
    if ip:
        write_tfvars(ip, project_id, comment)
