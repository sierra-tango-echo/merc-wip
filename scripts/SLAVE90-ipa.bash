echo "10.10.0.51	infra01.pri.rscfd1.alces.network" >> /etc/hosts

yum -y install ipa-client
REALM="PRI.RSCFD1.ALCES.NETWORK"
ipa-client-install --no-ntp --mkhomedir --no-ssh --no-sshd --force-join --realm="$REALM" --server="infra01.pri.rscfd1.alces.network" -w "Heaf4Dro" --domain="cloud.pri.rscfd1.alces.network" --unattended --hostname="`hostname -f`"
