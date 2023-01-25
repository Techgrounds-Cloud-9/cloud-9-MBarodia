// @description('Unique DNS Name for the Storage Account where the Virtual Machine\'s disks will be placed.')
// param newStorageAccountName string = 'azstorageproject'
@description('User name for the Virtual Machine.')
param adminUsername string
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsNameForPublicIP string

/*@allowed([
  '18.04-LTS'
  '16.04.0-LTS'
  '14.04.5-LTS'
])
@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param ubuntuOSVersion string = '18.04-LTS'
*/

//@description('Size of the virtual machine')
//param vmSize string = 'Standard_B2s'

@description('Location for all resources.')
param location string = resourceGroup().location

@allowed([
  'sshPublicKey'
  'password'
])
@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
param authenticationType string = 'password'
@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string

// For Storage Account, Container and Deployment Script
//@description('Name of the blob as it is stored in the blob container')
//param filename string = 'install_apache'

@description('UTC timestamp used to create distinct deployment scripts for each deployment')
param utcValue string = utcNow()

// Parameter to use storage name from output variable
param p_storageacc string = 'webserverstorageproj'

//@description('Name of the blob container')
//param containerName string = 'data'

//@description('Desired name of the storage account')
//param storageAccountName string = 'webserverstorageproj'

// End of parameter declaration for storage

var ubuntuOSVersion = '18.04-LTS'
var vmSize = 'Standard_B2s'
var publicIpSku = 'Standard' // 'Standard not Basic for availability zone'
var imagePublisher = 'Canonical'
var imageOffer = 'UbuntuServer'
var nicName_var = 'WebVMNic'
var addressPrefix = '10.10.10.0/24'
var subnetName = 'WebSubnet'
var subnetPrefix = '10.10.10.0/25'
var publicIPAddressName_var = 'WebPublicIP'
var publicIPAddressType = 'Static'
var vmName_var = 'WebUbuntuVM'
var virtualNetworkName_var = 'WebVNET'
var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName_var, subnetName)
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}

var networkSecurityGroupName_var = 'Web-NSG'

// resource newStorageAccountName_resource 'Microsoft.Storage/storageAccounts@2021-01-01' = {
//  name: newStorageAccountName
//  location: location
// sku: {
//    name: 'Standard_LRS'
//  }
//  kind: 'StorageV2'
//}

//resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
//  name: storageAccountName
//  location: location
//  sku: {
//    name: 'Standard_LRS'
//  }
//  kind: 'StorageV2'

//  resource blobService 'blobServices' = {
//    name: 'default'

//    resource container 'containers' = {
//      name: containerName
//    }
//  }
//}

//resource deploymentScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
//  name: 'deployscript-upload-blob-${utcValue}'
//  location: location
//  kind: 'AzureCLI'
//  properties: {
//    azCliVersion: '2.26.1'
//    timeout: 'PT5M'
//    retentionInterval: 'PT1H'
//    environmentVariables: [
//      {
//        name: 'AZURE_STORAGE_ACCOUNT'
//        value: storage.name
//      }
//      {
//        name: 'AZURE_STORAGE_KEY'
//        secureValue: storage.listKeys().keys[0].value
//      }
//      {
//        name: 'CONTENT'
//        value: loadTextContent('./install_apache.sh')
//      }
//    ]
//    scriptContent: 'echo "$CONTENT" > ${filename} && az storage blob upload -f ${filename} -c ${containerName} -n ${filename}'
//  }
//}


resource publicIPAddressName 'Microsoft.Network/publicIPAddresses@2020-05-01' = {
  name: publicIPAddressName_var
  location: location
  zones:[
    '2'
  ]
  sku: {
    name: publicIpSku
  }
  properties: {
    publicIPAllocationMethod: publicIPAddressType
    dnsSettings: {
      domainNameLabel: dnsNameForPublicIP
    }
  }
}
resource networkSecurityGroupName 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupName_var
  location: location
  properties: {
    securityRules: [
      {
        id: 'SSH'
        name: 'SSH'
        properties: {
          priority: 1000
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '22'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        id: 'HTTP'
        name: 'HTTP'
        properties: {
          priority: 1001
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '80'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}
resource virtualNetworkName 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: virtualNetworkName_var
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: networkSecurityGroupName.id
          }
        }
      }
    ]
  }
}
resource nicName 'Microsoft.Network/networkInterfaces@2020-05-01' = {
  name: nicName_var
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddressName.id
          }
          subnet: {
            id: subnetRef
          }
        }
      }
    ]
  }
  dependsOn: [
    virtualNetworkName
  ]
}
resource vmName 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: vmName_var
  location: location
  tags: {
    name : 'Cohort'
    value: 'Cloud9'
  }
  zones:[
    '2'
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName_var
      adminUsername: adminUsername
      adminPassword: adminPasswordOrKey
      linuxConfiguration: ((authenticationType == 'password') ? json('null') : linuxConfiguration)
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: ubuntuOSVersion
        version: 'latest'
      }
      osDisk: {
        name: '${vmName_var}_OSDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicName.id
        }
      ]
    }
  }
//  dependsOn: [
    // newStorageAccountName_resource
//    p_storageaccstg  ]
}

/*
resource vmName_install_apache 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  parent: vmName
  name: 'install_apache'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.1'
    autoUpgradeMinorVersion: true
    settings: {
      skipDos2Unix: false
      
             }
    protectedSettings: {
      storageAccountName: p_storageacc
      storageAccountKey: listKeys(resourceId('Microsoft.Storage/storageAccounts', p_storageacc), '2022-05-01').keys[0].value
      fileUris: [
        'https://webserverstorageproj.blob.core.windows.net/data/install_apache.sh'
      ]
      commandToExecute: 'sh install_apache.sh'
    }
  }
}
*/

// Output VNet name to use in network peering
output webvnetname string = virtualNetworkName.name
