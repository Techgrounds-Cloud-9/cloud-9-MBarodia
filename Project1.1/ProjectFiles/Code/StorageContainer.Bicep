targetScope = 'resourceGroup'

@description('Name of the blob as it is stored in the blob container')
param filename string = 'installapache.sh'

@description('UTC timestamp used to create distinct deployment scripts for each deployment')
param utcValue string = utcNow()

@description('Name of the blob container')
param containerName string = 'data'

@description('Azure region where resources should be deployed')
param location string = resourceGroup().location

@description('Desired name of the storage account')
param storageAccountName string = 'webserverstorageproj'

var skuname = 'Standard_LRS'
var stgkind = 'StorageV2'
var tagName = {
  name : 'Cohort'
  value: 'Cloud9'
}
var stgAccessTier = 'Hot'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  tags: tagName
  location: location
  sku: {
    name: skuname
  }
  kind: stgkind
  properties: {
    accessTier: stgAccessTier
    allowBlobPublicAccess: false
    allowCrossTenantReplication: false
    encryption: {
    keySource: 'Microsoft.Storage'
      
    }
  }
  resource blobService 'blobServices' = {
    name: 'default'

    resource container 'containers' = {
      name: containerName
    }
  }
}

resource deploymentScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'deployscript-upload-blob-${utcValue}'
  location: location
  tags: tagName
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.26.1'
    timeout: 'PT1H'
    retentionInterval: 'P1D'
    cleanupPreference: 'OnSuccess'
    storageAccountSettings: {
      storageAccountName: storageAccountName
      storageAccountKey: storage.listKeys().keys[0].value
    }
    environmentVariables: [
      {
        name: 'AZURE_STORAGE_ACCOUNT'
        value: storage.name
      }
      {
        name: 'AZURE_STORAGE_KEY'
        secureValue: storage.listKeys().keys[0].value
      }
      {
        name: 'CONTENT'
        value: loadTextContent('./installapache.sh')
      }
    ]
     scriptContent: 'echo "$CONTENT" > ${filename} && az storage blob upload -f ${filename} -c ${containerName} -n ${filename}'
    // primaryScriptURI: 
  }
}


output storagename string = storage.name
//output bloburl string = storage.properties.primaryEndpoints.blob
