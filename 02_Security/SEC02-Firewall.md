

# [FIREWALL]
# SEC-02

## Key terminology


* Firewalls is software that filters network traffic. A firewall can filter this traffic by protocol, port number, source, and destination of a packet. More advanced firewalls can also inspect the content for 
CentOS and REHL have a standard firewall daemon (firewalld) installed. For Ubuntu, the default firewall is ufw. An older still common firewall is iptables.

* Statefull Firewall - A stateful firewall monitors the state of active network connections and also analyses the incoming traffic from all communication sources to improve security.

* Stateless Firewall - Stateless firewalls donot inspect the traffic and let it moving if it is satisfying the existing security rules. Stateless firewalls are faster and also comparitively cheaper to purchase.



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

![Screenshot](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-ApacheInstallUpgrade.PNG)

Exercise 2: View the default page installed with the web server.
* [Screenshot - Default web page on Ubuntu Server](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-PageWebServer.PNG)  

Exercise 3: Set the firewall to block web traffic, but allow ssh traffic.

Please refer to the Screenshots in Results Section  


  

## Sources
* [Find Devices](https://vitux.com/find-devices-connected-to-your-network-with-nmap/)  
*[Setup Firewall](https://linuxize.com/post/how-to-setup-a-firewall-with-ufw-on-ubuntu-20-04/)
*[Check FirewallStatus](https://www.configserverfirewall.com/ufw-ubuntu-firewall/ubuntu-check-firewall-status-ufw/)



## Overcome challenges

None

## Results
![Screenshot - Apache Install and Upgarde](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-ApacheInstallUpgrade.PNG)   
![Screenshot - Default web page on Ubuntu Server](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-PageWebServer.PNG)  
![Firewall on Ubuntu](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-FWonUbuntu.PNG)   
![Firewall SSH Info](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-FW-OpenSSHInfo.PNG)   
![UFW Status after Firewall](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC02/SEC02-FW-UFWStatus.PNG)





