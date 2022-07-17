One or more required packages for installing mlnx-en are missing.
Attempting to install the following missing packages:
dpatch dkms quilt debhelper chrpath graphviz swig
Removing old packages...
Installing new packages
Installing ofed-scripts-5.6...
Installing mlnx-tools-5.2.0...
Installing mlnx-en-utils-5.6...
Installing mlnx-en-dkms-5.6...

Installing mstflint-4.16.1...
Selecting previously unselected package mlnx-fw-updater.
(Reading database ... 242674 files and directories currently installed.)
Preparing to unpack .../mlnx-fw-updater_5.6-1.0.3.5_amd64.deb ...
Unpacking mlnx-fw-updater (5.6-1.0.3.5) ...
Setting up mlnx-fw-updater (5.6-1.0.3.5) ...
Initializing...
Attempting to perform Firmware update...
Querying Mellanox devices firmware ...

Device #1:
----------

  Device Type:      ConnectX6DX
  Part Number:      MCX623106AN-CDA_Ax
  Description:      ConnectX-6 Dx EN adapter card; 100GbE; Dual-port QSFP56; PCIe 4.0/3.0 x16;
  PSID:             MT_0000000359
  PCI Device Name:  d2:00.0
  Base GUID:        08c0eb0300a27bc8
  Base MAC:         08c0eba27bc8
  Versions:         Current        Available
     FW             22.31.1014     22.33.1048
     PXE            3.6.0403       3.6.0502
     UEFI           14.24.0013     14.26.0017

  Status:           Update required

---------
Found 1 device(s) requiring firmware update...

Device #1: Updating FW ...
-W- DMA burning is not supported due to BME is unset (Bus primary Enable).
FSMST_INITIALIZE -   OK
Writing Boot image component -   OK
Done

Restart needed for updates to take effect.
Log File: /tmp/e4ByYilJE_
Real log file: /tmp/mlnx-en.70183.logs/fw_update.log
Configuring /etc/security/limits.conf.
Device (d2:00.0):
	d2:00.0 Ethernet controller: Mellanox Technologies MT2892 Family [ConnectX-6 Dx]
	Link Width: x16
	PCI Link Speed: 16GT/s

Device (d2:00.1):
	d2:00.1 Ethernet controller: Mellanox Technologies MT2892 Family [ConnectX-6 Dx]
	Link Width: x16
	PCI Link Speed: 16GT/s

Installation passed successfully
To load the new driver, run:
/etc/init.d/mlnx-en.d restart