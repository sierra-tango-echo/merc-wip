curl http://10.110.1.254/deployment/scripts/ALL01-base.bash  | /bin/bash -x | tee /tmp/mainscript-default-output
curl http://10.110.1.254/deployment/scripts/MASTER01-base.bash | /bin/bash -x | tee /tmp/mainscript-default-output
curl http://10.110.1.254/deployment/scripts/MASTER02-nfs.bash | /bin/bash -x | tee /tmp/mainscript-default-output
curl http://10.110.1.254/deployment/scripts/MASTER03-ipa.bash > /root/ipasetup.bash | tee /tmp/mainscript-default-output
curl http://10.110.1.254/deployment/scripts/HPC01-base.bash | /bin/bash -x | tee /tmp/mainscript-default-output
curl http://10.110.1.254/deployment/scripts/HPC02-pkgs.bash | /bin/bash -x | tee /tmp/mainscript-default-output
