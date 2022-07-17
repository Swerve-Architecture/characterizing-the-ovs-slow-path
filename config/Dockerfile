FROM ubuntu:latest
RUN apt-get -y --allow-unauthenticated update && apt-get -y --allow-unauthenticated upgrade && \
    apt-get install -y --allow-unauthenticated openvswitch-switch net-tools iproute2 iputils-ping iperf nmap vim python3-pip && \
    pip install scapy aiobfd
ENTRYPOINT [ "/bin/bash" ]