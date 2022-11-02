# [Subnetting]
# NTW06

## Key terminology

* SUBNET - Logical subdivision of network. It involves splitting the network into 2 or more networks. This is done to distribute the load on network and improves network performance. Security is another benefit, you can pull some of your devices in a seprate logical division.

* Router -  A router connects 2 or more networks.  It has 2 main functions -  
        -  Managing traffic between these networks by forwarding data packets to their intended IP addresses.   
        - Allowing multiple devices to use the same Internet connection.

* Internet Gateway - A gateway is a single device that can do the jobs of both a router and a modem.

* NAT - NAT stands for network address translation. It’s a way to map multiple local private addresses to a public one before transferring the information. Organizations that want multiple devices to employ a single IP address use NAT, as do most home routers.

* DHCP Server - Dynamic Host Configuration Protocol (DHCP) is a client/server protocol that automatically provides an Internet Protocol (IP) host with its IP address and other related configuration information such as the subnet mask and default gateway.



## Exercise

 Create a network architecture that meets the following requirements:
1. 1 private subnet that can only be reached from within the LAN. This subnet must be able to accommodate at least 15 hosts.
1. 1 private subnet that accesses the Internet through a NAT gateway. This subnet must be able to place at least 30 hosts (the 30 hosts does not include the NAT gateway).
1. 1 public subnet with an internet gateway. This subnet must be able to place at least 5 hosts (the 5 hosts is excluding the internet gateway).
Post the architecture you created, including a short explanation, in the Github repository you shared with the learning coach.


## Explanantion

![Reference Digram](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW06/NTW06-SubnettingAssignment.png)

Three subnets are required for this exercise.


1. These 15 systems are connected to LAN to each other and cannot communicate with other system outside their private network. They all are connected to one router and have the ip address ranging 192.168.1.1 to 192.168.1.15. Some are extra to keep a scope of extension.
We can also have DHCP server connected to it. In that case there will be another IP for the DHCP server. The ip 192.168.1.0 is allocated for network ip and 192.168.1.41 is reserved for broadcast id.

2. Another private network connecting minimum 30 machines through NAT gateway and then the router connected to cloud.
Ip address of these 30 machines would range between, 192.168.0.43 and
 192.168.0.73, some 7 IPs are extra to cater future needs.

3. A public subnet connecting 5 machines, Ip ranges from 192.168.1.83 to 192.168.1.87 connected directly to the internet gateway. A provision of 8 extra has been kept.
  

## Sources

* [Subnetting](https://www.youtube.com/watch?v=s_Ntt6eTn94&t=452s)

* [Subnetting in Cloud](https://www.youtube.com/results?search_query=subnetting+in+cloud+explained)  

* [Microsoft](https://learn.microsoft.com/en-us/windows-server/networking/technologies/dhcp/dhcp-top)


## Overcome challenges


* I Had to do this task multiple times, precisely 3-4 times to understand and implement the solution properly. 
Initial version was a normal LAN and WAN scenario and then considering cloud enviornment.
* Undesrtanding the Subnetting concept was very much time consuming. ALmost a day and a half spent on this task alone.



## Results

![Reference Digram](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW06/NTW06-SubnettingAssignment.png)
