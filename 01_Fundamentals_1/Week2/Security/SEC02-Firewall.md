

# [Subject]
# SEC-02

## Key terminology








Firewalls is software that filters network traffic. A firewall can filter this traffic by protocol, port number, source, and destination of a packet. More advanced firewalls can also inspect the content for 
CentOS and REHL have a standard firewall daemon (firewalld) installed. For Ubuntu, the default firewall is ufw. An older still common firewall is iptables.
Firewalls kunnen stateful of stateless zijn. Stateful firewalls onthouden de verschillende states van vertrouwde actieve sessies. Hierbij hoeft een stateful firewall niet elke pakketje te scannen voor deze verbindingen.
In a cloud environment, you will encounter firewalls as one of the many lines of defense against the public internet.


## Exercise1


* Install a web server on your VM.
* View the default page installed with the web server.
* Set the firewall to block web traffic, but allow ssh traffic.
* Check if the firewall is doing its job




## Explanantion
Exercise 1: 
* Install and Upgrade Apache2
Then, install Apache 2 and PHP for base web server using following command-  
sudo apt-get install apache2 php  

![Screenshot](\00_includes\Week2\Security\SEC02\SEC02-ApacheInstallUpgrade)

Exercise 2: View the default page installed with the web server.
* [Screenshot - Default web page on Ubuntu Server](\00_includes\Week2\Security\SEC02\SEC02-PageWebServer.png)  

Exercise 3: Set the firewall to block web traffic, but allow ssh traffic.

Screenshots in Results Section




## Sources
* [Find Devices](https://vitux.com/find-devices-connected-to-your-network-with-nmap/)  
*[Setup Firewall](https://linuxize.com/post/how-to-setup-a-firewall-with-ufw-on-ubuntu-20-04/)
*[Check FirewallStatus](https://www.configserverfirewall.com/ufw-ubuntu-firewall/ubuntu-check-firewall-status-ufw/)



## Overcome challenges

None

## Results
![Screenshot - Apache Install and Upgarde](\00_includes\Week2\Security\SEC02\SEC02-ApacheInstallUpgrade)   
![Screenshot - Default web page on Ubuntu Server](\00_includes\Week2\Security\SEC02\SEC02-PageWebServer.png)  
![Firewall on Ubuntu](\00_includes\Week2\Security\SEC02\SEC02-FWonUbuntu.png)   
![Firewall SSH Info](\00_includes\Week2\Security\SEC02\SEC02-FW-OpenSSHInfo.png)   
![UFW Status after Firewall](\00_includes\Week2\Security\SEC02\SEC02-FW-UFWStatus.png)





