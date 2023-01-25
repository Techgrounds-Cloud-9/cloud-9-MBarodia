/* Name: main.bicep
 Purpose: All deployments are defined and executed as modules in this file
 List  of Modules: Resource Group
                   Storage and Container
                   Management/ Windows Server
                   Virtual MAchine Scale set and Application Gateway
                   Network Peering
                   Key Vault
                   Windows Server Disk Encryption
 Creation Date: 18 January 2023
 Last Modified: 24 January 2023
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
param winVNetName string = 'winVNET'

@description('Set the remote VNet name')
param vmssVNetName string = 'vmssVNET'

@description('Key Vault Name')
param kvname string = 'kvtechgrounds'

var rgname = 'rgtechproj'
var location = 'westeurope'
var webvnet = vmssAG.outputs.vmssVNetname
var winvnet = winadminvm.outputs.winvnetname
var tagName = {
  name : 'Cohort'
  value: 'Cloud9'
}
var scaleSetName = 'vmssTechgrounds'
var vmSKUval = 'Standard_B2ms'


// Create resource group for deploying all resources
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgname
  location: location
  tags: tagName
}
//--------Creating Storage and Container------
module stg './StorageContainer.Bicep' = {
  scope: rg
  name: 'storageDeployment'
}

//------Creating Management/ Windows VM-------- 
module winadminvm 'WinserverVM.bicep' = {
  scope: rg
  name: 'adminServer'
  params: {
    location: rg.location
    adminUsername: mgmtuser
    adminPassword: mgmtpassword
    dnsLabelPrefix: dnswin
    storageAccountName: stg.outputs.storagename
  }
}

//----------Creating VM Scale set and Application Gateway------
module vmssAG 'vmssAG.bicep' = {
  scope: rg
  name: 'vmssAppGateway'
  params: {
    location: rg.location
    vmssName: scaleSetName
    adminUsername: adminuser
    adminPassword: adminPassword
    vmSku: vmSKUval
    //dnsNameForPublicIP: dnsweb
    storageAccountName: stg.outputs.storagename    
    WinserverIpAdd: winadminvm.outputs.ipadd
    }
}

//-----------Network Peering between vmssVNET and WinVNET--------
module Nwpeering 'NWPeering.bicep' = {
  scope: rg
  name: 'nwPeering'
  params: {
    WebVirtualNetworkName: webvnet
    WinVirtualNetworkName: winvnet
  }
}


//------------ Creating Key Vault---------------
module keyvault 'Keyvault.bicep' = {
  scope: rg
  name: 'kvProject'
  params: {
    kvname: kvname
    location: location
  }
}

//-------------Disk encryption for Management / Windows server--------------

module winserverdiskencryption 'WinvmdiskEncryp.bicep'= {
  scope: rg
   name: 'adminServerDiskEncrypt'
  params: {
     keyVaultName: kvname
     vmName: winadminvm.outputs.winvmname
     location:location
   }
   dependsOn: [
     winadminvm
     keyvault
   ]
 }

 
