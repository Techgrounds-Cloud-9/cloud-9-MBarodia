
# [NETWORK DEVICES]
# NTW02

## Key terminology

* Router - Routers are small physical devices that operate at the network layer to join multiple networks together.
* switch - A switch is a multiport device that improves network efficiency.
* repeaters - A repeater is an electronic device that amplifies the signal it receives.
* access point - It commonly means a wireless device. It is a stand-alone device or computer that allows wireless devices (such as laptop computers) to connect to and communicate with a wired computer network. 
* Network Protocols - N/w protocols are established set of rules that determine how data is transmitted between different devices in the same network.
* Hetrogeneous Network - heterogeneous network is a network connecting computers and other devices with different operating systems and/or protocols.
* DHCP stands for Dynamic Host configuration protocol  and provides a mechanism for automatically allocating IP (IPv4) addresses to network devices e.g. computers.

## Exercise
1. Name and describe the functions of common network equipment
1. Most routers have an overview of all connected devices, find this list.
1. What other information does the router have about connected equipment?
1. Where is your DHCP server on your network? What are the configurations of this?

## TASK 1 - Name and describe the functions of common network equipment

## Types of Network Gadgets
#### Hub 
- Hubs operate at the Physical layer of the Open Systems Interconnection (OSI) model.
- It is usd to connect miltiple computing devices
- There exists 2 types of hub, simple and multiple port.

#### Switch
- They may operate in the data link layer and network layer.
- A switch has best of the capabilities of routers and hubs combined.
- Using switches improves network efficiency over hubs or routers because of the virtual circuit capability. 

#### Router
- Routers are small physical devices that operate at the network layer to join multiple networks together.
 - Routers are intelligent devices, and they store information about the networks they’re connected to.
- Routers are general-purpose devices that interconnect two or more heterogeneous networks.
- Router are also used to divide internal networks into two or more subnetworks. 

#### Bridge
- A bridge operates at the data link layer.
 - It is also used for interconnecting two LANs working on the same protocol. It has a single input and single output port, thus making it a 2 port device.

#### Gateway
- A gateway is an internetworking capable of joining together two networks that use different base protocols.
- A network gateway can operate at any level of the OSI model.
- A gateway is a router or proxy server that routes between networks.

#### Repeater
- A repeater operates at the physical layer of the OSI model.

#### Access Point
- An AP works at the second OSI layer, the Data Link layer.
- 

### Sources
* [Network Devices](https://blog.netwrix.com/2019/01/08/network-devices-explained/#:~:text=Network%20devices%2C%20or%20networking%20hardware,hardware%20on%20a%20computer%20network)

* [About Network Devices](https://www.tutorialspoint.com/network-devices-hub-repeater-bridge-switch-router-gateways-and-brouter)



## Overcome challenges
None

## Results
Pictures 

## TASK 1 - Most routers have an overview of all connected devices, find this list.

### Sources
* [List of Connected Devices](https://www.howtogeek.com/168379/10-useful-options-you-can-configure-in-your-routers-web-interface/)

### Results

* [Screenshot - List of Connected Devices](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/fb8018aa8649726a51fd34c6f45548887e48255d/00_includes/02_Networking/NTW02/NTW02-ConnectedDevices.PNG)


## TASK 2 - What other information does the router have about connected equipment?


It shows - 
* The LAN Settings -  IP Address and the Host Name with Nickname, if any
* VoIP Settings - Phone name and the status

Using the tabs on the top -   
-- Internet tab shows the Internet configuration   
-- The WIFI tab page shows -
* the WIFI configuration
* WIFI SSID Configuration
* WIFI Global configuration   
--VoIP tab page shows the Phone Binding Configuration

--Status tab page  - 
- Connection Information
- Device information

--Settings tab page - 
- DHCP Server
- DHCP Binding

![Reference Screenshot 1](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/fb8018aa8649726a51fd34c6f45548887e48255d/00_includes/02_Networking/NTW02/NTW02-ConnectedDevices.PNG)
![Reference Screenshot 2](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/fb8018aa8649726a51fd34c6f45548887e48255d/00_includes/02_Networking/NTW02/NTW02-ConnectedDevices-Router.PNG)

## TASK 3 - Where is your DHCP server on your network? What are the configurations of this?

You can see the DHCP Server Configuration in settings tab of Page 

### Sources

The web page of your default gateway.

### Results
* [DHCP Server Configuration](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/fb8018aa8649726a51fd34c6f45548887e48255d/00_includes/02_Networking/NTW02/NTW02-DHCPServerConfig.PNG)