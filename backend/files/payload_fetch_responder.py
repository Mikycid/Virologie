def main():
    import requests
    from requests_negotiate_sspi import HttpNegotiateAuth
    url = "http://hackstation.virology.fr"

    try:
        response = requests.get(url, auth=HttpNegotiateAuth())
        response.raise_for_status()
        print("Success")
    except requests.exceptions.RequestException as e:
        print("Error:", e)

main()