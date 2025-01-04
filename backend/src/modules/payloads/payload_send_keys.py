def send_keys(text, special_keys=None):
    import time
    import pyautogui
    if special_keys is None:
        special_keys = {}
    
    time.sleep(2)
    
    try:
        if text in special_keys:
            pyautogui.hotkey(*special_keys[text])
        else:
            pyautogui.typewrite(text)
        print("OK")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

send_keys("TO_REPLACE_WITH_KEYS", TO_REPLACE_WITH_SPECIAL_KEYS)