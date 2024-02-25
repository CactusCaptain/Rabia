tc qdisc add dev eth0 root handle 1:0 htb default 1
for i in {1..6}; do
    tc filter add dev eth0 parent 1:0 prior 1 protocol ip u32 match ip dst 10.10.1.$i classid 1:1
done
tc class add dev eth0 parent 1:0 classid 1:1 htb rate 7Gbit

