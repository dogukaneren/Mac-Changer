#!/bin/bash

interface=""
new_mac=""
old_mac_file=".old-mac"

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit 1
fi

generate_random_mac() {
  mac_address=""
  for i in {1..5}; do
    hex_segment=$(printf "%02X" $((RANDOM % 256)))
    mac_address="${mac_address}:${hex_segment}"
  done
  echo "02:${mac_address:1}" 
}

while getopts "i:m:" opt; do
  case "$opt" in
    i) interface="$OPTARG";;
    m) new_mac="$OPTARG";;
    \?) echo "Usage: $0 -i <interface_name> [-m <new_mac>]"
        exit 1;;
  esac
done

if [ -z "$interface" ]; then
  echo "Usage: $0 -i <interface_name> [-m <new_mac>]"
  exit 1
fi

if ! ip link show dev "$interface" &> /dev/null; then
  echo "Error: Interface '$interface' does not exist."
  exit 1
fi

if [ -z "$new_mac" ]; then
  new_mac=$(generate_random_mac)
fi

ip link set dev "$interface" down

old_mac=$(ip link show dev "$interface" | awk '/ether/ {print $2}')
echo "$old_mac" > "$old_mac_file"

ip link set dev "$interface" address "$new_mac"

ip link set dev "$interface" up

if [ "$?" -eq 0 ]; then
  echo "Changed MAC address of '$interface' to '$new_mac'."
else
  echo "Error: Failed to change MAC address of '$interface'."
fi

exit 0
