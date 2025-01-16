def get_user_position():
    import requests
    response = requests.get("https://ipinfo.io/json")
    if response.status_code == 200:
        data = response.json()
        position = {
            "latitude": float(data["loc"].split(",")[0]),
            "longitude": float(data["loc"].split(",")[1]),
            "city": data.get("city"),
            "region": data.get("region"),
            "country": data.get("country")
        }
        return position
    else:
        raise Exception("Could not fetch geolocation data")

position = get_user_position()
print(position)