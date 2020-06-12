DOMAIN=`hostname -d`
REALM=${DOMAIN^^}
SERVER=chead1.${DOMAIN}

PASSWORD=KeijReg6

echo "10.110.1.100	${SERVER}" >> /etc/hosts

yum -y install ipa-client
ipa-client-install --no-ntp --mkhomedir --no-ssh --no-sshd --force-join --realm="$REALM" --server="${SERVER}" -w "${PASSWORD}" --domain="${DOMAIN}" --unattended --hostname="`hostname -f`"

cat << EOF > /etc/resolv.conf
search cloud.pri.nucleus.alces.network pri.nucleus.alces.network nucleus.alces.network
nameserver 10.110.1.100
EOF
