def main():
    import base64
    import os

    path = r"PATH_PLACEHOLDER"
    if not os.path.exists(path):
        print("File not found\0")
        return

    if os.path.getsize(path) == 0:
        print("File is empty\0")
        return

    with open(path, "rb") as file:
        content = file.read()
        encoded_content = base64.b64encode(content)
        print(encoded_content.decode() + "\0")


main()