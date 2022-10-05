# [Subject]
# NTW03

## Key terminology
[Write a list of key terminology with a short description. To prevent duplication you can reference to previous excercises.]

## Exercise

1. Identify several other protocols and their associated OSI layer. Name at least one for each layer.
1. Figure out who determines what protocols we use and what is needed to introduce your own protocol.
1. Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.

## Explanation

___
Identify several other protocols and their associated OSI layer.
### Protocols and their associated layers
___

#### APPLICATION LAYER - 
- Function - Gives access to network resources.	
- Protocol - SMTP, HTTP, FTP, POP3, SNMP   
#### PRESENTATION LAYER - 
- Function - Responsible for translating, encrypting, and compressing data.	- Protocols - MPEG, ASCH, SSL, TLS
#### SESSION LAYER -
- Function - Ensures establishment and termination of the session.	
- Protocol -NetBIOS, SAP
#### TRANSPORT LAYER - 
- Function - Enables data transport from source to destination machine.	 
- Protocol - TCP, UDP
#### NETWORK LAYER - 
- Function - Provides internetworking and packet movement.	
- Protocol - IPV5, IPV6, ICMP, IPSEC, ARP, MPLS.
#### DATA LINK LAYER - 
- Function - Organize bits into frames.	
- Protocol - RAPA, PPP, Frame Relay, ATM, Fiber Cable, etc.
#### PHYSICAL LAYER - 
- Function -Responsible for providing mechanical and electrical specifications.	
- Protocol - RS232, 100BaseTX, ISDN, 11.


___
Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.
___
* Screenshots below showing captured network data. 
* UDP Protocol - This comes from scronym, User Datagram Protocol. UDP is a standardized method for transferring data between two computers in a network. Compared to other protocols, UDP accomplishes this process in a simple fashion: it sends packets (units of data transmission) directly to a target computer, without establishing a connection first, indicating the order of said packets, or checking whether they arrived as intended. (UDP packets are referred to as ‘datagrams’.)

* UDP is faster but less reliable than TCP, another common transport protocol.
* UDP works by gathering data in a UDP packet and adding its own header information to the packet. This data consists of the source and destination ports on which to communicate, the packet length and a checksum. After UDP packets are encapsulated in an IP packet, they're sent off to their destinations.



____
Who determines what protocols we use and what is needed to introduce your own protocol.
____
There are number of organizations which coordinates DNS, IP Addressing and other Internet protocol resources:
- The Internet Assigned Numbers Authority (IANA) coordinates the DNS, IP addressing, and other internet protocol resources. All domain names and IP addresses are allocated from IANA. 
- Internet Research Task Force (IRTF) - The Internet Research Task Force is a self-organized group. It focuses on long-term research issues to evolve internet protocols, applications, architecture, and technology. 
- Internet Corporation for Assigned Names and Numbers (ICANN)-
It introduced the new gTLDs and included the internet protocol address spaces for IPv4 and IPv6, assigning address blocks to regional internet registries.


### Sources
* [OSI Model and Protocols](https://data-flair.training/blogs/osi-model-in-computer-network/)  
* [Youtube Link](https://www.youtube.com/watch?v=46pBeyHKQuQ)  
* [Organizations who craete protocol standards](https://www.internetx.com/en/news-detailview/who-creates-the-standards-and-protocols-for-the-internet/)   
* [Capture Data Packets](https://www.youtube.com/watch?v=qAuu9gquivU)



### Overcome challenges
[Give a short description of the challeges you encountered, and how you solved them.]

### Results:
* [OSI Layers and Protocols](\00_includes\Week2\Networking\NTW03\NTW03-OSI_Protocols)
* Screenshots   
 [Capture Data Packet1](\00_includes\Week2\Networking\NTW03\NTW03-CaptureDataPackets_WireShark1.png)   
 [Capture Data Packet2](\00_includes\Week2\Networking\NTW03\NTW03-CaptureDataPackets_WireShark2.png)