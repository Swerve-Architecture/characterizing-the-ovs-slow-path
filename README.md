# OVS Experiments to Explore Slow Path Bottlenecks

This is the main repository for running `ControlPlaneDSA` experiments. Our experiments, at the moment, include:
<ol>
    <li>Understanding the software architecture of OVS and how it can be moved to a NIC (including both, user and kernel space code)</li>
    <li>Line-by-line debugging of ovs-vswitchd, and single-packet tracing through OVS userspace code</li>
    <li>Exploring the effect of BFD session count on ovs-vswitchd userspace slowdown</li>
</ol>

## Getting started

### Dependencies
Install the build requirements listed on the [following link](https://github.com/openvswitch/ovs/blob/master/Documentation/intro/install/general.rst#id13).
You can do so by running the following script from the shell:
```sh
# make the script executable and install the (minimum) ovs dependencies
$ chmod +x install-ovs-dependencies.sh
$ ./install-ovs-dependencies.sh
```
Additionally, you also require the following tools installed on your machine:
<ol>
    <li>gcc-8 (at least version 8)</li>
    <li>make</li>
    <li>cmake (latest version)</li>
    <li>LLVM-12</li>
    <li>CLANG-12</li>
    <li>meson (for dpdk)</li>
    <li>ninja (for dpdk)</li>
    <li>GDB (for code step-through)</li>
    <li>Docker</li>
    <li>Clion (for visual debugging)</li>
</ol>

## SUDO Access
> **Note:** OVS requires sudo access for most of its operation. Copy the `ovs.vars.template` to `ovs.vars` and update `USER_PASSWORD` with your user password and also add the table ID for ovs (that you can find when you run `make show-bridges` for the first time).

## Clone and build DPDK *(only if userspace switch is to be tested!!)*
From project root directory, clone, configure, build and install `DPDK` on your machine as following:

```sh
make get-dpdk
make configure-dpdk
make build-dpdk
make install-dpdk
make check-dpdk-version
```

If a rebuild of `dpdk` is necessary, do:

```sh
make clean-dpdk
make configure-dpdk
make build-dpdk
make install-dpdk
make show-dpdk-version
```

## Clone and build Open-vSwitch
To setup `ovs`, we need to fetch the submodule, configure it for symbolic debug, build and install on the system. Run the following from the project root directory.

```sh
make get-ovs
```

Additionally, install the usdt probe module that we will be utilizing for our advanced experiments.
```sh
make get-systemtap
```

Then, chose your datapath for experiments:
```sh
# do only one of the following options, based on your datapath selection
# option-1: for upstream linux kernel datapath (whatever is included in your linux distribution)
make configure-ovs-build
# option-2: for kernel datapath, but build the new module that comes with the ovs repository
make configure-ovs-build-with-kernel-module
# option-3: for DPDK (userspace) datapath
make configure-ovs-build-with-dpdk
# option-4: for XDP-based (userspace) datapath
make configure-ovs-build-with-xdp
```

Now, build and install...
```sh
make build-ovs-with-debug-symbols
make install-ovs
make show-ovs-version
```

Once installed, add the following line to your `~/.bashrc` file:

```sh
export PATH=$PATH:/usr/local/share/openvswitch/scripts
```

At any point, if a rebuild is necessary, clean the build and re-run as following:

```sh
make clean-ovs-build
make configure-ovs-build # or whicheven option you chose earlier
make build-ovs-with-debug-symbols
make install-ovs
```

## Build test container image for experimentation
We need some custom modules for testing switch performance against data and control traffic. We provide these modules as a docker image that we use as our virtual hosts (containers) that are connected to our `ovs-switchd` instance. To build the docker image, run the following from project root directory:

```sh
make build-docker-image
```

If, at a later point, a new module is added to the `Dockerfile`, or a rebuild is necessary for some other reason, do the following:

```sh
make clean-docker-image
make clean-dangling-images
make build-docker-image
```

## Start Experimenting

### Start Open-vSwitch dameons
We start OVS by running its dameons and setting minimum number of userspace handler threads (normally 2), using the following command from project root directory:

```sh
make start-ovs 
make set-ovs-nhandler-threads-to-2
```
This will allow us to work with minimum number of handler threads which should help us debug the `ovs-vswitchd` in a more managable manner.

### Build test switch
We need a test switch to see how `ovs-vswitchd` performs in the userspace. To add this test switch (called `test-br0`), run the following command:

```sh
make add-bridge
```

### TX/RX test containers
We need two containers to connect to our switch and forward traffic from one to the other. We call these `tx` and `rx` containers. To start, open two new terminals, and run the following commands:

#### From terminal-1
```sh
make tx-container
```

#### From terminal-2
```sh
make rx-container
```

This will leave both terminals inside their docker containers' working directories. We will use these terminals to test forwarding behavior and performance of the ovs. Both containers are instantiated without connectivity to the host machines' IP stack (so no internet in there!). You can confirm this by running the following in each of the two container terminals.

```sh
ifconfig -a
```

This will show something like this:

```sh
root@5c7aa4030366:/workdir# ifconfig -a
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

root@5c7aa4030366:/workdir#
```

indicating that only a loopback interface exists. If you try to run `ping`, it should throw an error.

### Connect hosts
At this point, we have turned on the OVS, added a test bridge, and started our `tx/rx` containers. Now we can connect all three by running the following from the ovs terminal (not `tx` or `rx` terminal):

```sh
make add-links
```

After this, you can view the updated bridge and its new ports by running:

```sh
make show-bridges
```

It should output something like the following:

```sh
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$ make show-bridges
echo taurus | sudo -s ovs-vsctl show
b86dce42-c3ee-4a32-99d3-69ca8bea0fd9
    Bridge test-br0
        fail_mode: secure
        Port "54c45e88b8ce4_l"
            Interface "54c45e88b8ce4_l"
        Port test-br0
            Interface test-br0
                type: internal
        Port fd9bdce8b9a24_l
            Interface fd9bdce8b9a24_l
    ovs_version: "2.16.90"
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$
```

indicating the new ports. These ports are connected to `tx` and `rx` containers, indicating a simple linear topology `tx -- test-br0 -- rx`. The port named `test-br0` (same as the bridge) is the bridge's internal port and we aren't using this for our experiments at the moment. We can see the new interfaces added to our containers as well. Run the following from `tx` container:

```sh
root@b7c46a0d4fb1:/workdir# ifconfig -a
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ovs-eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.10  netmask 255.255.255.0  broadcast 0.0.0.0
        ether 9e:3e:e1:f6:8a:b4  txqueuelen 1000  (Ethernet)
        RX packets 12  bytes 1592 (1.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

root@b7c46a0d4fb1:/workdir#
```

Here, `ovs-eth1` is our test interface that is connected to one of the interfaces on `test-br0`, our test bridge.

### Testing ping
Go back to the `tx` and `rx` containers to test if ping works between them. From `tx` terminal, run the following:

```sh
make ping-rx
```

and you will get something like:

```sh
root@b7c46a0d4fb1:/workdir# make ping-rx
ping 192.168.0.20
PING 192.168.0.20 (192.168.0.20) 56(84) bytes of data.
From 192.168.0.10 icmp_seq=1 Destination Host Unreachable
From 192.168.0.10 icmp_seq=2 Destination Host Unreachable
From 192.168.0.10 icmp_seq=3 Destination Host Unreachable
From 192.168.0.10 icmp_seq=4 Destination Host Unreachable
From 192.168.0.10 icmp_seq=5 Destination Host Unreachable
From 192.168.0.10 icmp_seq=6 Destination Host Unreachable
^C
--- 192.168.0.20 ping statistics ---
9 packets transmitted, 0 received, +6 errors, 100% packet loss, time 8181ms
pipe 4
make: *** [Makefile:110: ping-rx] Error 1

root@b7c46a0d4fb1:/workdir#
```

indicating a failing ping. How do we know whether our switch can even forward the packets or not? We can look at its flow table to see the installed rules. Go back to the ovs terminal and run `make show-flows` to get the following output:

```sh
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$ make show-flows
echo taurus | sudo -s ovs-ofctl dump-flows test-br0
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$
```

This shows that it ran `ovs-ofctl dumpflows test-br0` underneath and nothing was printed, indicating an empty flow table. No flow rules, so no forwarding!

### Add basic forwarding rules
We add very simple ad-hoc forwarding rules to our `test-br0` bridge to forward bi-directional traffic between openflow ports 1 and 2. To do that, run the following from ovs terminal:

```sh
make install-port-based-birectional-forwarding-rules
```

and you will get the following output:

```sh
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$ make install-port-based-birectional-forwarding-rules
echo taurus | sudo -s ovs-ofctl add-flow test-br0 in_port=1,actions=output:2
echo taurus | sudo -s ovs-ofctl add-flow test-br0 in_port=2,actions=output:1
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$
```

indicating that the traffic oncoming at port 1 will be forwarded to port 2 and vice versa. Hence, forwarding should work between our `tx/rx` containers (you can confirm that these port numbers make sense by running `make show-openflow-ports` from the ovs terminal). Confirm that the rules have been added successfully by running `make show-flows` from the ovs terminal:

```sh
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$ make show-flows
echo taurus | sudo -s ovs-ofctl dump-flows test-br0
 cookie=0x0, duration=1585.130s, table=0, n_packets=146, n_bytes=13972, in_port="f563a3f7a52f4_l" actions=output:"443aff2b00cf4_l"
 cookie=0x0, duration=1585.122s, table=0, n_packets=146, n_bytes=13972, in_port="443aff2b00cf4_l" actions=output:"f563a3f7a52f4_l"
(base) taurus@edo-taurus-annus:~/ControlPlaneArchitecture/ovs-experiments$
```

Now, switch to `tx` terminal, and run ping again. This time, it should return work successfully.

```sh
root@b7c46a0d4fb1:/workdir# make ping-rx
ping 192.168.0.20
PING 192.168.0.20 (192.168.0.20) 56(84) bytes of data.
64 bytes from 192.168.0.20: icmp_seq=1 ttl=64 time=0.551 ms
64 bytes from 192.168.0.20: icmp_seq=2 ttl=64 time=0.056 ms
64 bytes from 192.168.0.20: icmp_seq=3 ttl=64 time=0.041 ms
64 bytes from 192.168.0.20: icmp_seq=6 ttl=64 time=0.042 ms
64 bytes from 192.168.0.20: icmp_seq=8 ttl=64 time=0.040 ms
64 bytes from 192.168.0.20: icmp_seq=9 ttl=64 time=0.041 ms
64 bytes from 192.168.0.20: icmp_seq=10 ttl=64 time=0.041 ms
^C
--- 192.168.0.20 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9197ms
rtt min/avg/max/mdev = 0.040/0.093/0.551/0.152 ms

root@b7c46a0d4fb1:/workdir#
```

Notice the first ICMP packet's response that took `time=0.551ms`, compared to an order-of-magnitude smaller response time on the subsequent packets. That's because the first packet was sent to the userspace `ovs-vswitchd` which implements the full openflow table pipeline and takes longer to generate the action for this flow. But once generated, it caches the resulting flow into the kernel space datapath (system, ofproto-dpif), and subsequent packets are directly matched against this cached flow and forwarded by the kernel datapath directly. So, no userspace trip overhead, and hence smaller response time. 

## Advanced Tests

In this section, we will start setting up the dependencies for our advanced tests that rely on `User Statically-Defined Tracepoints (USDT)`. Starting with OVS version `2.17.90`, some well-thought-of `USDTs` have been added to `vswitchd` and we are going to add more for our tests. We first need to setup all the dependencies for these tests to work. Build and install the following tools in the given order, but before that, fetch all the dependencies using:

```sh
git submodule update --init
```

### 1. Perf
```sh
make install-perf
```

### 2. Google Test
```sh
# https://github.com/google/googletest/blob/main/googletest/README.md
make build-googletest
make install-googletest
# make clean-googletest-build # if necessary at any point
```

### 3. libbpf
```sh
# https://github.com/libbpf/libbpf
make install-libbpf-deps
make build-libbpf
make install-libbpf
# make clean-libbpf-build # if necessary at any point
```

### 4. bcc
```sh
# https://github.com/iovisor/bcc/blob/master/INSTALL.md#ubuntu---source
make install-bcc-deps
make build-bcc
make install-bcc
make build-bcc-python-bindings
make install-bcc-python-bindings
# make clean-bcc-build # if necessary at any point
```

### 5. bpftrace
```sh
# https://github.com/iovisor/bpftrace/blob/master/INSTALL.md
# https://askubuntu.com/questions/1332666/how-to-install-llvm-12-for-ubuntu-16-04
make install-bpftrace-deps
make build-bpftrace
make install-bpftrace
# make clean-bpftrace-build # if necessary at any point
```
