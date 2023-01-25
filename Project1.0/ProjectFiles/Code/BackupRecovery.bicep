
@description('Array of Azure virtual machines')
param vmName string = 'WebUbuntuVM'

@description('Name of the Recovery Services Vault')
param vaultName string = 'WebRecoveryServicesVault'

@description('Location for all resources.')
param location string = resourceGroup().location


@description('Backup policy to be used to backup VMs. Backup POlicy defines the schedule of the backup and how long to retain backup copies. By default every vault comes with a \'DefaultPolicy\' which canbe used here.')
param policyName string = 'RecoveryDailyPolicy'

//@description('Conditional parameter for New or Existing Backup Policy')
//param isNewPolicy bool = false
var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${vmName}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${vmName}'

@description('Existing webserver vm')
resource webserver'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: vmName
  location:location
}
resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2021-03-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {}
}

resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2021-03-01' =  {
  parent: recoveryServicesVault
  name: policyName
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: 5
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      schedulePolicyType: 'SimpleSchedulePolicy'
      scheduleRunTimes:[
        '9z:00'
      ]
    }
    retentionPolicy: {
      retentionPolicyType: 'LongTermRetentionPolicy'
      dailySchedule: {
        retentionTimes: [
          '09:00'
        ]
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
     }
     timeZone: 'UTC'
}
}
resource vault_backup 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2022-03-01'= {
  name: '${vaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: backupPolicy.id
    sourceResourceId: webserver.id
  }
}
