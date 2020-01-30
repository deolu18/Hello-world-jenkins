#!/usr/bin/env bash

echo "Setting up storage"

DEVICE_NAME=${ebs_device_name}
EBS_MOUNT_POINT=/jenkins
INSTANCE_ID= `/usr/bin/curl -s `


if [ ! -d "$EBS_MOUNT_POINT" ]; then
  sudo mkdir -p $EBS_MOUNT_POINT
fi


fi
mkdir -p /var/lib/jenkins
echo '/dev/data/volume1 /var/lib/jenkins ext4 defaults 0 0' >> /etc/fstab
mount /var/lib/jenkins

# jenkins repository
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update