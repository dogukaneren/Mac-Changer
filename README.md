# Mac-Changer
Script that changes mac address of an given interface

# Usage
# SH

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
