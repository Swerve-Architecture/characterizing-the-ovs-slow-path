# ovs build and open-vswitch options
export OVS_SUBMODULE 								= ovs
export OVS_SOURCE_DIR 								= $(PWD)/ovs
export OVS_BUILD_DIR 								= $(OVS_SOURCE_DIR)/build
export OVS_VSWITCHD_BUILD_DIR						= $(OVS_BUILD_DIR)/vswitchd/
export OVS_VSWITCHD_EXECUTABLE_NAME					= ovs-vswitchd
export KERNEL_VERSION 								= $(shell uname -r)
export KERNEL_BUILD_DIR 							= /lib/modules/$(KERNEL_VERSION)/build
export OVS_BUILD_CONFIGURE_SCRIPT 					= configure
export OVS_BUILD_C_COMPILER 						= gcc
export OVS_BUILD_FLAGS 								= --with-debug
export OVS_USDT_BUILD_FLAG							= --enable-usdt-probes
export OVS_BUILD_FLAGS_WITH_DPDK 					= $(OVS_BUILD_FLAGS) --with-dpdk=static
export OVS_BUILD_FLAGS_WITH_KERNEL_MODULE 			= $(OVS_BUILD_FLAGS) --with-linux=$(KERNEL_BUILD_DIR)
export OVS_BUILD_CFLAGS 							= -g
export OVS_SYSTEM_ID 								= 2022
export OVS_PID_FILE 								= /usr/local/var/run/openvswitch/ovs-vswitchd.pid
export OVS_VSWITCHD_LOG_FILE 						= /usr/local/var/log/openvswitch/ovs-vswitchd.log
export OVS_DB_SOCK 									= /usr/local/var/run/openvswitch/db.sock
export OVS_SCRIPTS_PATH								= /usr/local/share/openvswitch/scripts
export OVS_INSTALL_DIR_1							= /usr/local/sbin
export OVS_INSTALL_DIR_2							= /usr/local/bin
export OVS_INSTALL_DIR_3							= /usr/sbin

# dpdk build options		
export DEPENDENCIES_DIR 							= $(PWD)/deps
export DPDK_SOURCE_DIR 								= $(DEPENDENCIES_DIR)/dpdk
export DPDK_BUILD_DIR 								= $(DPDK_SOURCE_DIR)/build
export DPDK_INSTALL_DIR								= /usr/local/bin
export DPDK_GIT_LINK 								= http://dpdk.org/git/dpdk
export DPDK_VERSION 								= v21.11

# perf options		
export PERF_EVENTS_RECORD							= perf.data

# libbpf build options		
export LIBBPF_GIT_LINK								= https://github.com/libbpf/libbpf
export LIBBPF_SOURCE_DIR							= $(DEPENDENCIES_DIR)/libbpf
export LIBBPF_BUILD_DIR								= $(LIBBPF_SOURCE_DIR)/build
export LIBBPF_BUILD_INCLUDE_DIR						= $(LIBBPF_BUILD_DIR)/usr/include
export LIBBPF_BUILD_LIB64_DIR						= $(LIBBPF_BUILD_DIR)/usr/lib64
export LIBBPF_STATIC_LIB							= libbpf.a
export LIBBPF_SHARED_LIB_1							= libbpf.so
export LIBBPF_SHARED_LIB_2							= libbpf.so.0
export LIBBPF_SHARED_LIB_3							= libbpf.so.0.7.0
export LIBBPF_STATIC_OBJs							= staticobjs
export LIBBPF_SHARED_OBJs							= sharedobjs
export SYSTEM_LIB_PATH								= /usr/lib

# bcc build options		
export PYTHON3										= /usr/bin/python3
export BCC_GIT_LINK 								= https://github.com/iovisor/bcc/
export BCC_SOURCE_DIR 								= $(DEPENDENCIES_DIR)/bcc
export BCC_BUILD_DIR 								= $(BCC_SOURCE_DIR)/build
export BCC_INSTALL_DIR								= /usr/share/bcc/tools

# google test + gmock (bpftrace dependency) build options
export GOOGLETEST_GIT_LINK 							= https://github.com/google/googletest/
export GOOGLETEST_SOURCE_DIR						= $(DEPENDENCIES_DIR)/googletest
export GOOGLETEST_BUILD_DIR							= $(GOOGLETEST_SOURCE_DIR)/build

# bpftrace build options		
export BPFTRACE_GIT_LINK							= https://github.com/iovisor/bpftrace/
export BPFTRACE_SOURCE_DIR 							= $(DEPENDENCIES_DIR)/bpftrace
export BPFTRACE_BUILD_DIR 							= $(BPFTRACE_SOURCE_DIR)/build
export BPFTRACE_PROBE_LOG							= { printf("%s %u [%u] %u %s\n", comm, pid, cpu, elapsed, probe); }

# dtrace build options		
export DTRACE_SOURCE_DIR							= $(DEPENDENCIES_DIR)/linux
export DTRACE_BUILD_DIR 							= $(DTRACE_SOURCE_DIR)/build
export DTRACE_GIT_LINK 								= https://github.com/dtrace4linux/linux.git

# usdt trace utilities		
export OVS_USDT_UTILITIES							= ovs/utilities/usdt-scripts
export OVS_USDT_VSWITCHD_HIST_SCRIPT				= $(OVS_USDT_UTILITIES)/bridge_loop.bt
export OVS_USDT_UPCALL_MONITOR_SCRIPT				= $(OVS_USDT_UTILITIES)/upcall_monitor.py
export OVS_USDT_UPCALL_COST_SCRIPT					= $(OVS_USDT_UTILITIES)/upcall_cost.py

# project variables		
export BIN_DIR 										= bin
export CONFIG_DIR 									= $(PWD)/config
export CONTAINER_MOUNT_DIR 							= /tmp/ovs-tests
export CONTAINER_SETUP_SCRIPT 						= setup-container.sh

# general experiment variables		
export DOCKER_IMAGE_NAME 							= ovs-experiments/debug-containers
export BRIDGE_IP 									= 192.168.0.1
export BRIDGE_NETMASK 								= 255.255.255.0
export BRIDGE_NAME 									= test-br
export SIDE_BRIDGE_NAME 							= test-sys-br
export TX_CONTAINER_NAME 							= tx
export RX_CONTAINER_NAME 							= rx
export CONTAINER_INTERFACE_NAME 					= ovs-eth1
export CONTAINER_VF_INTERFACE_NAME 					= enp210s0f0v0
export TX_CONTAINER_IP 								= 192.168.0.10
export RX_CONTAINER_IP 								= 192.168.0.20
export IP_PREFIX 									= 24
export IPERF_FOR_N_SECONDS 							= 10
export IPERF_BW 									= 10000M
export PYTHON 										= python3

# NSX ovs configurations
export NSX_OVS_CONFIGURATION_DB_FILE				= $(CONFIG_DIR)/conf.db
export NSX_OPENFLOW_RULE_SET						= $(CONFIG_DIR)/ovs-ofctl-dump-flows-nsx-managed.out
export CLASSBENCH_ACL1_2_OPENFLOW_RULE_SET			= $(CONFIG_DIR)/acl1_2_mapped_rules.txt
export CLASSBENCH_ACL1_250_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl1_100_ovs_kernel_mapped_rules.txt

