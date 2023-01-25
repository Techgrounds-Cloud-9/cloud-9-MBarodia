# Date : 16th January 2023 - 20th January 2023

# Daily Report

Working on VM Extensions
VM HEalth Check
Disk Encryption
Load Balancer
Key Vault

Change in Approach. 
VM Scale set to integrate with Application Gateway for Webserver

# Obstacles

Previously using Load balancer for VM scale set but Application gateway needs to be used. 
Big piece of code needs change and testing from scratch for web VMs

# Solutions

Used portal to undertsnad the flow.
Referred to JSON Script
Used Application Gateway template 

# Learnings

Application Gateway is same as Load balancer with additional feauture of Firewall.
Application gateway works only for HTTP and HTTPS requests.

# Sources

VMSS Stress testing 
https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/tutorial-autoscale-cli

Internal LoadBalancer with Rules
https://github.com/Azure/bicep/issues/1860


Load Balancer and VM Scale set
https://learn.microsoft.com/en-us/azure/load-balancer/tutorial-add-lb-existing-scale-set-portal

VMSS
https://learn.microsoft.com/en-us/azure/templates/microsoft.compute/virtualmachinescalesets?pivots=deployment-language-bicep