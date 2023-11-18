#Install some wordlists
sudo wget https://raw.githubusercontent.com/payloadbox/xss-payload-list/master/Intruder/xss-payload-list.txt -O /usr/share/wordlists/xsspayloads.txt

sudo git clone https://github.com/payloadbox/sql-injection-payload-list.git
sudo mv sql-injection-payload-list /usr/share/wordlists/sql-injection-payload-list
