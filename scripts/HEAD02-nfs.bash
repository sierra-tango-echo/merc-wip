yum -y install nfs-utils
sed -ie "s/^#\RPCNFSDCOUNT.*$/\RPCNFSDCOUNT=32/g" /etc/sysconfig/nfs

mkdir -p /export/users
mkdir -p /export/service
mkdir -p /export/gridware
mkdir -p /export/apps
mkdir -p /export/site

cat << EOF > /etc/exports 
/export/users 10.110.1.0/24(rw,no_root_squash,no_subtree_check,sync)
/export/service 10.110.1.0/24(rw,no_root_squash,no_subtree_check,sync)
/export/gridware 10.110.1.0/24(rw,no_root_squash,no_subtree_check,sync)
/export/apps 10.110.1.0/24(rw,no_root_squash,no_subtree_check,sync)
/export/site 10.110.1.0/24(rw,no_root_squash,no_subtree_check,sync)
EOF

systemctl enable nfs
systemctl restart nfs
