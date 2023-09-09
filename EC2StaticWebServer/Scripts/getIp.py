import requests as re
import json 

def GetIp():
    reData = re.get("https://api64.ipify.org?format=json")
    if reData.status_code == 200:
        data = json.loads(reData.text)
        return data["ip"]
    else:
        print("Error Occured.")
        print(f"Status Code: {reData.status_code}")
        return 0

if __name__ == "__main__":
    ret = GetIp()
    if ret:
        print(f"Public IP Address: {ret}")
