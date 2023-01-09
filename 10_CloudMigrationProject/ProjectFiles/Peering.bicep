@description('Set the local VNet name')
param WinVirtualNetworkName string = 'WinVNET'

@description('Set the remote VNet name')
param WebVirtualNetworkName string = 'WebVNET'

@description('Sets the remote VNet Resource group')
param WebVirtualNetworkResourceGroupName string = 'rgtechproj'

resource WinVirtualNetworkName_peering_to_web_vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${WinVirtualNetworkName}/peering-to-remote-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: resourceId(WebVirtualNetworkResourceGroupName, 'Microsoft.Network/virtualNetworks', WebVirtualNetworkName)
    }
  }
}

resource WebVirtualNetworkName_peering_to_win_vnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${WebVirtualNetworkName}/peering-to-remote-vnet'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: resourceId(WebVirtualNetworkResourceGroupName, 'Microsoft.Network/virtualNetworks', WinVirtualNetworkName)
    }
  }
}
