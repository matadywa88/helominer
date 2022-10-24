#!/bin/bash
for i in `cat ~/servers.txt`
do
    echo -n $i" "
    ssh -l sudo_user $i "sudo shutdown -r now"
    sleep 100
done