from pythonosc import osc_message_builder
from pythonosc import udp_client

import argparse
from random import randint
import time
import sys
import random

portNum = 3333
ipNum = "127.0.0.1"
instrument = sys.argv[1]
client = udp_client.SimpleUDPClient(ipNum, portNum)

def guitarNotesSimulator():
    while True:
        client.send_message("/hit", randint(1, 16))
        time.sleep(1)
def drumNotesSimulator():
    while True:
        client.send_message("/hit", randint(1, 4))
        time.sleep(random.random())

if instrument == "guitar":
    client.send_message("/instrument", "guitar")
    guitarNotesSimulator()
elif instrument == "drum":
    client.send_message("/instrument", "drum")
    drumNotesSimulator()
else:
    pass
#
# for x in range(10):
#     client.send_message("/pass", random.random())
#     time.sleep(1)
