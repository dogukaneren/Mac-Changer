# Mac-Changer
Script that changes mac address of an given interface

# Installation

``` bash
wget https://github.com/dogukaneren/Mac-Changer/releases/download/mac-changerv0.1/mac-changer-0.1.deb
apt install ./mac-changer.deb
```
# Usage
# Deb Package

``` bash
mac-changer -i <interface-name>
```

``` bash
mac-changer -i <interface-name> -m "00:11:22:33:44:55"
```

_Note: If want to generate random mac address to interface of your device you can just supply -i parameter to script_

# Directly sh
``` bash
sudo chmod +x mac-changer.sh
```
-i interface

``` bash
./mac-changer.sh -i <interface-name>
```
-m mac address

``` bash
./mac-changer.sh -i <interface-name> -m "00:11:22:33:44:55"
```
_Note: If want to generate random mac address to interface of your device you can just supply -i parameter to script_

# Python

``` bash
python3 mac-changer.py <interface-name>
```
