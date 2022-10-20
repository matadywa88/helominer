#!/bin/bash
nproc=$(nproc --all)
cd hellminer
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/helominer/dotasks.sh" >> mycron
sudo crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x helominer
sudo chmod +x jono.sh
screen -d -m bash -c "cd helominer ; ./jono.sh" &
