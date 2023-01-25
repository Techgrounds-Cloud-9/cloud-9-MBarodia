@description('Virtual Machine Scale Set name')
@minLength(3)
@maxLength(61)
param vmssName string = 'vmssTechgrounds'

param location string = resourceGroup().location

@description('Size of VMs in the VM Scale Set.')
param vmSku string = 'Standard_B2ms'

param WinserverIpAdd string

@description('Application Gateway name')
param applicationGateWayName string = 'agTechgrounds'

@description('Number of VM instances (100 or less).')
@minValue(1)
@maxValue(100)
param instanceCount int = 1

@description('Admin username on all VMs.')
param adminUsername string = 'vmssadmin'

@description('Admin password on all VMs.')
@secure()
param adminPassword string

param storageAccountName string

param rgname string = 'rgtechproj'

@description('Back end pool ip addresses')
param backendIPAddresses array = [
  {
    IpAddress: '10.10.10.7'
  }
]
//var vmScaleSetName = toLower(substring('vmssName${uniqueString(resourceGroup().id)}', 0, 9))
var imagePublisher = 'Canonical'
var imageOffer = 'UbuntuServer'
var ubuntuOSVersion = '18.04-LTS'
var vmScaleSetName = 'vmss-${rgname}'
var longvmScaleSet = toLower(vmssName)
var addressPrefix = '10.10.10.0/24'
var subnetPrefixvmss = '10.10.10.0/25'
var subnetPrefixag = '10.10.10.128/25'
var vNetName = 'vmssVNET'
var publicIPAddressName = '${vmScaleSetName}pip'

var subnetNamevmss = '${vmScaleSetName}subnet'
var subnetNameag = '${applicationGateWayName}subnetag'

//var publicIPAddressID = publicIPAddress.id
//var frontEndIPConfigID = resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, 'loadBalancerFrontEnd')

var nicName = '${vmScaleSetName}nic'
var ipConfigName = '${vmScaleSetName}ipconfig'
var osType = {
  publisher: imagePublisher
  offer: imageOffer
  sku: ubuntuOSVersion
  version: 'latest'
}
var imageReference = osType
var networkSecurityGroupName_var = 'vmss-nsg'

var oMode = 'Flexible'
var apiVersion = '2020-11-01'
var pipAllocationMethod = 'Static'
var minCapacity = '1'
var maxCapacity = '3'
var defCapacity = '1'
var skuNameAG = 'Standard_v2'
var skuTierAG = 'Standard_v2'
var zone = '2'
var vmSKUTier = 'Standard'
var tagName = {
  name : 'Cohort'
  value: 'Cloud9'
      }


// -----------Virtual Network--------------
resource vNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vNetName
  location: location
  tags: tagName
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
        //'172.16.1.0/25'
      ]
    }
    subnets: [
      {
        name: subnetNamevmss
        properties: {
          addressPrefix: subnetPrefixvmss
         networkSecurityGroup: {
         id: networkSecurityGroupName.id
         }
         privateEndpointNetworkPolicies: 'Enabled'
         privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: subnetNameag
        properties: {
          addressPrefix: subnetPrefixag //'172.16.1.64/28' 
         // networkSecurityGroup: {
         //   id: networkSecurityGroupName.id
         // }
         //privateEndpointNetworkPolicies: 'Enabled'
         //privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    //enableDdosProtection: false
    //enableVmProtection: false
  }
}

// -----------Virtual Machine Scale Set--------------
resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: vmScaleSetName
  location: location
  zones: [
    zone
  ]
  sku: {
    name: vmSku
    tier: vmSKUTier
    capacity: instanceCount
  }
  tags: tagName
  properties: {
   automaticRepairsPolicy:{
      enabled:true
      gracePeriod:'PT10M'
    }  
     orchestrationMode: oMode
    platformFaultDomainCount: 1
  //}
    //overprovision: true
   /* upgradePolicy: {
      mode: 'Manual'
    }
    */
  
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
        }
        imageReference: imageReference
      }
      osProfile: {
        computerNamePrefix: vmScaleSetName
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      networkProfile: {
        networkApiVersion: apiVersion
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    publicIPAddressConfiguration: {
                      name: publicIPAddressName
                      sku: {
                        name: 'Standard'
                        tier: 'Regional'
                      }
                    }
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vNetName, subnetNamevmss)
                            }
                    applicationGatewayBackendAddressPools:[
                      {
                        id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName, 'agBackendPool') 
                      }
                    ]
                  }
                }
              ]
              networkSecurityGroup: {
                id: networkSecurityGroupName.id
              }
            }
          }
        ]
      }
      extensionProfile: {
        extensions: [
          {
            name: 'install_apache'
          //  location: location
            properties: {
              publisher: 'Microsoft.Azure.Extensions'
              type: 'CustomScript'
              typeHandlerVersion: '2.1'
              autoUpgradeMinorVersion: true
              settings: {
                skipDos2Unix: false
                fileUris: [ 
                  'https://webserverstorageproj.blob.core.windows.net/data/installapache.sh'
                  ]
               }
                protectedSettings: {
                storageAccountName: storageAccountName
                storageAccountKey: listKeys(resourceId('Microsoft.Storage/storageAccounts', storageAccountName), '2022-05-01').keys[0].value
                     commandToExecute: 'sh installapache.sh'
                }
            }
          }
       {
            name: 'healthChecker'
            properties:{
              publisher:'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              autoUpgradeMinorVersion:true
              typeHandlerVersion: '1.0'
              settings:{
                protocol: 'tcp'
                port: 80
                //requestpath: '/health'
                //path: '/'
              }
            }
          } 
           
        ]
      }
    }

  }
  dependsOn: [
    vNet
    applicationGateWay
  ]
}

