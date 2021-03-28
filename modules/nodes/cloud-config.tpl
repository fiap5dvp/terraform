#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --kubelet-extra-args "--node-labels=\"nodeType=onDemand\" --image-gc-low-threshold=50 --image-gc-high-threshold=70" ${cluster_name}
cat <<EOF > /etc/sysctl.d/99-inotify.conf
fs.inotify.max_user_watches = 65535
fs.inotify.max_user_instances = 65535
EOF
echo -e "root\thard\tnofile\t500000\nroot\tsoft\tnofile\t500000" >> /etc/security/limits.conf
systemctl restart systemd-sysctl.service
/opt/aws/bin/cfn-signal --exit-code $? \
         --stack  ${cluster_name}-${group_name}-${cluster_version} \
         --resource NodeGroup  \
         --region us-east-1
