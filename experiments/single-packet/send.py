"""
    This code is meant for tx-container; 
"""

from scapy.all import *
import argparse
import time


def send_packets(interface, src_ip, dst_ip, count=1, delay=1):
    pkt = Ether()/IP(src=src_ip, dst=dst_ip)/UDP()/'payload'
    pkt_size = len(pkt)
    print("[LOG] Generating {0} packets of {1}-bytes at {2} seconds delay".format(count, pkt_size, delay))
    for i in range(count):
        print("[LOG] Sending {0} bytes from {1} >> {2}".format(pkt_size, src_ip, dst_ip))
        hexdump(pkt)
        print('.')
        sendp(pkt, iface=interface)
        time.sleep(delay)


def main():
    parser = argparse.ArgumentParser(description='traffic generator at sender side')
    parser.add_argument('--src_intf', help='source machine interface', action="store", default='ovs-eth1')
    parser.add_argument('--src_ip', help='source interface ip', action="store", default='192.168.0.10')
    parser.add_argument('--dst_ip', help='destination interface ip', action="store", default='192.168.0.20')
    parser.add_argument('--count', help='number of packets to send', action='store', type=int, default=1)
    parser.add_argument('--delay', help='delay in seconds', action='store', type=int, default=1)
    args = parser.parse_args()
    print(args)
    # only one mode must be specified with complete set of arguments
    assert (args.delay > 0.0)
    send_packets(interface=args.src_intf, src_ip=args.src_ip, dst_ip=args.dst_ip, count=args.count, delay=args.delay)


if __name__ == "__main__":
    main()