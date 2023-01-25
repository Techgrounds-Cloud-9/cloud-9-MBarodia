# Design Document

## This document states the architectural design for Project 1.0 and 1.1

## Prerequisites

* Azure Subscription
* Visual Studio Code or Powershell or Azure CLI


**PROJECT 1.0**

The project has been designed and build using Infrastructure as Code (IaC). The infrastructure of On-premise needs to be migrated to the Azure cloud environment.
Azure Bicep is used to implement this project. Various resources are created in bicep to acheive the objective.

![Architecture Design 1.0](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/714ba9940bf431c98562e6298379e1de2860b9ad/00_includes/Project1.0/Design/ArchitectureDesign1.0.PNG)

This project has one subscription and one resource group, where all the resources are placed.

### Structure
The following resources were created as modules and deployed through the main.bicep file. Every resource bicep file returns some output values, which are used by other dependent resources.
* Firstly, resource group is created through main.bicep
* StorageContainer.bicep.
        For storage and container
       'Microsoft.Storage/storageAccounts'

       The resources created are the storage account , a container.

       For deployment script
       'Microsoft.Resources/deploymentScripts
  
       A deployment script, installapache.sh from the local machine is placed in storage container, data.


* WinserverVM.bicep
        This is for creating the management/admin server. This uses the existing storage account using the keyword, EXISTING. 
        Also creates various resources, public ip, NSG, virtual network, NIC and the windows VM.
        

        Public IP
            'Microsoft.Network/publicIPAddresses
        NSG
            Microsoft.Network/networkSecurityGroups
        VNet
            Microsoft.Network/virtualNetworks
        NIC
            Microsoft.Network/networkInterfaces
        Windows VM
            Microsoft.Compute/virtualMachines

* WebserverVM.bicep
        This module is created for deploying Ubuntu Linux webserver. The resources created in this module are publicIPAddress, NSG, VNet, NIC, and virtual machine and virtual machine extensions.
        Public IP
            'Microsoft.Network/publicIPAddresses
        NSG
            Microsoft.Network/networkSecurityGroups
        VNet
            Microsoft.Network/virtualNetworks
        NIC
            Microsoft.Network/networkInterfaces
        Windows VM
            Microsoft.Compute/virtualMachines
        Virtual machine extension for executing shell script in web machine.
            Microsoft.Compute/virtualMachines/extensions


* NWPeering.bicep
        This module connects the virtual networks of both the VMs to enable access of webserver from windows server. The peering is done two ways.
        Microsoft.Network/virtualNetworks/virtualNetworkPeerings

* BackupRecovery.bicep
        The deployment of this module allows the backup of webserver disk.
        Microsoft.RecoveryServices

        The backup policy is defined using this - 
        Microsoft.RecoveryServices/vaults/backupPolicies

* Keyvault.bicep
        Deployment of this module helps store the encryption keys for disk encryption of web server.
        Microsoft.KeyVault/vaults


* WebvmdiskEncryp.bicep
        The disk encyption takes place after the deployment of this module. Here we are using the 'RSA-OAEP', key encryption algorithm.
        Microsoft.Compute/virtualMachines/extensions

* WinvmdiskEncryp.bicep
        Deploy this module for windows vm disk encyption. Just like web server disk encryption, 'RSA-OAEP', key encryption algorithm is used.
        Microsoft.Compute/virtualMachines/extensions

### Code

[Code](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/tree/main/Project1.0/ProjectFiles/Code)

**PROJECT 1.1**

### Structure
    
    Most features remaining the same as 1.0, in Project1.1, the requirement from the product owner is to increase the number of the web virtual machines as the load on one machine increases. The new machines created are temporary and it gets deleted as the load decreases. To meet this requirement, we have created a virtual machine scale set. Also the machines should also have the health checker.  
    The Application gateway is created to take the HTTP and HTTPS requests. Also, added SSL policy in the Application Gateway properties to have minimum TLS1.2 version.

    

    All the files used in Project 1.0 are used in Project 1.1 except, the WebvmdiskEncryption.bicep is not used and the WebserverVM.bicep is replaced by vmssAG.bicep.

    Additional resources used:
    * Microsoft.Compute/virtualMachineScaleSets
    * Microsoft.Insights/autoscalesettings

    The main deployment happens from file mainDeployment.bicep

    
![Architecture Design 1.1](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/714ba9940bf431c98562e6298379e1de2860b9ad/00_includes/Project1.1/Design/ArchitectureDesign1.1.PNG)


### Code

[Code](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/tree/main/Project1.1/ProjectFiles/Code)


