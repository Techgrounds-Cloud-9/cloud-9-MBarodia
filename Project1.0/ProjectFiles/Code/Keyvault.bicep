@description('Azure Location of KeyVault')
param location string = resourceGroup().location

@description('Name of the KeyVault')
param kvname string


resource Keyvault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: kvname
  location: location
  tags: {
    name: 'Cohort'
    value: 'cloud9'
  }
  properties: {
     accessPolicies: [
      {
        objectId: '4757c597-a419-4a26-831a-4e8790b8c20f' // az ad signed-in-user show --query id -o tsv 
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
        tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
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
     tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
  }
}

output keyvaultname string = kvname
