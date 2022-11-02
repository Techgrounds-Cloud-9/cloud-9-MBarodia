# [Network Detection]
# SEC-01

## Key terminology

- nmap - This is a program that scans the network to which your laptop and other devices are connected and shows the list of ports, device names and operating systems.
- Net-tool - It diagnoses the networks and monitor your computer's network connection.
 - Wireshark Capture Filter - Use Capture filter to specify the traffic that we want. After putting the filter, it will limit the traffic. 
- Wireshark Display Filter - It captures all traffice but displays only what is filtered in "Display Filter".


## Exercise

1. Scan the network of your Linux machine using nmap. What do you find?
2. Open Wireshark in Windows/MacOS Machine. Analyse what happens when you open an internet browser. 


## Explanantion
Exercise 1: Install nmap and net-tools   
* ![Refer installation screenshot - nMap](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Install-NMap.png)
* ![Refer installation screenshot - NetTools](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Install-NetTools.png)

After installation, the command ifconfig shows the details about the IP range, the brodcast Ip and the subnet ip.
* ![ifconfig](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-NetworkDetection.PNG)     

Exercise 2: Open Wireshark and analyse

Wireshark tools shows the various data packets exchanged between the source and destination through various protocols over the Wifi network.   
In wireshark you can apply 2 kinds of filters, capture filter and display filter. The capture filter limits the packet captured, to the mentioned protocol whereas, the display filter captures all packets but displays only the packets which we mention in the "display filter".

![Reference Screenshot](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Wireshark-SS.png)


  

## Sources
* [Find Devices](https://vitux.com/find-devices-connected-to-your-network-with-nmap/)

* [Youtube Link1](https://www.youtube.com/watch?v=Y858t-jUDdA)

* [Youtube Link2](https://youtu.be/Y858t-jUDdA)

* [About Wireshark packets](https://www.varonis.com/blog/how-to-use-wireshark#packets)


## Overcome challenges

* Tried Wireshark with all active processes amd also after closing some application.

## Results

* ![Refer installation screenshot - nMap](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Install-NMap.png)
* ![Refer installation screenshot - NetTools](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Install-NetTools.png)
* ![ifconfig](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-NetworkDetection.PNG)  
* ![Reference Screenshot Wireshark](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/2c113d7a3fa2eb025db17c4d179e26cceebc6c00/00_includes/02_Security/SEC01/SEC01-Wireshark-SS.png)

## End of Document
