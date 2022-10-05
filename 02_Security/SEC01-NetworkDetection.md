# [Subject]
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
* ![Refer installation screenshot - nMap](\00_includes\Week2\Security\SEC01\SEC01-Install-NMap.png)
* ![Refer installation screenshot - NetTools](\00_includes\Week2\Security\SEC01\SEC01-Install-NetTools.png)

After installation, the command ifconfig shows the details about the IP range, the brodcast Ip and the subnet ip.
* ![ifconfig](\00_includes\Week2\Security\SEC01\SEC01-NetworkDetection.png)     

Exercise 2: Open Wireshark and analyse

Wireshark tools shows the various data packets exchanged between the source and destination through various protocols over the Wifi network.   
In wireshark you can apply 2 kinds of filters, capture filter and display filter. The capture filter limits the packet captured, to the mentioned protocol whereas, the display filter captures all packets but displays only the packtes which we mention in the "display filter".

[Reference Screenshot](\00_includes\Week2\Security\SEC01\SEC01-Wireshark-SS.png)


  

## Sources
* [Find Devices](https://vitux.com/find-devices-connected-to-your-network-with-nmap/)

https://www.youtube.com/watch?v=Y858t-jUDdA

https://youtu.be/Y858t-jUDdA

https://www.varonis.com/blog/how-to-use-wireshark#packets


## Overcome challenges

* Tried Wireshark with all active processes amd also after closing some application.

## Results

* ![Refer installation screenshot - nMap](\00_includes\Week2\Security\SEC01\SEC01-Install-NMap.png)
* ![Refer installation screenshot - NetTools](\00_includes\Week2\Security\SEC01\SEC01-Install-NetTools.png)
* ![ifconfig](\00_includes\Week2\Security\SEC01\SEC01-NetworkDetection.png)  
* ![Reference Screenshot Wireshark](\00_includes\Week2\Security\SEC01\SEC01-Wireshark-SS.png)


