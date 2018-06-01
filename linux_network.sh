sudo iptables -L -vn
sudo lsof -i -P -n | grep LISTEN 
sudo netstat -tulpn | grep LISTEN
sudo nmap -sTU -O IP-address-Here

iptables -A INPUT -i $EXT_NIC -p udp --dport 500 -j ACCEPT
iptables -A INPUT -i $EXT_NIC -p udp --dport 4500 -j ACCEPT
iptables -A INPUT -i $EXT_NIC -p 50 -j ACCEPT
iptables -A INPUT -i $EXT_NIC -p 51 -j ACCEPT
iptables -A INPUT -i $EXT_NIC -p udp -m policy --dir in --pol ipsec -m udp --dport 1701 -j ACCEPT


