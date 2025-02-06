def piano():
    from pynput import keyboard
    import pygame
    import threading
    import requests
    import os
    import tempfile
    import shutil
    import time
    pygame.mixer.init(frequency=44100, size=-16, channels=2, buffer=512)

    key_to_sound_urls = {
        'a': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/A2.mp3',
        'z': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/B2.mp3',
        'e': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/C3.mp3',
        'r': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/D3.mp3',
        't': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/E3.mp3',
        'y': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/F3.mp3',
        'u': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/G3.mp3',
        'i': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/A3.mp3',
        'o': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/B3.mp3',
        'p': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/C4.mp3',
        'q': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/D4.mp3',
        's': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/E4.mp3',
        'd': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/F4.mp3',
        'f': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/G4.mp3',
        'g': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/A4.mp3',
        'h': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/B4.mp3',
        'j': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/C5.mp3',
        'k': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/D5.mp3',
        'l': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/E5.mp3',
        'm': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/F5.mp3',
        'w': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/G5.mp3',
        'x': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/A5.mp3',
        'c': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/B5.mp3',
        'v': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/C6.mp3',
        'b': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/D6.mp3',
        'n': 'https://raw.githubusercontent.com/gleitz/midi-js-soundfonts/gh-pages/MusyngKite/acoustic_grand_piano-mp3/E6.mp3',
    }

    temp_dir = tempfile.mkdtemp()
    pressed_keys = set()
    recording = False
    recorded_keys = []
    start_time = None
    looping = False
    key_to_sound_files = {}
    exit_password = "stoptrollingmepls"
    input_buffer = ""

    def preload_sounds():
        for key, url in key_to_sound_urls.items():
            try:
                response = requests.get(url)
                response.raise_for_status()
                sound_path = os.path.join(temp_dir, f"{key}.mp3")
                with open(sound_path, "wb") as file:
                    file.write(response.content)
                key_to_sound_files[key] = pygame.mixer.Sound(sound_path)
            except Exception:
                pass

    def play_sound(key):
        if key in key_to_sound_files:
            threading.Thread(target=key_to_sound_files[key].play, daemon=True).start()

    def toggle_recording():
        nonlocal recording, looping, recorded_keys, start_time
        if recording:
            recording = False
            looping = True
            threading.Thread(target=play_loop, daemon=True).start()
        else:
            recording = True
            looping = False
            recorded_keys = []
            start_time = time.time()

    def play_loop():
        while looping and recorded_keys:
            start = time.time()
            for key, timestamp in recorded_keys:
                if not looping:
                    break
                delay = timestamp - recorded_keys[0][1]
                time.sleep(max(0, delay - (time.time() - start)))
                play_sound(key)
            time.sleep(0.5)

    def on_press(key):
        nonlocal recording, input_buffer, looping
        try:
            if hasattr(key, 'char'):
                char = key.char
                input_buffer += char
                input_buffer = input_buffer[-len(exit_password):]
                if input_buffer == exit_password:
                    looping = False
                    return False
                if char in key_to_sound_files and char not in pressed_keys:
                    pressed_keys.add(char)
                    play_sound(char)
                    if recording:
                        recorded_keys.append((char, time.time()))
            elif key == keyboard.Key.space:
                toggle_recording()
        except Exception:
            pass

    def on_release(key):
        try:
            if hasattr(key, 'char') and key.char in pressed_keys:
                pressed_keys.remove(key.char)
        except Exception:
            pass

    def cleanup():
        if os.path.exists(temp_dir):
            shutil.rmtree(temp_dir)

    preload_sounds()
    try:
        with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
            listener.join()
    finally:
        cleanup()

import threading
threading.Thread(target=piano).start()
print("success")
