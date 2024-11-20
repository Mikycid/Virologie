

def download_file(url: str, output_dir: str) -> str:
    try:
        import os
        import requests
        import urllib3
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
        os.makedirs(output_dir, exist_ok=True)
        filename = os.path.basename(url)
        filepath = os.path.join(output_dir, filename)
        
        response = requests.get(url, verify=False)
        response.raise_for_status()
        
        with open(filepath, 'wb') as f:
            f.write(response.content)
                
        print("OK")
    except Exception as e:
        print(f"Error: {e}")

download_file("TO_REPLACE_WITH_URL", "TO_REPLACE_WITH_OUTPUT_DIR")
# download_file("https://localhost:8080/python3.8.exe", ".")