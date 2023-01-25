/* Name: main.bicep
 Purpose: All deployments are defined and executed as modules in this file
 Creation Date: 20 Decemer 2022
 Last Modified: 
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

var rgname = 'rgtechproj'
var location = 'westeurope'


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
  }
}
