# [IP Addresses]
# NTW05

## Key terminology

* Public IP - An Ip adddress of a communicating device registered uniquely in the world. Thet are UNIQUE. Your wifi router will have a public Ip address whereas your home laptop will have a private ip adress. Public Ips are not secure, you need to use secureity measures like VPN or proxy, which hides your public ip address from the user.
* Private IP - Private Ip address is specific to one system/gadget. Pvt ip adresses are classified in A, B and C. Class C, which is used for small organizations and home, is the most popular range of private ip addresses.They start with 192. Private ips are NOT UNIQUE.
* NAT - Network Address Translation is a service that translates the Provate ip addresses to another set of ip addresses.
* Statische en dynamische adressen - Ths static ip addresses would stay on our computer and would never change whereas, dynamic ip addresses are assigned automatically but they would aften change. DHCP service assigns an ip address to a machine, which can change evrytime the allocation is done.
* IPv4 en IPv6 - Any Ip address consists of 2 parts, A network adddress and a host address. Ipv4 is a 32 bit numeric address and Ipv6 is a 128 bit hexadecimal addrress. Hex uses both numbers and alphabets. Ipv6 is capable of producing upto 340 undecillion adresses. Ipv6 has 8 sets of 16 bits with the 8 sets.
Each Hexadecimal character represents 4 bits.



## Exercise

* Find out what your public IP address is for your laptop and mobile on WiFi.
Are the addresses the same or not? Explain why.

The Public IP addresses on both the gadgets were same.

* Find out what your private IP address is of your laptop and mobile on WiFi.
 [Private Address]
     * IPv4 Address of Laptop on wifi - 192.168.2.1 
    * Pvt Ip [Laptop IP](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW05/NTW05-Pvt-IP-Laptop.PNG)
    * IPv4 address of Phone on wifi - 192.168.2.2
    * Pvt Ip Phone [Phone IP](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW05/NTW05-Pub-IP-Phone-.PNG)
* Are the addresses the same or not? Explain why.
The addresses are different.
Every gadget on a LAN network is allocated with a new private Ip through DHCP service in the router. Normally the first 3 octets are same and the last octet in the ip address is different for every gadget connected to the router.

* Change the private IP address of your mobile to that of your laptop. What happens then?  
The LAptop got disconnected from the network but the mobile continued to have a wifi connection.

* Try changing your mobile's private IP address to an address outside your network. What happens then?
I could still connect to outside network.



## Sources
* [Know your Public Private IP](https://www.techbout.com/find-public-and-private-ip-address-44552/)
* [Private and Public IpAddress](https://www.youtube.com/watch?v=po8ZFG0Xc4Q)
* [Ipv4 and Ipv6](https://www.youtube.com/watch?v=ThdO9beHhpA)
* [Detailed Ipv4 and Ipv6](https://www.youtube.com/watch?v=ThdO9beHhpA)
* [Ipv4 and IPv6 Formation - Link 1](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW05/NTW05-Ipv4_DecToBinary.PNG)
* [Ipv4 and IPv6 Formation - Link 2](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW05/NTW05-Ipv4_DecToBinary_complete.PNG)
* [Difference Between Public and Private Ip Address](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/f9c77645e532a1e57d9f44cebe011e11fa5c8853/00_includes/02_Networking/NTW05/NTW05-Diff_PublicAndPvtIP.PNG)

## Overcome challenges
Results of Changing private ip of moile to laptop AND changing mobile private IP address outside the network, is different for different people.

## End of Document





