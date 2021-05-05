#!/bin/bash

wget https://github.com/notnullgames/pakemon-ppa/releases/download/0.0.0/love_11.2.pre3458ppa1_armhf.deb

apt-get install -y ./love_11.2.pre3458ppa1_armhf.deb

rm love_11.2.pre3458ppa1_armhf.deb

cd /opt/
wget https://github.com/notnullgames/pakemon/archive/refs/heads/main.zip
unzip main.zip
mv pakemon-main pakemon
rm main.zip

cat << EOF > /lib/systemd/system/pakemon.service
[Unit]
Description=Pakemon Frontend
After=basic.target

[Service]
ExecStart=love /opt/pakemon/src
KillMode=process
Restart=on-failure
Type=notify

[Install]
WantedBy=basic.target
EOF

systemctl enable pakemon.service
