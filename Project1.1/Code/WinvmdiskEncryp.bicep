@description('Location of the resources.')
param location string = resourceGroup().location

@description('Name of the virtual machine.')
param vmName string

@description('Name of the KeyVault to place the volume encryption key')
param keyVaultName string

var keyVaultResourceID = resourceId(resourceGroup().name, 'Microsoft.KeyVault/vaults/', keyVaultName)
var encryptionOperation = 'EnableEncryption'
var keyEncryptionAlgorithm = 'RSA-OAEP'
var tagName = {
  name : 'Cohort'
  value: 'Cloud9'
}

resource vmName_diskEncryption 'Microsoft.Compute/virtualMachines/extensions@2020-12-01' = {
  name: '${vmName}/diskEncryption'
  location: location
  tags: tagName
  properties: {
    publisher: 'Microsoft.Azure.Security'
    type: 'AzureDiskEncryption'
    typeHandlerVersion: '2.2'
    autoUpgradeMinorVersion: true
    settings: {
      EncryptionOperation: encryptionOperation
      KeyVaultURL: reference(keyVaultResourceID, '2022-07-01').vaultUri
      KeyVaultResourceId: keyVaultResourceID
      KeyEncryptionAlgorithm: keyEncryptionAlgorithm
      VolumeType: 'All'
    }
  }
}