# full rule sets generated from classbench
export CLASSBENCH_ACL1_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl1_500K_mapped_rules.txt
export CLASSBENCH_ACL2_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl2_500K_mapped_rules.txt
export CLASSBENCH_ACL3_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl3_500K_mapped_rules.txt
export CLASSBENCH_ACL4_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl4_500K_mapped_rules.txt
export CLASSBENCH_ACL5_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/acl5_500K_mapped_rules.txt
export CLASSBENCH_FW1_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw1_500K_mapped_rules.txt
export CLASSBENCH_FW2_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw2_500K_mapped_rules.txt
export CLASSBENCH_FW3_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw3_500K_mapped_rules.txt
export CLASSBENCH_FW4_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw4_500K_mapped_rules.txt
export CLASSBENCH_FW5_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw5_500K_mapped_rules.txt
export CLASSBENCH_IPC1_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/ipc1_500K_mapped_rules.txt
export CLASSBENCH_IPC2_500K_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/ipc2_500K_mapped_rules.txt

export CLASSBENCH_FW1_2000_OPENFLOW_RULE_SET		= $(CONFIG_DIR)/fw1_2000_mapped_rules.txt

# connect-x6 interface variables
export CONNECT_X6_INTF_1_PCI_ADDRESS 				= 0000:d2:00.0
export CONNECT_X6_INTF_2_PCI_ADDRESS 				= 0000:d2:00.1
export CONNECT_X6_INTF_1_PCI_ADDRESS_2 				= 0000:d2:00
export CONNECT_X6_INTF_2_PCI_ADDRESS_2 				= 0000:d2:01

export CONNECT_X6_INTF_1_VF_0_PCI_ADDRESS 			= $(CONNECT_X6_INTF_1_PCI_ADDRESS_2).2
# export CONNECT_X6_INTF_1_VF_1_PCI_ADDRESS 			= $(CONNECT_X6_INTF_1_PCI_ADDRESS_2).3
# export CONNECT_X6_INTF_1_VF_2_PCI_ADDRESS 			= $(CONNECT_X6_INTF_1_PCI_ADDRESS_2).4
# export CONNECT_X6_INTF_1_VF_3_PCI_ADDRESS 			= $(CONNECT_X6_INTF_1_PCI_ADDRESS_2).5
export CONNECT_X6_INTF_2_VF_0_PCI_ADDRESS 			= $(CONNECT_X6_INTF_2_PCI_ADDRESS_2).2
# export CONNECT_X6_INTF_2_VF_1_PCI_ADDRESS 			= $(CONNECT_X6_INTF_2_PCI_ADDRESS_2).3
# export CONNECT_X6_INTF_2_VF_2_PCI_ADDRESS 			= $(CONNECT_X6_INTF_2_PCI_ADDRESS_2).4
# export CONNECT_X6_INTF_2_VF_3_PCI_ADDRESS 			= $(CONNECT_X6_INTF_2_PCI_ADDRESS_2).5

export CONNECT_X6_INTF_1_VF_0_MAC_ADDRESS 			= e4:11:22:33:44:50
# export CONNECT_X6_INTF_1_VF_1_MAC_ADDRESS 			= e4:11:22:33:44:51
# export CONNECT_X6_INTF_1_VF_2_MAC_ADDRESS 			= e4:11:22:33:44:52
# export CONNECT_X6_INTF_1_VF_3_MAC_ADDRESS 			= e4:11:22:33:44:53

export CONNECT_X6_INTF_2_VF_0_MAC_ADDRESS 			= e4:11:22:33:44:60
# export CONNECT_X6_INTF_2_VF_1_MAC_ADDRESS 			= e4:11:22:33:44:61
# export CONNECT_X6_INTF_2_VF_2_MAC_ADDRESS 			= e4:11:22:33:44:62
# export CONNECT_X6_INTF_2_VF_3_MAC_ADDRESS 			= e4:11:22:33:44:63

export CONNECT_X6_INTF_1_NAME 						= enp210s0f0np0
export CONNECT_X6_INTF_2_NAME 						= enp210s0f1np1

export OVS_DPDK_BRIDGE_CX6_PORT_1					= cx61
export OVS_DPDK_BRIDGE_CX6_PORT_2					= cx62

export OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1				= $(OVS_DPDK_BRIDGE_CX6_PORT_1)1
# export OVS_DPDK_BRIDGE_CX6_PORT_1_VF_2				= $(OVS_DPDK_BRIDGE_CX6_PORT_1)2
# export OVS_DPDK_BRIDGE_CX6_PORT_1_VF_3				= $(OVS_DPDK_BRIDGE_CX6_PORT_1)3
# export OVS_DPDK_BRIDGE_CX6_PORT_1_VF_4				= $(OVS_DPDK_BRIDGE_CX6_PORT_1)4

export OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1				= $(OVS_DPDK_BRIDGE_CX6_PORT_2)1
# export OVS_DPDK_BRIDGE_CX6_PORT_2_VF_2				= $(OVS_DPDK_BRIDGE_CX6_PORT_2)2
# export OVS_DPDK_BRIDGE_CX6_PORT_2_VF_3				= $(OVS_DPDK_BRIDGE_CX6_PORT_2)3
# export OVS_DPDK_BRIDGE_CX6_PORT_2_VF_4				= $(OVS_DPDK_BRIDGE_CX6_PORT_2)4

export NGA1_CX6_INTF_1_IP							= 172.16.0.10
export NGA1_CX6_INTF_2_IP							= 172.17.0.10
export NGA3_CX6_INTF_1_IP							= 172.16.0.30
export NGA3_CX6_INTF_2_IP							= 172.17.0.30

# specific experiment variables		
export EXPERIMENTS 									= experiments
export SINGLE_PACKET_EXPERIMENTS 					= $(EXPERIMENTS)/single-packet

# condensed commands
export SUDO 										= echo $(USER_PASSWORD) | sudo -S
export OVS-CTL 										= $(SUDO) env "PATH=$$PATH" ovs-ctl
export OVS-VSCTL 									= $(SUDO) -s ovs-vsctl
export OVS-OFCTL 									= $(SUDO) -s ovs-ofctl
export OVS-APPCTL 									= $(SUDO) -s ovs-appctl

########################################################### PCI commands #############################################################
show-pci-devices:
	$(SUDO) lshw -c network -businfo

########################################################### setup mlnx driver #############################################################
restart-mlnx-driver:
	@echo Please run this target as root [sudo -s]
	/etc/init.d/openibd restart

########################################################### Git help #############################################################

git-cache:
	git config --global credential.helper "cache --timeout=86400"

git-show-all-submodules:
	git config --file .gitmodules --get-regexp path | awk '{ print $2 }'

######################################################## OVS installation ########################################################

get-ovs:
	git submodule update --init $(OVS_SUBMODULE)

# usdt probe module
get-systemtap:
	$(SUDO) apt-get install systemtap-sdt-dev

$(OVS_BUILD_DIR):
	@echo "[LOG] Creating OVS Build Directory => $(OVS_BUILD_DIR)"
	mkdir $(OVS_BUILD_DIR)

boot-ovs-build: 
	cd $(OVS_SOURCE_DIR) && ./boot.sh

configure-ovs-build: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_BUILD_FLAGS) CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

configure-ovs-build-with-usdt: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_BUILD_FLAGS) $(OVS_USDT_BUILD_FLAG) \
				CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

configure-ovs-build-with-dpdk: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_BUILD_FLAGS_WITH_DPDK) CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

