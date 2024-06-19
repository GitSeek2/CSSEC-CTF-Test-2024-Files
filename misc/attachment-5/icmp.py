import os
flag = "CSSEC{ICMP_isUsefull}"

for i in flag:
    i = ord(i)
    os.system(f"ping -c 1 -W 0.5 -m {i} 127.0.0.1")