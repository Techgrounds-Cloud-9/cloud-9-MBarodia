@description('Azure Location of KeyVault')
param location string = resourceGroup().location

@description('Name of the KeyVault')
param kvname string

var objectId = '4757c597-a419-4a26-831a-4e8790b8c20f'
var tenantId = 'de60b253-74bd-4365-b598-b9e55a2b208d'
var tagName =  {
  name: 'Cohort'
  value: 'cloud9'
}

resource Keyvault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: kvname
  location: location
  tags: tagName
  properties: {
     accessPolicies: [
      {
        objectId: objectId // az ad signed-in-user show --query id -o tsv 
        permissions: {
           keys: [
            'all'
          ]
          secrets: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
        tenantId: tenantId
      }
    ]
    enabledForDeployment: true
    enabledForDiskEncryption: true
    sku: {
      family: 'A'
      name: 'standard'
        }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
     tenantId: tenantId
  }
}

output keyvaultname string = kvname
