# Understanding Document
_________________________________________________

This project is build using IaaC(Infrastructure as a Code) and all the deployments will take place using Azure Bicep.

The requirement is to migrate the on-premise infrastructure of a company to Azure Cloud.

## Project 1.0

Project 1.0 requirements are as follows - 

1. There will be 2 servers, one webserver, Linux and another managment server, which will be windows machine.

2. Both the servers are to be placed in one subscription and one resource group in Azure cloud

3. There will be 2 VMs, one Linux Ubuntu machine and the other one is Windows machine with their own virtual networks. The 2 networks should be peered to allow both the machine to communicate.

4. There will be a post deployment script to install apache in web server. This script will be uploaded from the local machine and stored in storage blob.

5. The servers should be backup daily.

6. The disks should be encrypted and Key vault will be used for encryption.

7. The webserver is placed in Zone 2 and the windows server is placed in Zone 1.

8. The NSG Rules will be defined for both virtual machines to allow access to certain ports.