configure-ovs-build-with-usdt-dpdk: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_USDT_BUILD_FLAG) $(OVS_BUILD_FLAGS_WITH_DPDK) \
				CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

configure-ovs-build-with-kernel-module: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_BUILD_FLAGS_WITH_KERNEL_MODULE) CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

configure-ovs-build-with-usdt-kernel-module: boot-ovs-build | $(OVS_BUILD_DIR)
	cd $(OVS_BUILD_DIR) && (.././$(OVS_BUILD_CONFIGURE_SCRIPT) $(OVS_USDT_BUILD_FLAG) $(OVS_BUILD_FLAGS_WITH_KERNEL_MODULE) \
				CC=$(OVS_BUILD_C_COMPILER) CFLAGS=$(OVS_BUILD_CFLAGS))

build-ovs-with-debug-symbols:
	cd $(OVS_BUILD_DIR) && make -j4

install-ovs:
	cd $(OVS_BUILD_DIR) && $(SUDO) -s make install

install-ovs-kernel-modules:
	cd $(OVS_BUILD_DIR) && $(SUDO) -s make modules_install

build-and-install-ovs-dpdk: configure-ovs-build-with-dpdk build-ovs-with-debug-symbols install-ovs

############################################################ clean ovs ############################################################

clean-ovs-run: clear-perf-cache clear-pmd-statistics delete-bridge clear-ovsdb-table delete-log-file stop-ovs

clean-ovs-build:
	-$(SUDO) rm -rf $(OVS_BUILD_DIR)

clean-ovs-install:
	-$(SUDO) rm -rf $(OVS_INSTALL_DIR_1)/ovs*
	-$(SUDO) rm -rf $(OVS_INSTALL_DIR_2)/ovs*
	-$(SUDO) rm -rf $(OVS_INSTALL_DIR_3)/ovs*
	-$(SUDO) rm -rf $(OVS_SCRIPTS_PATH)/ovs*

clean-ovs: clean-ovs-run clean-ovs-build clean-ovs-install

######################################################## DPDK installation ########################################################

get-dpdk:
	cd $(DEPENDENCIES_DIR) && git clone $(DPDK_GIT_LINK)
	cd $(DPDK_SOURCE_DIR) && git checkout $(DPDK_VERSION)

# cd $(DPDK_SOURCE_DIR) && meson configure 
configure-dpdk:
	cd $(DPDK_SOURCE_DIR) && meson -Denable_kmods=true -Denable_trace_fp=true build

build-dpdk:
	cd $(DPDK_SOURCE_DIR) && ninja -C build

install-dpdk:
	cd $(DPDK_SOURCE_DIR) && $(SUDO) ninja -C build install

show-dpdk-version:
	pkg-config --modversion libdpdk

######################################################## DPDK operation ########################################################

is-dpdk-initialized-for-ovs:
	$(OVS-VSCTL) get Open_vSwitch . dpdk_initialized

