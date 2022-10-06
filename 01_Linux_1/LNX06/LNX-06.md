# [Subject]
# LINUX 06

## Key terminology
* Daemon  - Daemon is the server program which responds to server requests for Telnet remote services. It runs in the background.
* PID - Process Identification number for a process started in Linux. Its everytime a new number for every process or instance.


## Exercise
1. Start the telnet daemon.
1. Find out the PID of the telnet daemon.
1. Find out how much memory telnetd is using.
1. Stop or kill the telnetd process.

## Sources
https://www.howtoforge.com/how-to-install-and-use-telnet-on-ubuntu/

https://www.linuxfoundation.org/blog/blog/classic-sysadmin-how-to-kill-a-process-from-the-command-line


## Overcome challenges
Telnetd Install Command was stuck for some 10 mins but on checking the status, the telnet already has started with the PID mentioned below.


## Results
Executed the following commands - 
* sudo apt install telnetd -y
* sudo systemctl status inetd
The status shows Active and Running
Found the PID - 9143
Memory - 932

C:\Manisha\Techgrounds\Day4-29Sep\LNX-06-PID_Memory
C:\Manisha\Techgrounds\Day4-29Sep\LNX-06-InstallTelnetd