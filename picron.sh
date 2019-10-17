#!/bin/sh


#wget -qO - https://v.firebog.net/hosts/lists.php?type=nocross | tee /etc/pihole/adlists.list 1>/dev/null
#wget -qO - https://v.firebog.net/hosts/lists.php?type=all | tee -a /etc/pihole/adlists.list 1>/dev/null

#pihole -g --skip-download
#pihole -g


sleep 5

cp /etc/pihole/adlists.list /usr/local/bin/my-pihole-lists/adlists.list
cp /etc/pihole/black.list /usr/local/bin/my-pihole-lists/black.list
cp /etc/pihole/blacklist.txt /usr/local/bin/my-pihole-lists/blacklist.txt
cp /etc/pihole/dns-servers.conf /usr/local/bin/my-pihole-lists/dns-servers.conf
cp /etc/pihole/regex.list /usr/local/bin/my-pihole-lists/regex.list
cp /etc/pihole/whitelist.txt /usr/local/bin/my-pihole-lists/whitelist.txt

cd /usr/local/bin/my-pihole-lists/
git add *
git commit -m "change settings"
git push -u origin master
git status


# cd /usr/local/bin/my-pihole-lists/
/usr/local/bin/pihole-cloudsync/pihole-cloudsync --push

date > /home/pi11/datepicron1017
