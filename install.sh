#!/bin/bash
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /home/$USER/helominer/dotasks.sh" >> mycron
echo "@reboot sleep 60 && /$USER/helominer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
