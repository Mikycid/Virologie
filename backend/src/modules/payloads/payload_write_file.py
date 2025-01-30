def main():
    import os
    import mmap
    try:
        file_path = "TO_REPLACE_WITH_FILE_PATH"
        file_content = b"TO_REPLACE_WITH_FILE_CONTENT"

        # Open with read/write permissions
        with os.fdopen(os.open(file_path, os.O_RDWR | os.O_CREAT), "r+b") as f:
            f.truncate(len(file_content))  # Ensure file is the correct size
            with mmap.mmap(f.fileno(), length=len(file_content), access=mmap.ACCESS_WRITE) as mm:
                mm.write(file_content)
                mm.flush()

        print("ok")
    except Exception as e:
        print(e)

main()
