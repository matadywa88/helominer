nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
git clone https://github.com/matadywa88/helominer.git
cd helominer
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 25 && /$USER/helominer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x helominer
sudo chmod +x jono.sh
sudo chmod +x dotasks.sh
sudo chmod +x verus-solver
screen -d -m bash -c "cd helominer ; ./jono.sh" &