// -----------Public Ip Address--------------
resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPAddressName
  location: location
  tags: tagName
  zones: [
    zone
  ]
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: pipAllocationMethod
    dnsSettings: {
      domainNameLabel: longvmScaleSet
    }
  }
}

// -----------Network Security Group--------------
resource networkSecurityGroupName 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupName_var
  location: location
  tags: tagName
  properties: {
    securityRules: [
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
      {
        id: 'HTTPS'
        name: 'HTTPS'
        properties: {
          priority: 1002
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '443'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

// -----------Manual auto Scaling for VMSS--------------
resource autoscalehost 'Microsoft.Insights/autoscalesettings@2021-05-01-preview' = {
  name: 'autoscalehost'
  location: location
  tags: tagName
  properties: {
    name: 'autoscalehost'
    targetResourceUri: vmScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: minCapacity
          maximum: maxCapacity
          default: defCapacity
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 50
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
        ]
      }
    ]
  }
}


// -----------Application Gateway--------------

resource applicationGateWay 'Microsoft.Network/applicationGateways@2021-05-01' = {
  name: applicationGateWayName
  location: location
  tags: tagName
  properties: {
    sku: {
      name: skuNameAG
      tier: skuTierAG
    }
    sslPolicy:{
      cipherSuites:[
        'TLS_DHE_RSA_WITH_AES_128_GCM_SHA256'
      ]
      policyType:'Custom'
      minProtocolVersion:'TLSv1_2'
    }
    probes: [
       {
        name: 'healthProbe'
        properties: {
         pickHostNameFromBackendHttpSettings: true
          interval: 60
          protocol: 'http'
          port: 80
          path: '/health'
          timeout: 10
         // host: applicationGateWayName
          unhealthyThreshold: 3
          match: {
            statusCodes: [
              '200'
            ]
        }
      }
       }
    ]
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vNetName, subnetNameag)
            
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIp'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
           // id: resourceId('Microsoft.Network/publicIPAddresses', '${publicIPAddressName}')
          id: publicIPAddress.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_80'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'agBackendPool'
        properties: {
          backendAddresses: backendIPAddresses
        }
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'agHTTPSetting'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
        }
      }
    ]
    httpListeners: [
      {
        name: 'agListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', applicationGateWayName, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', applicationGateWayName, 'port_80')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'agRoutingRule'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', applicationGateWayName, 'agListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName, 'agBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', applicationGateWayName, 'agHTTPSetting')
          }
        }
      }
    ]
   // enableHttp2: false
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 3
    }
  }
  dependsOn: [
    vNet
   // publicIPAddress
  ]
}

//output applicationUrl string = uri('http://${publicIPAddress.properties.dnsSettings.fqdn}', '/MyApp')

output vmssname string = vmScaleSetName
output vmsspubip string = publicIPAddress.properties.ipAddress
output vmsslocation string = location
output vmssVNetname string = vNet.name
output subnetidvmss string = vNet.properties.subnets[0].id
output subnetidag string = vNet.properties.subnets[1].id
