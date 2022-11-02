

# [PASSWORDS]
# SECURITY 07

## Key terminology
Hash Digest - The alphanumeric value which comes after applying a Hash Algorithm on password value. There are various algorithms available for hashing, for example MD2, 4,5 & 6, SHA 1, 256, 384, 512, RIPEMD, TiGER, WHIRLPOOL etc.   
* ![Different Algos](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/5160937eeb83e77a4c681866471e7b616b50c094/00_includes/03_Security/SEC07/SEC07-DiffHashAlgo.PNG)


## Exercise
1. Find out what hashing is and why it is preferred over symmetric encryption for storing passwords.

<p> Hashing is entirely different than encryption. Hash algorithm is used for comparison of values and not for encryption. Hashing creates a "HashDigest" for a value and it cannot be reversed back to the original data. Symmetric encryption creates a code which is meant to be decrypted back to value, when needed.
Hashing has 3 important characteristics - 
* Secure - Non-reversible
* Fixed Size - All Hash digest are of same size whether the password is long or short.
* Unique - No 2 different data sets can ever produce the same "Hash digest".
</p>
<p> Hashing is a one way process where the scrambled text received after hashing cannot be reverted back to the original text. The Hash digest cannot be decrypted.
Encryption is a 2 way process, where the scrambled text received after encryption can be decrypted back to the original value to make it readable again.
</p>
2. Find out how a Rainbow Table can be used to crack hashed passwords.
<p> A rainbow table contains the username, plaintext passwords and hashed passwords of all possible precompiled values. The precompiled hashed file is already available to lookup for a value being searched. A rainbow table is used only for offline attacks. A rainbow table attack is a much faster as compared to other methods of cracking passwords like Brute Force as the values are already available to lookup. On one hand its very fast but it takes a lots of space, sometimes in TBs to store the table of all possible values of passwords.</p>

3. Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.
* 03F6D7D1D9AAE7160C05F71CE485AD31   
* 03D086C9B98F90D628F2D1BD84CFA6CA

The First value is a very weak password and can be directly cracked using the Crack Statiion tool (https://crackstation.net/). 
* ![First digest -Screenshot](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/5160937eeb83e77a4c681866471e7b616b50c094/00_includes/03_Security/SEC07/SEC07-MD5-Pwd1.PNG)

The Second value is not an example of weak password and may require a number of iteration using the rainbow table method to crack the password.
* ![Second digest -Screenshot](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/5160937eeb83e77a4c681866471e7b616b50c094/00_includes/03_Security/SEC07/SEC07-MD5-Pwd2.PNG)

4. Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table.
![User Manisha_SEC07 Created with password](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/40de3824ee68d8bc920d75fed591fc52bb45fe8a/00_includes/03_Security/SEC07/SEC07-UserPwdCreated.PNG)   
![User and password in /etc/passwd in vm](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/40de3824ee68d8bc920d75fed591fc52bb45fe8a/00_includes/03_Security/SEC07/SEC07-UserExistsInPasswd.PNG)   
![User and password in /etc/shadow in vm](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/40de3824ee68d8bc920d75fed591fc52bb45fe8a/00_includes/03_Security/SEC07/SEC07-UserHashPwdInShadow.PNG)

5. Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted. To understand how salting works, find a peer who has the same password in /etc/shadow, and compare hashes.


***Comparing password Hashes found in /etc/shadow file from peers :***
* Hash Digest from my user:
$6$tDiiQCh.8SS5ylNx$bGokpzFCgfs99Mx1gTEkARbZvvR7j3TVSYDakALqosqxWDDLAgbqvbNFz3dC4Y.h/mTuMytEtPDSoLQNrqHtS.:19277:0:99999:7:::
* Hash Digest Peer 2:
$6$32NcX6zc4Xjp06ng$S.NPSGum7fp.ymU58Wuc3fXmb1.MRDeMwbZg/S./xbtFD4qSZQViO5KRYJl5qemumfux1ogLsn9Tty6aQONLe.:19277:0:99999:7:::
* Hash Digest Peer 3:
$6$0yMGt.627fBTkpSu$aHJmxDreibVN1tl8slXplz.EYQz19hWw2ctRBYnLttbVWiOa2r1nCFl2gUdavNSO7H1YHr8O4y.S/RI905/5e1:19276:0:99999:7:::
* Hash Digest Peer 4:
$6$zygYquEM2apQi67X$QeeoS2To6M9TAYOCy/FvKLWkNyNe0D6SzvIq6fVdnqmLSwVkUqFvWkdISfNOfn7hhPmjivAWcV894vSE/k4Af/:19276:0:99999:7:::

All the digests end is the same way, but the initial values are different inspite of the password being the same. This shows that salting has been done to the scambled text to make it more secure. So, if you apply salting, its not so easy to crack the common/bad password.

## Sources
![You Tube](https://www.youtube.com/watch?v=xsp--srKWKw)

![Rainbow Table](https://www.techtarget.com/whatis/definition/rainbow-table)

![Rainbow Table Attack -1](https://www.geeksforgeeks.org/understanding-rainbow-table-attack/#:~:text=A%20rainbow%20table%20is%20a,password%20produces%20a%20particular%20hash)

![Rainbow Table Attack - 2](https://www.geeksforgeeks.org/understanding-rainbow-table-attack/#:~:text=A%20rainbow%20table%20is%20a,password%20produces%20a%20particular%20hash.)

![Tool](https://crackstation.net/)




## Overcome challenges

Need to understand many dependent concepts to reach to the answers.

## Results
Screenshots in Exercise section

## End of Document




