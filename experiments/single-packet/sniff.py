"""
    This code is meant for rx-container; 
"""

from scapy.all import *
import argparse


def expand(x):
    yield x
    while x.payload:
        x = x.payload
        yield x


def handle_pkt(packet):
    # if the packet has the TIMESTAMP header, its coming from edo3
    print("Received 1 packet of {0} bytes".format(len(packet)))
    # show raw hexdump
    hexdump(packet)
    print(".")


def recv_packets(interface='ovs-eth1'):
    print(">> Sniffing on Interface: {0}".format(interface))
    sniff(iface=interface, prn=lambda x: handle_pkt(x))
    pass


def main():
    parser = argparse.ArgumentParser(description='packet catcher at receiver side')
    parser.add_argument('--dst_intf', help='destination machine interface', action="store", default='ovs-eth1')
    args = parser.parse_args()
    print(args)
    recv_packets(interface=args.dst_intf)
    pass


if __name__ == "__main__":
    main()
