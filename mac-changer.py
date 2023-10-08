import subprocess
import random
import sys

def generate_random_mac():
    mac = [0x00, 0x16, 0x3e, random.randint(0x00, 0x7f), random.randint(0x00, 0xff), random.randint(0x00, 0xff)]
    return ':'.join(map(lambda x: "%02x" % x, mac))

def change_mac(interface, new_mac):
    try:
        subprocess.call(['sudo', 'ifconfig', interface, 'down'])

        subprocess.call(['sudo', 'ifconfig', interface, 'hw', 'ether', new_mac])

        subprocess.call(['sudo', 'ifconfig', interface, 'up'])

        print(f"MAC address of {interface} changed to {new_mac}")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python change_mac.py <interface>")
        sys.exit(1)

    interface = sys.argv[1]
    random_mac = generate_random_mac()
    change_mac(interface, random_mac)
