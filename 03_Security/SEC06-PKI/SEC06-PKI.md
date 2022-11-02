

# [PUBLIC KEY INFRASTRUCTURE(PKI)]
# SECURITY 06 

## Key terminology
SSL Certificate - Its a code that authenticates the website identity and verifies the third party. It enables the website to move from https to https, which is more secure. All banking and shopping websites are classic examples of https. SSL Stands for Secured Socket Layer.
  
## Exercise

1. Create a self-signed certificate on your VM.  
![Certificate created in VM](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7c514c1c7848a1f377fea5e136cae8d1d1e8eacb/00_includes/03_Security/SEC06/SEC06-CERT.PNG)  
![Key created in VM](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7c514c1c7848a1f377fea5e136cae8d1d1e8eacb/00_includes/03_Security/SEC06/SEC06-KEY.PNG)

2. Analyze some certification paths of known websites (ex. techgrounds.nl / google.com / ing.nl).
* ![ING](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7c514c1c7848a1f377fea5e136cae8d1d1e8eacb/00_includes/03_Security/SEC06/SEC06-ING_Cert.PNG)  
* ![TECHGROUNDS](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/291fc99b13c88c88bc5933bafa4f1cb3634a9477/00_includes/03_Security/SEC06/SEC06-Techgrounds-Cert.PNG)
* ![GOOGLE](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7c514c1c7848a1f377fea5e136cae8d1d1e8eacb/00_includes/03_Security/SEC06/SEC06-Google_Cert.PNG)


3. Find the list of trusted certificate roots on your system (bonus points if you also find it in your VM).

* ![Trusted Certificates roots on windows machine](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/291fc99b13c88c88bc5933bafa4f1cb3634a9477/00_includes/03_Security/SEC06/SEC06-TRUSTED-CERT-ROOTS-WIN.PNG)

* ![Trusted Certificates roots on Ubuntu](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/291fc99b13c88c88bc5933bafa4f1cb3634a9477/00_includes/03_Security/SEC06/SEC06-CERT-VM-BONUS.PNG)
* ![Trusted Certificates roots on Ubuntu -Details](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/291fc99b13c88c88bc5933bafa4f1cb3634a9477/00_includes/03_Security/SEC06/SEC06-CERT-VM-BONUS1.PNG)



## Sources
### Task 3
* [Certificates on Ubuntu](https://betterstack.com/community/questions/how-to-list-all-available-ca-ssl-certificates-on-ubuntu/)

* [Certificates on Windows](https://learn.microsoft.com/en-us/answers/questions/389018/what-is-the-default-root-ca-list-in-windows-10-by.html)

## Result

Screenshots in the Exercise section.

## Overcome challenges

None


## End of Document






