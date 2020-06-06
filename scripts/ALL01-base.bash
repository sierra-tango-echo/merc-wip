echo 'ZONE="Europe/London"' > /etc/sysconfig/clock
ln -snf /usr/share/zoneinfo/Europe/London /etc/localtime
yum -y install ntpdate

yum -y install vim

cat << "EOF" > /etc/profile.d/flightcenter.sh
#Custom PS1 with client name
[ -f /etc/flightcentersupported ] && c=32 || c=31
if [ "$PS1" ]; then
  PS1="[\u@\h\[\e[1;${c}m\][cloud-rscfd1]\[\e[0m\] \W]\\$ "
fi
EOF

touch /etc/flightcentersupported

cat << EOF > /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

EOF

cat << EOF > /etc/resolv.conf
search cloud.pri.rscfd1.alces.network pri.rscfd1.alces.network mgt.rscfd1.alces.network ib.rscfd1.alces.network bmc.mgt.rscfd1.alces.network rscfd1.alces.network whiteways.tech
nameserver 10.10.0.51
EOF

echo 'GATEWAY=10.110.1.254' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'PEERDNS=no' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'PEERROUTES=no' >> /etc/sysconfig/network-scripts/ifcfg-eth0

#systemctl disable NetworkManager
#systemctl mask NetworkManager

touch /etc/cloud/cloud-init.disabled

systemctl disable cloud-init
systemctl disable cloud-config
systemctl disable cloud-final
systemctl disable cloud-init-local

firewall-cmd --remove-interface eth0 --zone public
firewall-cmd --remove-interface eth0 --zone public --permanent
firewall-cmd --add-interface eth0 --zone trusted --permanent
firewall-cmd --add-interface eth0 --zone trusted
