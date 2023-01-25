
!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
systemctl restart apache2

# sudo apt-get update

# sudo apt-get install certbot python3-certbot-apache -y

# sudo certbot --apache -d vmsstechgrounds.westeurope.cloudapp.azure.com --register-unsafely-without-email --agree-tos --renew-by-default --redirect
# ~

