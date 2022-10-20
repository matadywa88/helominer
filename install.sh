#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
git clone https://github.com/vrscms/helominer.git
cd hellminer
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /home/$USER/helominer/dotasks.sh" >> mycron
echo "@reboot sleep 60 && /$USER/helominer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
