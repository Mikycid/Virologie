def main():
    import os


    username = os.getenv('USERNAME')

    path_list = {
        f"C:\\Users\\{username}\\.ssh\\id_rsa": 0,
        f"C:\\Users\\{username}\\.ssh\\id_rsa.pub": 0,
        f"C:\\Users\\{username}\\AppData\\Local\\Microsoft\\Edge\\User Data\\Safe Browsing Cookies": 0,
    }


    for path in path_list.copy():
        if os.path.isfile(path) and os.path.exists(path):
            path_list[path] = 1

    print(path_list)

main()


