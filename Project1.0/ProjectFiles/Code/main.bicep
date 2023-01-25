/* Name: main.bicep
 Purpose: All deployments are defined and executed as modules in this file
 Creation Date: 20 December 2022
 Last Modified: 11 January 2023
 Created By: Manisha 
*/

targetScope = 'subscription'

// Username for Webserver
param adminuser string

// Password for Webserver (Must be atleast 12 characters)
@secure()
@minLength(12)
param adminPassword string

// DNS Name for Webserver
param dnsweb string

//Username for Windows Admin server
param mgmtuser string

//Password for Windows Admin server (Must be atleast 12 characters)
@secure()
@minLength(12)
param mgmtpassword string

// DNS name for Windows Server
param dnswin string

@description('Set the local VNet name')
param WinVirtualNetworkName string = 'WinVNET'

@description('Set the remote VNet name')
param WebVirtualNetworkName string = 'WebVNET'

@description('Key Vault Name')
param kvname string = 'kvtechgrounds'

var rgname = 'rgtechproj'
var location = 'westeurope'
var webvnet = webservervm.outputs.webvnetname
var winvnet = winadminvm.outputs.winvnetname

// Create resource group for deploying all resources
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgname
  location: location
  tags: {
    name : 'Cohort'
    value: 'Cloud9'
  }
}

module stg './StorageContainer.Bicep' = {
  scope: rg
  name: 'storagedeployment'
}

module winadminvm 'WinserverVM.bicep' = {
  scope: rg
  name: 'Adminserver'
  params: {
    location: rg.location
    adminUsername: mgmtuser
    adminPassword: mgmtpassword
    dnsLabelPrefix: dnswin
    storageAccountName: stg.outputs.storagename
  }
}

module webservervm 'WebserverVM.bicep' = {
  scope: rg
  name: 'Webserver'
  params: {
    location: rg.location
    adminUsername: adminuser
    adminPasswordOrKey: adminPassword
    dnsNameForPublicIP: dnsweb
    storageAccountName: stg.outputs.storagename    
    WinserverIpAdd: winadminvm.outputs.ipadd
    }
}


module Nwpeering 'NWPeering.bicep' = {
  scope: rg
  name: 'WebtoWin'
  params: {
    WebVirtualNetworkName: webvnet
    WinVirtualNetworkName: winvnet
  }
}

// Creating backup and recovery of webserver
module backuprecovery 'BackupRecovery.bicep' = {
  scope: rg
  name: 'backuprecoveryweb'
  params: {
    vmName : webservervm.outputs.webvmname
    location: location
  }
}


// Creating Key Vault
module keyvault 'Keyvault.bicep' = {
  scope: rg
  name: 'kvproject'
  params: {
    kvname: kvname
    location: location
  }
}

//Disk Encryption for the webserver vm
module webserverdiskencryption 'WebvmdiskEncryp.bicep' = {
  scope: rg
  name: 'WebServerDiskEncrypt'
  //parent: webservervm
  params: {
    keyVaultResourceGroup:rg.name
    keyVaultName: kvname
    //vmName: webservervm.name
    vmName: webservervm.outputs.webvmname
    location: location
 }
  dependsOn: [
    backuprecovery
    webservervm
    keyvault
  ]
}


module winserverdiskencryption 'WinvmdiskEncryp.bicep'= {
  scope: rg
   name: 'AdminServerDiskEncrypt'
  params: {
     keyVaultName: kvname
     vmName: winadminvm.outputs.winvmname
     location:location
   }
   dependsOn: [
     backuprecovery
     winadminvm
     keyvault
   ]
 }

 
