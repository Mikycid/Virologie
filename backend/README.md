Generate the certificates using : 

```bash
cd certs
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```

Press enter multiple times (entering nothing in the informations asked is fine)

# How to code modules ?

Modules are not good code, those are mostly devil tools to be able to use another's human's hardware to execute whatever you want to.

In this project, you'll use your modules to keep your infected users into safety, while having some code executed on their machines for POC causes. Only for testing purposes.

## Rule n°1: I don't have any context

No code from your module will be able to load anything like environment variables, neither separate code.

Your module should be able to handle itself. The only thing it's given is a backend endpoint than can be configured to do and register things going on, on or about the infected machine.

As we are running python from the starting point, this could be hard for your python coding sense...

To be able to write python in this project as modules, first, call a function from your script.

Just one function, main(), or any naming, and import all necessary things IN there, for example :

```python
def main():
    import os
    os.system("echo I am not a hacker")

try:
    main()
except Exception as e:
    print(str(e))
```

This should be your template code to begin with, you could try removing/readding the try/except block if you need, sometimes (but rarely) it can save some hours.

## Rule N°2: Your module handles itself

When you create a module, you'll basically start with creating the payload, for dopamine purposes.

You start then creating your script under backend/src/modules folder, then link your script to your module used by the backend, take example of the Keylogger to handle "complex" infections using a socket inside the module.

## Rule N°3: Uninstall is the key to install again

If the user does not want to be infected, this belongs to him.

You can't have a secret infected user without trespassing laws, and, this is this project's purpose, we don't mean to harm anyone's computer.

This includes: provide a disinfection button to the user. 

Any added service should be uninstallable or from the API or from a global disinstallation button shown on the infected's screen while it's infected, and it should still appear if the user is disinfected but the module is still running.

If the module can uninstall itself or has no disk-writing capabilites alongside it's run, it will be considered a good module for this project.

## Rule N°4 Line returns

During your coding you'll handle different types of errors like : `unexpected indent (<string>, line 1)` or `invalid syntax (<string>, line 1)`

To handle: change code structure, reduce lists & dictionnaries initalization (I found many error with lists): there is an infinite way to make the same code, find your own through this coding concept, or find the (probably encoding) bug on the infector reverse shell, without breaking the actual running modules !