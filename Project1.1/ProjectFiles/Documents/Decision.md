# Decisions made during the project

Following decisions were made, In discussion with the project owner and based on the requirements mentioned in the project document - 

* All the resources with be in one subscription and one resource group, in which all the resources will be deployed.

* The Web server will be Linux Ubuntu machine.
* And the management server will be Windows VM.
* Deployment extension required to be defined in VM scale set
* Another extension should be defined for health checker in VM scale set.
* Change in approach from using Load balancer to Application Gatway for the Vm Scale set as Application Gateway supports SSL Offloading.
Also, Application Gateway can help you manage and secure your web applications in better way by performing various tasks such as traffic management and security.

* A custom health probe has been added to monitor the health of backend pool in addition to the health check in VM scale set. The health state of the virtual machine is also reflected in the VM scale set.
* A key vault is created to encrypt the disk of windows virtual machine.