setup-vfio-driver:
	modprobe vfio-pci
	$(SUDO) /usr/bin/chmod a+x /dev/vfio
	$(SUDO) /usr/bin/chmod 0666 /dev/vfio/*

bind-connect-x6-NIC-to-DPDK-using-mlx5_core:
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=mlx5_core $(CONNECT_X6_INTF_1_PCI_ADDRESS)
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=mlx5_core $(CONNECT_X6_INTF_2_PCI_ADDRESS)

bind-connect-x6-NIC-to-DPDK-using-igb_uio:
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=igb_uio $(CONNECT_X6_INTF_1_PCI_ADDRESS)
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=igb_uio $(CONNECT_X6_INTF_2_PCI_ADDRESS)

bind-connect-x6-NIC-to-DPDK-using-vfio: setup-vfio-driver
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=vfio-pci $(CONNECT_X6_INTF_1_PCI_ADDRESS)
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --bind=vfio-pci $(CONNECT_X6_INTF_2_PCI_ADDRESS)

unbind-connect-x6-NIC-from-DPDK:
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --unbind $(CONNECT_X6_INTF_1_PCI_ADDRESS)
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --unbind $(CONNECT_X6_INTF_2_PCI_ADDRESS)

show-dpdk-device-status:
	$(SUDO) $(DPDK_INSTALL_DIR)/dpdk-devbind.py --status

clean-dpdk-build:
	-$(SUDO) rm -rf $(DPDK_BUILD_DIR)

################################################### interfaces ###################################################
set-nga1-interfaces-down:
	$(SUDO) ip addr del $(NGA1_CX6_INTF_1_IP)/24 dev $(CONNECT_X6_INTF_1_NAME)
	$(SUDO) ip addr del $(NGA1_CX6_INTF_2_IP)/24 dev $(CONNECT_X6_INTF_2_NAME)
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_1_NAME) down
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_2_NAME) down

set-nga3-interfaces-down:
	$(SUDO) ip addr del $(NGA3_CX6_INTF_1_IP)/24 dev $(CONNECT_X6_INTF_1_NAME)
	$(SUDO) ip addr del $(NGA3_CX6_INTF_2_IP)/24 dev $(CONNECT_X6_INTF_2_NAME)
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_1_NAME) down
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_2_NAME) down

setup-nga1-connect-x6-intf-1:
	$(SUDO) ip addr add $(NGA1_CX6_INTF_1_IP)/24 dev $(CONNECT_X6_INTF_1_NAME)

setup-nga1-connect-x6-intf-2:
	$(SUDO) ip addr add $(NGA1_CX6_INTF_2_IP)/24 dev $(CONNECT_X6_INTF_2_NAME)

setup-nga1-interfaces: setup-nga1-connect-x6-intf-1 setup-nga1-connect-x6-intf-2
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_1_NAME) up
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_2_NAME) up

setup-nga3-connect-x6-intf-1:
	$(SUDO) ip addr add $(NGA3_CX6_INTF_1_IP)/24 dev $(CONNECT_X6_INTF_1_NAME)

setup-nga3-connect-x6-intf-2:
	$(SUDO) ip addr add $(NGA3_CX6_INTF_2_IP)/24 dev $(CONNECT_X6_INTF_2_NAME)

setup-nga3-interfaces: setup-nga3-connect-x6-intf-1 setup-nga3-connect-x6-intf-2
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_1_NAME) up
	$(SUDO) ip link set dev $(CONNECT_X6_INTF_2_NAME) up

###################################################### Offload ######################################################
show-ethernet-pci-devices:
	lspci | grep Ethernet

show-mellanox-pci-devices:
	lspci -nn | grep Mellanox

identify-mellanox-NIC:
	ls -l /sys/class/net/ | grep d2:0

show-dpdk-interfaces:
	ip -d link show dev $(CONNECT_X6_INTF_1_NAME)
	@echo 
	ip -d link show dev $(CONNECT_X6_INTF_2_NAME)
	@echo 
	-ip -d link show dev eth0
	@echo 
	-ip -d link show dev eth1

# @echo 
# -ip -d link show dev eth2
# @echo 
# -ip -d link show dev eth3
# @echo 
# -ip -d link show dev eth4
# @echo 
# -ip -d link show dev eth5
# @echo 
# -ip -d link show dev eth6
# @echo 
# -ip -d link show dev eth7
# @echo 
# -ip -d link show dev eth8

# whitelist-mlnx-devices-in-dpdk:
# 	$(OVS-VSCTL) --no-wait set Open_vSwitch . other_config:dpdk-extra="-a $(CONNECT_X6_INTF_1_PCI_ADDRESS) -a $(CONNECT_X6_INTF_2_PCI_ADDRESS)"

# $(OVS-VSCTL) --no-wait set Open_vSwitch . other_config:dpdk-extra="-a $(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=vf[0-3],dv_flow_en=1,dv_esw_en=1,dv_xmeta_en=1 -a $(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=vf[0-3],dv_flow_en=1,dv_esw_en=1,dv_xmeta_en=1"
whitelist-mlnx-devices-with-virtual-functions-in-dpdk:
	$(OVS-VSCTL) --no-wait set Open_vSwitch . other_config:dpdk-extra="-a $(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=[0-65535],dv_flow_en=1,dv_esw_en=1,dv_xmeta_en=1 -a $(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=[0-65535],dv_flow_en=1,dv_esw_en=1,dv_xmeta_en=1"

# physical functions
add-connect-x6-dpdk-pf-1-intf-to-userspace-bridge:
	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_1_PCI_ADDRESS)
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1) options:n_rxq=2

add-connect-x6-dpdk-pf-2-intf-to-userspace-bridge:
	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_2_PCI_ADDRESS)
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2) options:n_rxq=2

# add physical functions to bridge
add-mlnx-physical-functions-to-bridge: add-connect-x6-dpdk-pf-1-intf-to-userspace-bridge add-connect-x6-dpdk-pf-2-intf-to-userspace-bridge

# virtual functions
turn-on-sriov-on-NIC:
	@echo Please run this target as root [sudo -s]
	echo 1 > /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/device/sriov_numvfs
	echo 1 > /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/device/sriov_numvfs

turn-off-sriov-on-NIC:
	@echo Please run this target as root [sudo -s]
	echo 0 > /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/device/sriov_numvfs
	echo 0 > /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/device/sriov_numvfs

setup-virtual-functions-on-physical-function-1:
	@echo Please run this target as root [sudo -s]
	ip link set $(CONNECT_X6_INTF_1_NAME) vf 0 mac $(CONNECT_X6_INTF_1_VF_0_MAC_ADDRESS)

# ip link set $(CONNECT_X6_INTF_1_NAME) vf 0 state auto
# ip link set $(CONNECT_X6_INTF_1_NAME) vf 0 trust on
# ip link set $(CONNECT_X6_INTF_1_NAME) vf 1 mac $(CONNECT_X6_INTF_1_VF_1_MAC_ADDRESS)
# ip link set $(CONNECT_X6_INTF_1_NAME) vf 2 mac $(CONNECT_X6_INTF_1_VF_2_MAC_ADDRESS)
# ip link set $(CONNECT_X6_INTF_1_NAME) vf 3 mac $(CONNECT_X6_INTF_1_VF_3_MAC_ADDRESS)

setup-virtual-functions-on-physical-function-2:
	@echo Please run this target as root [sudo -s]
	ip link set $(CONNECT_X6_INTF_2_NAME) vf 0 mac $(CONNECT_X6_INTF_2_VF_0_MAC_ADDRESS)

# ip link set $(CONNECT_X6_INTF_2_NAME) vf 0 state auto
# ip link set $(CONNECT_X6_INTF_2_NAME) vf 0 trust on
# ip link set $(CONNECT_X6_INTF_2_NAME) vf 1 mac $(CONNECT_X6_INTF_2_VF_1_MAC_ADDRESS)
# ip link set $(CONNECT_X6_INTF_2_NAME) vf 2 mac $(CONNECT_X6_INTF_2_VF_2_MAC_ADDRESS)
# ip link set $(CONNECT_X6_INTF_2_NAME) vf 3 mac $(CONNECT_X6_INTF_2_VF_3_MAC_ADDRESS)

setup-virtual-functions: setup-virtual-functions-on-physical-function-1 setup-virtual-functions-on-physical-function-2

verify-virtual-functions:
	cat /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/device/sriov_numvfs
	cat /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/device/sriov_numvfs
	ip -d link show dev $(CONNECT_X6_INTF_1_NAME)
	ip -d link show dev $(CONNECT_X6_INTF_2_NAME)

# run with root please
unbind-pf1-vfs:
	@echo Please run this target as root [sudo -s]
	-echo $(CONNECT_X6_INTF_1_VF_0_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_1_VF_1_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_1_VF_2_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_1_VF_3_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind

unbind-pf2-vfs:
	@echo Please run this target as root [sudo -s]
	-echo $(CONNECT_X6_INTF_2_VF_0_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_2_VF_1_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_2_VF_2_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind
# -echo $(CONNECT_X6_INTF_2_VF_3_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/unbind

unbind-vfs: unbind-pf1-vfs unbind-pf2-vfs

# e-switch mode change
switch-e-switch-mode-to-switchdev:
	@echo Please run this target as root [sudo -s]
	echo switchdev > /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/compat/devlink/mode
	echo switchdev > /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/compat/devlink/mode

switch-e-switch-mode-to-legacy:
	@echo Please run this target as root [sudo -s]
	echo legacy > /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/compat/devlink/mode
	echo legacy > /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/compat/devlink/mode
 
show-e-switch-mode-of-NIC:
	@echo Please run this target as root [sudo -s]
	cat /sys/class/net/$(CONNECT_X6_INTF_1_NAME)/compat/devlink/mode
	cat /sys/class/net/$(CONNECT_X6_INTF_2_NAME)/compat/devlink/mode

bind-pf1-vfs:
	@echo Please run this target as root [sudo -s]
	-echo $(CONNECT_X6_INTF_1_VF_0_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_1_VF_1_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_1_VF_2_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_1_VF_3_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind

bind-pf2-vfs:
	@echo Please run this target as root [sudo -s]
	-echo $(CONNECT_X6_INTF_2_VF_0_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_2_VF_1_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_2_VF_2_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind
# -echo $(CONNECT_X6_INTF_2_VF_3_PCI_ADDRESS) > /sys/bus/pci/drivers/mlx5_core/bind

bind-vfs: bind-pf1-vfs bind-pf2-vfs

# add virtual functions to bridge
add-connect-x6-dpdk-pf-1-vf-0-intf-to-userspace-bridge:
	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) type=dpdk options:dpdk-devargs="class=eth,mac=$(shell cat /sys/class/net/eth0/address)"
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) options:n_rxq=2

#$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=[0]

# add-connect-x6-dpdk-pf-1-vf-1-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_2) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_2) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=[1]

# add-connect-x6-dpdk-pf-1-vf-2-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_3) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_3) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=[2]

# add-connect-x6-dpdk-pf-1-vf-3-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_4) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_4) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_1_PCI_ADDRESS),representor=[3]

add-connect-x6-dpdk-pf-2-vf-0-intf-to-userspace-bridge:
	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) type=dpdk options:dpdk-devargs="class=eth,mac=$(shell cat /sys/class/net/eth1/address)"
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) options:n_rxq=2

#$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=[0]

# add-connect-x6-dpdk-pf-2-vf-1-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_2) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_2) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=[1]

# add-connect-x6-dpdk-pf-2-vf-2-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_3) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_3) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=[2]

# add-connect-x6-dpdk-pf-2-vf-3-intf-to-userspace-bridge:
# 	$(OVS-VSCTL) add-port $(BRIDGE_NAME)-0 $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_4) -- set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_4) type=dpdk options:dpdk-devargs=$(CONNECT_X6_INTF_2_PCI_ADDRESS),representor=[3]

# add-mlnx-virtual-functions-to-bridge: \
# 	add-connect-x6-dpdk-pf-1-vf-0-intf-to-userspace-bridge add-connect-x6-dpdk-pf-1-vf-1-intf-to-userspace-bridge \
# 	add-connect-x6-dpdk-pf-1-vf-2-intf-to-userspace-bridge add-connect-x6-dpdk-pf-1-vf-3-intf-to-userspace-bridge \
# 	add-connect-x6-dpdk-pf-2-vf-0-intf-to-userspace-bridge add-connect-x6-dpdk-pf-2-vf-1-intf-to-userspace-bridge \
# 	add-connect-x6-dpdk-pf-2-vf-2-intf-to-userspace-bridge add-connect-x6-dpdk-pf-2-vf-3-intf-to-userspace-bridge

add-mlnx-virtual-functions-to-bridge: \
	add-connect-x6-dpdk-pf-1-vf-0-intf-to-userspace-bridge add-connect-x6-dpdk-pf-2-vf-0-intf-to-userspace-bridge

root-setup-dpdk-bridge: \
	turn-on-sriov-on-NIC \
	show-pci-devices \
	setup-virtual-functions \
	verify-virtual-functions \
	unbind-vfs \
	switch-e-switch-mode-to-switchdev \
	bind-vfs

# whitelist-mlnx-devices-with-virtual-functions-in-dpdk
############## Simple DPDK Bridge ################
setup-dpdk-bridge: \
	ovs-initialize-dpdk \
	ovs-enable-pmd-performance-metrics \
	set-ovs-nhandler-nrevalidator-threads-to-1 \
	add-bridge-with-userspace-datapath \
	add-mlnx-physical-functions-to-bridge \
	add-mlnx-virtual-functions-to-bridge

############## HW offloaded DPDK Bridge ################
setup-dpdk-hw-offloaded-bridge: \
	ovs-initialize-dpdk \
	ovs-enable-hardware-offload \
	ovs-enable-pmd-performance-metrics \
	assign-1-core-to-pmd-threads \
	set-ovs-nhandler-nrevalidator-threads-to-4 \
	add-bridge-with-userspace-datapath \
	add-mlnx-physical-functions-to-bridge \
	add-mlnx-virtual-functions-to-bridge

###################################################### pmd statistics ######################################################
show-pmd-statistics:
	$(OVS-APPCTL) dpif-netdev/pmd-perf-show

clear-pmd-statistics:
	-$(OVS-APPCTL) dpif-netdev/pmd-stats-clear

###################################################### perf ######################################################
install-perf:
	$(SUDO) apt-get install -y linux-tools-common linux-tools-generic linux-tools-$(shell uname -r)

###################################################### Google Test + GMock ######################################################
# https://github.com/google/googletest/blob/main/googletest/README.md

$(GOOGLETEST_BUILD_DIR):
	@echo "[LOG] Creating GoogleTest Build Directory => $(GOOGLETEST_BUILD_DIR)"
	mkdir $(GOOGLETEST_BUILD_DIR)

cmake-googletest: | $(GOOGLETEST_BUILD_DIR)
	cd $(GOOGLETEST_BUILD_DIR) && cmake ..

build-googletest: cmake-googletest
	cd $(GOOGLETEST_BUILD_DIR) && make

install-googletest:
	cd $(GOOGLETEST_BUILD_DIR) && $(SUDO) make install

clean-googletest-build:
	-rm -rf $(GOOGLETEST_BUILD_DIR)

####################################################### libbpf installation ########################################################
# https://github.com/libbpf/libbpf

install-libbpf-deps:
	$(SUDO) apt install libelf-dev

build-libbpf:
	-mkdir $(LIBBPF_BUILD_DIR)
	cd $(LIBBPF_SOURCE_DIR)/src && DESTDIR=$(LIBBPF_BUILD_DIR) make install

# $(SUDO) cp $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_STATIC_LIB) $(SYSTEM_LIB_PATH)
# $(SUDO) cp $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_1) $(SYSTEM_LIB_PATH)
# $(SUDO) cp $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_2) $(SYSTEM_LIB_PATH)
# $(SUDO) cp $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_3) $(SYSTEM_LIB_PATH)
# $(SUDO) cp -r $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_STATIC_OBJs) $(SYSTEM_LIB_PATH)
# $(SUDO) cp -r $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_OBJs) $(SYSTEM_LIB_PATH)
install-libbpf:
	$(SUDO) cp -r $(LIBBPF_BUILD_INCLUDE_DIR)/* /usr/include/
	$(SUDO) cp -r $(LIBBPF_BUILD_LIB64_DIR)/* /usr/lib64/
	
clean-libbpf-build:
	-rm -rf $(LIBBPF_BUILD_DIR)
	-rm -rf $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_STATIC_LIB)
	-rm -rf $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_1) 
	-rm -rf $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_2)
	-rm -rf $(LIBBPF_SOURCE_DIR)/src/$(LIBBPF_SHARED_LIB_3)

####################################################### BCC installation ########################################################
# https://github.com/iovisor/bcc/blob/master/INSTALL.md#ubuntu---source

install-bcc-deps:
	$(SUDO) apt-get -y install bison build-essential cmake flex git libedit-dev llvm-12-dev llvm-12-runtime libclang-12-dev clang-12 \
				zlib1g-dev libelf-dev libfl-dev python3-distutils
	$(SUDO) apt-get -y install arping bison dh-python dpkg-dev pkg-kde-tools ethtool inetutils-ping iperf netperf \
			libzip-dev linux-libc-dev libluajit-5.1-dev luajit python3-netaddr python3-pyroute2

$(BCC_BUILD_DIR):
	@echo "[LOG] Creating BCC Build Directory => $(BCC_BUILD_DIR)"
	mkdir $(BCC_BUILD_DIR)

build-bcc: | $(BCC_BUILD_DIR)
	cd $(BCC_BUILD_DIR) && cmake ..
	cd $(BCC_BUILD_DIR) && make

install-bcc:
	cd $(BCC_BUILD_DIR) && $(SUDO) make install

build-bcc-python-bindings:
	cd $(BCC_BUILD_DIR) && cmake -DPYTHON_CMD=python3 .. # build python3 binding
	cd $(BCC_BUILD_DIR)/src/python/ && make

install-bcc-python-bindings:
	cd $(BCC_BUILD_DIR)/src/python/ && $(SUDO) make install

clean-bcc-build:
	-rm -rf $(BCC_BUILD_DIR)

#################################################### BPFTRACE installation ######################################################
# https://github.com/iovisor/bpftrace/blob/master/INSTALL.md

# not recommended
install-bpftrace-from-snap:
	$(SUDO) snap install --devmode bpftrace
	$(SUDO) snap connect bpftrace:system-trace

# https://askubuntu.com/questions/1332666/how-to-install-llvm-12-for-ubuntu-16-04
install-bpftrace-deps:
	printf "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-12 main" | sudo tee /etc/apt/sources.list.d/llvm-toolchain-xenial-12.list
	wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
	$(SUDO) apt update
	$(SUDO) apt-get install -y bison cmake flex g++ git libelf-dev zlib1g-dev libfl-dev systemtap-sdt-dev binutils-dev libcereal-dev \
				llvm-12-dev llvm-12-runtime libclang-12-dev clang-12 libgtest-dev asciidoctor

$(BPFTRACE_BUILD_DIR):
	@echo "[LOG] Creating BPFTRACE Build Directory => $(BPFTRACE_BUILD_DIR)"
	mkdir $(BPFTRACE_BUILD_DIR)

build-bpftrace: | $(BPFTRACE_BUILD_DIR)
	cd $(BPFTRACE_BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Release ..
	cd $(BPFTRACE_BUILD_DIR) && make -j8

install-bpftrace:
	cd $(BPFTRACE_BUILD_DIR) && $(SUDO) make install

clean-bpftrace-build:
	-rm -rf $(BPFTRACE_BUILD_DIR)

###################################################### DTRACE installation ######################################################

get-dtrace: install-bpftrace
	$(SUDO) apt-get install systemtap-sdt-dev

# fix for proxmox specific headers
# install-bpftrace:
# 	$(SUDO) apt-get install -y bpftrace

# 	cd $(DEPENDENCIES_DIR) && git clone $(DTRACE_GIT_LINK)
# 	sed --in-place 's/linux-headers-$$(uname -r)/pve-headers-5.3/' $(DTRACE_SOURCE_DIR)/tools/get-deps.pl
# 	cd $(DTRACE_SOURCE_DIR) && tools/get-deps.pl

# build-dtrace:
# 	cd $(DTRACE_SOURCE_DIR) && make all

# install-dtrace:
# 	cd $(DTRACE_SOURCE_DIR) && make install
# 	cd $(DTRACE_SOURCE_DIR) && sudo make load

####################################################### USDT Targets ##########################################################
# OVS 2.17.90 Documentation (Released Feb 2022)

# http://www.openvswitch.org/support/ovscon2021/slides/debugging_using_tracepoints.pdf
show-elf-tracepoint-info:
	readelf -n $(OVS_INSTALL_DIR_1)/$(OVS_VSWITCHD_EXECUTABLE_NAME)

# apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`
setup-perf-cache:
	$(SUDO) perf buildid-cache --add $(shell which ovs-vswitchd) -v

clear-perf-cache:
	-$(SUDO) perf buildid-cache --remove $(shell which ovs-vswitchd) -v

list-tracepoints-using-perf:
	$(SUDO) perf list | grep sdt_

# enable-uprobe-usdts: setup-perf-cache
# 	$(SUDO) perf probe --add=sdt_main:run_start \
# 				--add=sdt_main:poll_block \
# 				--add=sdt_dpif_recv:recv_upcall \
# 				--add=sdt_dpif_netlink_operate__:op_flow_put \
# 				--add=sdt_dpif_netlink_operate__:op_flow_get \
# 				--add=sdt_dpif_netlink_operate__:op_flow_execute \
# 				--add=sdt_dpif_netlink_operate__:op_flow_del

enable-uprobe-usdts: setup-perf-cache
	$(SUDO) perf probe --add=sdt_main:run_start \
			--add=sdt_main:poll_block \
			--add=sdt_upcall_cb:netdev_upcall \
			--add=sdt_dp_netdev_upcall:netdev_dp_upcall \
			--add=sdt_dpif_netdev_operate:netdev_op_flow_put \
			--add=sdt_dpif_netdev_operate:netdev_op_flow_get \
			--add=sdt_dpif_netdev_operate:netdev_op_flow_execute \
			--add=sdt_dpif_netdev_operate:netdev_op_flow_del \
			--add=sdt_dp_netdev_execute_actions:netdev_dp_execute

# record-events-using-perf-tracepoints:
# 	$(SUDO) perf record -e sdt_main:run_start -e sdt_main:poll_block \
# 				-e sdt_dpif_recv:recv_upcall \
# 				-e sdt_dpif_netlink_operate__:op_flow_put \
# 				-e sdt_dpif_netlink_operate__:op_flow_get \
# 				-e sdt_dpif_netlink_operate__:op_flow_execute \
# 				-e sdt_dpif_netlink_operate__:op_flow_del \
# 				-p $(shell pidof ovs-vswitchd) sleep 30

record-events-using-perf-tracepoints:
	$(SUDO) perf record -e sdt_main:run_start \
			-e sdt_main:poll_block \
			-e sdt_upcall_cb:netdev_upcall \
			-e sdt_dp_netdev_upcall:netdev_dp_upcall \
			-e sdt_dpif_netdev_operate:netdev_op_flow_put \
			-e sdt_dpif_netdev_operate:netdev_op_flow_get \
			-e sdt_dpif_netdev_operate:netdev_op_flow_execute \
			-e sdt_dpif_netdev_operate:netdev_op_flow_del \
			-e sdt_dp_netdev_execute_actions:netdev_dp_execute \
			-p $(shell pidof ovs-vswitchd) sleep 30

show-recorded-events-from-perf:
	$(SUDO) perf script

disable-uprobe-usdts:
	$(SUDO) perf probe -d \*

clean-perf-record:
	-$(SUDO) rm -rf $(PERF_EVENTS_RECORD)

# bpftrace ##################

list-tracepoints-using-bpftrace:
	$(SUDO) bpftrace -l "usdt:$(shell which ovs-vswitchd):*"

list-all-tracepoints-using-bpftrace:
	$(SUDO) bpftrace -lp $(shell pidof ovs-vswitchd) "usdt:*"

# -e 'usdt::dpif_recv:* { printf("%s %u [%u] %u %s\n", comm, pid, cpu, elapsed, probe); }'
# -e 'usdt::dpif_netlink_operate__:* { printf("%s %u [%u] %u %s\n", comm, pid, cpu, elapsed, probe); }'
bpftrace-show-tracepoints-being-hit:
	$(SUDO) bpftrace -p $(shell pidof ovs-vswitchd) \
		-e 'usdt::main:* $(BPFTRACE_PROBE_LOG) usdt::dpif_recv:recv_upcall $(BPFTRACE_PROBE_LOG) usdt::upcall_cb:netdev_upcall $(BPFTRACE_PROBE_LOG) usdt::dpif_netlink_operate__:* $(BPFTRACE_PROBE_LOG)'

# bcc #######################

list-tracepoints-using-bcc:
	$(SUDO) $(PYTHON3) $(BCC_INSTALL_DIR)/tplist -vv -l $(shell which ovs-vswitchd)

bcc-show-tracepoints-being-hit:
	$(SUDO) $(PYTHON3) $(BCC_INSTALL_DIR)/trace -T -p $(shell pidof ovs-vswitchd) \
		'u::main:run_start' \
		'u::main:poll_block' \
		'u::dpif_recv:recv_upcall' \
		'u::upcall_cb:netdev_upcall' \
		'u::dpif_netlink_operate__:op_flow_put' \
		'u::dpif_netlink_operate__:op_flow_get' \
		'u::dpif_netlink_operate__:op_flow_execute' \
		'u::dpif_netlink_operate__:op_flow_del'

usdt-generate-vswitchd-bridge-histograms:
	$(SUDO) ./$(OVS_USDT_VSWITCHD_HIST_SCRIPT) -p `pidof ovs-vswitchd`

usdt-monitor-upcalls:
	$(SUDO) $(PYTHON3) $(OVS_USDT_UPCALL_MONITOR_SCRIPT)

usdt-measure-upcall-cost:
	$(SUDO) $(PYTHON3) $(OVS_USDT_UPCALL_COST_SCRIPT)

######################################################### Hugepages ###########################################################

hugepages:
	$(SUDO) sysctl -w vm.nr_hugepages=N # where N = No. of 2M huge pages

# 	mkdir -p /dev/hugepages
#   mountpoint -q /dev/hugepages || mount -t hugetlbfs nodev /dev/hugepages
#   echo 64 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages

######################################################## Docker build #########################################################

build-docker-image:
	cd $(CONFIG_DIR) && docker build -t $(DOCKER_IMAGE_NAME) .

######################################################## Docker clean #########################################################

clean-docker-image:
	docker rmi $(DOCKER_IMAGE_NAME)

clean-dangling-images:
	docker rmi -f $(docker images -f "dangling=true" -q)

clean-containers:
	# -docker rm $(TX_CONTAINER_NAME)
	# -docker rm $(RX_CONTAINER_NAME)
	-rm -rf $(CONTAINER_MOUNT_DIR)

################################################## OVS show and set commands ##################################################

show-ovs-version:
	ovs-vswitchd --version

# --ovs-vswitchd-options='--enable-dummy' 
start-ovs:
	$(OVS-CTL) start --system-id=$(OVS_SYSTEM_ID)

start-ovs-with-NSX-configuration-db:
	$(OVS-CTL) start --system-id=$(OVS_SYSTEM_ID) --db-file=$(CONFIG_DIR)/conf.db

ovs-initialize-dpdk:	
	$(OVS-VSCTL) --no-wait set Open_vSwitch . other_config:dpdk-init=true

ovs-enable-hardware-offload:
	$(OVS-VSCTL) set Open_vSwitch . other_config:hw-offload=true

ovs-enable-hw-offload-debug:
	$(OVS-APPCTL) vlog/set netdev_offload dbg

show-interface-offload-capabilities:
	@echo Please run this target as root [sudo -s]
	ethtool -k $(CONNECT_X6_INTF_1_NAME) | grep offload
	@echo
	ethtool -k $(CONNECT_X6_INTF_1_NAME) | grep offload

show-offload-debug:
	$(OVS-APPCTL) vlog/list | grep offload

ovs-enable-tc-skip-sw:
	$(OVS-VSCTL) set Open_vSwitch . other_config:tc-policy=skip_sw

ovs-enable-pmd-performance-metrics:
	$(OVS-VSCTL) set Open_vSwitch . other_config:pmd-perf-metrics=true

show-ovs-status:
	$(OVS-CTL) status

show-ovs-related-processes:
	ps -ef | grep ovs

stop-ovs:
	$(OVS-CTL) stop

set-ovs-nhandler-nrevalidator-threads-to-1:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-handler-threads=1
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-revalidator-threads=1

set-ovs-nhandler-nrevalidator-threads-to-2:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-handler-threads=2
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-revalidator-threads=2

set-ovs-nhandler-nrevalidator-threads-to-4:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-handler-threads=4
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-revalidator-threads=4

set-ovs-nhandler-nrevalidator-threads-to-16:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-handler-threads=16
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:n-revalidator-threads=16

assign-1-core-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x01

assign-2-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x03

assign-3-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x7

assign-4-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x0F

assign-5-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x1F

assign-6-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x3F

assign-8-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0xFF

assign-16-cores-to-pmd-threads:
	$(SUDO) ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0xFFFF

set-rxq-count-per-interface-to-4:
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1) options:n_rxq=4
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2) options:n_rxq=4
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) options:n_rxq=4
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) options:n_rxq=4

set-rxq-count-per-interface-to-8:
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1) options:n_rxq=8
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2) options:n_rxq=8
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) options:n_rxq=8
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) options:n_rxq=8

set-rxq-count-per-interface-to-16:
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1) options:n_rxq=16
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2) options:n_rxq=16
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_1_VF_1) options:n_rxq=16
	$(OVS-VSCTL) set Interface $(OVS_DPDK_BRIDGE_CX6_PORT_2_VF_1) options:n_rxq=16

$(OVS_PID_FILE):
	echo "PID file [$(OVS_PID_FILE)] does not exist. OVS is not running!"
	false

show-ovs-threads: | $(OVS_PID_FILE)
	# @echo OVS PID file => $(OVS_PID_FILE)
	ps -T -p $(shell cat $(OVS_PID_FILE))

######################################################## OVS experiment ########################################################
add-bridge:
	$(OVS-VSCTL) add-br $(BRIDGE_NAME)-0 -- set Bridge $(BRIDGE_NAME)-0 fail-mode=secure
	$(SUDO) -s ifconfig $(BRIDGE_NAME)-0 $(BRIDGE_IP) netmask $(BRIDGE_NETMASK) up

add-system-bridge:
	$(OVS-VSCTL) add-br $(SIDE_BRIDGE_NAME)-0 -- set Bridge $(SIDE_BRIDGE_NAME)-0 fail-mode=secure
	$(SUDO) -s ifconfig $(SIDE_BRIDGE_NAME)-0 $(BRIDGE_IP) netmask $(BRIDGE_NETMASK) up

# $(SUDO) -s ifconfig $(BRIDGE_NAME)-0 $(BRIDGE_IP) netmask $(BRIDGE_NETMASK) up
add-bridge-with-userspace-datapath:
	$(OVS-VSCTL) add-br $(BRIDGE_NAME)-0 -- set bridge $(BRIDGE_NAME)-0 datapath_type=netdev -- set Bridge $(BRIDGE_NAME)-0 fail-mode=secure

delete-bridge:
	-$(OVS-VSCTL) del-br $(BRIDGE_NAME)-0

delete-system-bridge:
	-$(OVS-VSCTL) del-br $(SIDE_BRIDGE_NAME)-0

$(CONTAINER_MOUNT_DIR):
	@echo "[LOG] Making $(CONTAINER_MOUNT_DIR)"
	mkdir $(CONTAINER_MOUNT_DIR)

copy-deps-to-containers-mount-dir:
	cp -r $(BIN_DIR)/$(CONTAINER_SETUP_SCRIPT) Makefile $(EXPERIMENTS) $(CONTAINER_MOUNT_DIR)

tx-container: | $(CONTAINER_MOUNT_DIR) copy-deps-to-containers-mount-dir
	MOUNT_DIR=$(CONTAINER_MOUNT_DIR) CONTAINER_NAME=$(TX_CONTAINER_NAME) $(CONTAINER_MOUNT_DIR)/$(CONTAINER_SETUP_SCRIPT)

rx-container: | $(CONTAINER_MOUNT_DIR) copy-deps-to-containers-mount-dir
	MOUNT_DIR=$(CONTAINER_MOUNT_DIR) CONTAINER_NAME=$(RX_CONTAINER_NAME) $(CONTAINER_MOUNT_DIR)/$(CONTAINER_SETUP_SCRIPT)

add-links:
	-$(SUDO) -s ovs-docker add-port $(SIDE_BRIDGE_NAME)-0 $(CONTAINER_INTERFACE_NAME) $(TX_CONTAINER_NAME) \
				--ipaddress=$(TX_CONTAINER_IP)/$(IP_PREFIX) --gateway=$(BRIDGE_IP)
	-$(SUDO) -s ovs-docker add-port $(SIDE_BRIDGE_NAME)-0 $(CONTAINER_INTERFACE_NAME) $(RX_CONTAINER_NAME) \
				--ipaddress=$(RX_CONTAINER_IP)/$(IP_PREFIX) --gateway=$(BRIDGE_IP)

delete-links:
	-$(SUDO) -s ovs-docker del-port $(SIDE_BRIDGE_NAME)-0 $(CONTAINER_INTERFACE_NAME) $(TX_CONTAINER_NAME)
	-$(SUDO) -s ovs-docker del-port $(SIDE_BRIDGE_NAME)-0 $(CONTAINER_INTERFACE_NAME) $(RX_CONTAINER_NAME)

# $(SUDO) -s ovs-docker add-port $(BRIDGE_NAME)-0 $(CONTAINER_VF_INTERFACE_NAME) $(RX_CONTAINER_NAME) \
			# --ipaddress=$(RX_CONTAINER_IP)/$(IP_PREFIX) --gateway=$(BRIDGE_IP)

# install-mac-learning-flow:
# 	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 \
# 			"table=0 actions=learn(table=1, NXM_OF_ETH_DST[]=NXM_OF_ETH_SRC[], \
#             load:NXM_OF_IN_PORT[]->NXM_NX_REG0[0..15]), \
#             resubmit(,1)"
# 	$(OVS-OFCTL) add-flows br0 - <<'EOF' table=4 reg0=2 actions=strip_vlan,2

install-port-based-birectional-forwarding-rules:
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=1,actions=output:2
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=2,actions=output:1
# $(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=2,actions=output:4
# $(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=4,actions=output:2

install-port-based-sampling-rules-with-100-percent-probability:
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=1,actions="sample(probability=65535,collector_set_id=23456,obs_domain_id=34567,obs_point_id=45678)"
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 in_port=2,actions="sample(probability=65535,collector_set_id=23456,obs_domain_id=34567,obs_point_id=45678)"

install-NSX-managed-100K-rules:
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x80,len=4}->tun_metadata0"
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x81,len=4}->tun_metadata1"
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x82,len=8}->tun_metadata2"
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x84,len=4}->tun_metadata3"
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x85,len=8}->tun_metadata4"
	$(OVS-OFCTL) add-tlv-map $(BRIDGE_NAME)-0 "{class=0x104,type=0x0,len=4}->tun_metadata5"
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(NSX_OPENFLOW_RULE_SET)

install-normal-rule:
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 priority=65535,actions=normal

install-all-packets-to-slowpath-rule:
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 dl_type=0x0800,nw_proto=6,actions=debug_slow,2
	$(OVS-OFCTL) add-flow $(BRIDGE_NAME)-0 dl_type=0x0800,nw_proto=17,actions=debug_slow,2

install-classbench-ACL1-2-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL1_2_OPENFLOW_RULE_SET)

install-classbench-ACL1-250-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL1_250_OPENFLOW_RULE_SET)

################################## full rules from classbench ##################################
install-classbench-ACL1-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL1_500K_OPENFLOW_RULE_SET)

install-classbench-ACL2-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL2_500K_OPENFLOW_RULE_SET)

install-classbench-ACL3-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL3_500K_OPENFLOW_RULE_SET)

install-classbench-ACL4-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL4_500K_OPENFLOW_RULE_SET)

install-classbench-ACL5-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_ACL5_500K_OPENFLOW_RULE_SET)

install-classbench-FW1-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW1_500K_OPENFLOW_RULE_SET)

install-classbench-FW1-2000-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW1_2000_OPENFLOW_RULE_SET)

install-classbench-FW2-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW2_500K_OPENFLOW_RULE_SET)

install-classbench-FW3-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW3_500K_OPENFLOW_RULE_SET)

install-classbench-FW4-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW4_500K_OPENFLOW_RULE_SET)

install-classbench-FW5-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_FW5_500K_OPENFLOW_RULE_SET)

install-classbench-IPC1-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_IPC1_500K_OPENFLOW_RULE_SET)

install-classbench-IPC2-500k-rules:
	$(OVS-OFCTL) add-flows $(BRIDGE_NAME)-0 $(CLASSBENCH_IPC2_500K_OPENFLOW_RULE_SET)

delete-flows:
	$(OVS-OFCTL) del-flows $(BRIDGE_NAME)-0

ping-rx:
	ping $(RX_CONTAINER_IP)

ping-tx:
	ping $(TX_CONTAINER_IP)

iperf-udp-client-on-tx:
	iperf -u -c $(RX_CONTAINER_IP) -i1 -t$(IPERF_FOR_N_SECONDS) -b $(IPERF_BW)

iperf-udp-server-on-rx:
	iperf -u -s -i1

iperf-tcp-client-on-tx:
	iperf -c $(RX_CONTAINER_IP) -i1 -t$(IPERF_FOR_N_SECONDS) -b $(IPERF_BW)

iperf-tcp-server-on-rx:
	iperf -s -i1

port-scan-rx-on-tcp:
	nmap -vv -sT -p- $(RX_CONTAINER_IP)

port-scan-rx-on-udp:
	nmap -vv -sU -p- $(RX_CONTAINER_IP)

send-one-packet:
	$(PYTHON) $(SINGLE_PACKET_EXPERIMENTS)/send.py \
				--src_intf $(CONTAINER_INTERFACE_NAME) --src_ip $(TX_CONTAINER_IP) --dst_ip $(RX_CONTAINER_IP) --count  1 --delay 1

sniff-packets:
	$(PYTHON) $(SINGLE_PACKET_EXPERIMENTS)/sniff.py --dst_intf $(CONTAINER_INTERFACE_NAME)



######################################################## OVS show commands ########################################################

$(OVS_VSWITCHD_LOG_FILE):
	echo "Log file [$(OVS_VSWITCHD_LOG_FILE)] does not exist. OVS is not running!"
	false

show-vswitchd-status:
	$(SUDO) systemctl status ovs-vswitchd

show-vswitchd-log:
	$(SUDO) cat $(OVS_VSWITCHD_LOG_FILE)

show-vswitchd-log-last-1000:
	$(SUDO) tail -1000 $(OVS_VSWITCHD_LOG_FILE)

delete-log-file:
	$(SUDO) rm -rf $(OVS_VSWITCHD_LOG_FILE)

show-bridges:
	$(OVS-VSCTL) show

show-openflow-ports:
	$(OVS-OFCTL) show $(BRIDGE_NAME)-0

show-flows:
	$(OVS-OFCTL) dump-flows $(BRIDGE_NAME)-0

count-flows:
	$(OVS-OFCTL) dump-flows $(BRIDGE_NAME)-0 | wc -l

show-hw-offloaded-flows:
	$(OVS-APPCTL) dpctl/dump-flows type=offloaded

count-hw-offloaded-flows:
	$(OVS-APPCTL) dpctl/dump-flows type=offloaded | wc -l

show-partial-offloaded-flows:
	$(OVS-APPCTL) dpctl/dump-flows -m |grep partial

show-detailed-flows:
	$(OVS-APPCTL) dpctl/dump-flows -m

show-hidden-flows:
	$(OVS-APPCTL) bridge/dump-flows $(BRIDGE_NAME)-0

show-forwarding-table:
	$(OVS-APPCTL) fdb/show $(BRIDGE_NAME)-0

show-ovsdb-table:
	$(OVS-VSCTL) list Open_Vswitch

clear-ovsdb-table:
	$(OVS-VSCTL) clear Open_vSwitch . other_config

show-ovsdb-bridges:
	$(OVS-VSCTL) list Bridge

show-ovsdb-ports:
	$(OVS-VSCTL) list Port

show-ovsdb-interfaces:
	$(OVS-VSCTL) list Interface

show-datapaths:
	$(OVS-APPCTL) dpctl/dump-dps

######################################################## experiment clean ########################################################

clean: clean-containers delete-bridge
