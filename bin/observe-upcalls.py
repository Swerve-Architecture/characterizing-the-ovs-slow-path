import subprocess
import time
import re


def main():
    rx_pkt_cnt_str = "Rx packets: "
    megaflow_hit_cnt_str = "- Megaflow hits: "
    upcall_cnt_str = "- Upcalls: "
    lost_upcall_cnt_str = "- Lost upcalls: "
    regex_numerics_filter = r"[-+]?(?:\d*\.\d+|\d+)"
    rx_pkt_cnt_list, megaflow_hit_cnt_list, upcall_cnt_list, lost_upcall_cnt_list = [], [], [], []
    while True:
        try:
            rx_pkt_cnt, megaflow_hit_cnt, upcall_cnt, lost_upcall_cnt = 0, 0, 0, 0
            output = subprocess.check_output(['ovs-appctl', 'dpif-netdev/pmd-perf-show'], encoding='utf8').split("\n")
            for line in output:
                # print(line)
                if rx_pkt_cnt_str in line:
                    rx_pkt_cnt += int(re.findall(regex_numerics_filter, line)[0])
                    print(line)
                elif megaflow_hit_cnt_str in line:
                    megaflow_hit_cnt += int(re.findall(regex_numerics_filter, line)[0])
                    print(line)
                elif upcall_cnt_str in line:
                    upcall_cnt += int(re.findall(regex_numerics_filter, line)[0])
                    print(line)
                elif lost_upcall_cnt_str in line:
                    lost_upcall_cnt += int(re.findall(regex_numerics_filter, line)[0])
                    print(line)
            print(rx_pkt_cnt_str, rx_pkt_cnt)
            print(megaflow_hit_cnt_str, megaflow_hit_cnt)
            print(upcall_cnt_str, upcall_cnt)
            print(lost_upcall_cnt_str, lost_upcall_cnt)
            
            rx_pkt_cnt_list.append(rx_pkt_cnt)
            megaflow_hit_cnt_list.append(megaflow_hit_cnt)
            upcall_cnt_list.append(upcall_cnt)
            lost_upcall_cnt_list.append(lost_upcall_cnt)
            
            time.sleep(1)
        
        except KeyboardInterrupt:
            print("Stopping recording...")
            break
    
    print("rx_pkt_cnt_list = ", rx_pkt_cnt_list)
    print("megaflow_hit_cnt_list = ", megaflow_hit_cnt_list)
    print("upcall_cnt_list = ", upcall_cnt_list)
    print("lost_upcall_cnt_list = ", lost_upcall_cnt_list)


if __name__ == "__main__":
    main()