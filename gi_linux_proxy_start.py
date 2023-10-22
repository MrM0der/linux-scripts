#!/bin/python3
import os
import subprocess

result = subprocess.run(['id', '-g', '-n'], capture_output=True, text=True)
current_group = result.stdout.strip()
print(f"Welcome to Genshin Impact Linux Proxy. Group will be proxy: {current_group}")
print("Before using this, turn on ./mitm_start.sh in another terminal window and edit custom_proxy.py")
print('1 - Enable Proxy, 2 - Disable Proxy')
number = input('> ')
if number == '1':
    os.system(f'sudo iptables -t nat -I OUTPUT -m owner --gid-owner {current_group} -p tcp -j REDIRECT --to-ports 28080')
    print('The proxy is successfully enabled! Please go into the game gate and disable proxy after loading the game.')
elif number == '2':
    os.system(f'sudo iptables -t nat -I OUTPUT -m owner --gid-owner {current_group} -p tcp -j ACCEPT')
    print('Proxy successfully disabled! Good game!')
else:
    print('Select 1 or 2, please.')
