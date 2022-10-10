# [Subject]
# SECURITY 04 - Symmetric Encryption

## Key terminology
* Cipher - Its a method of transforming a message to hide its meaning.
* Caeser Cipher - One of the simplest historic technique of encrytion. It works on substitution method.
The letter in the given text is replaced by a letter after fix number of positions. That position is called the key.   
Text : ABCDEFGHIJKLMNOPQRSTUVWXYZ                          
ShiftKey: 23    
Cipher: XYZABCDEFGHIJKLMNOPQRSTUVW  
Text : REPORT   
ShiftKey: 4   
Cipher: VITSVX

* Symmetric Encryption - In symmetric encryption, there is one key to a locked message. The same key is possesed by the sender and the receiver to encrypt and decrypt the message respectively. Its not considered very safe because anyone who get hold over the key can easily decrypt the data, in other words if someone hacks the key, he can easily keep decrypting the secret messages.

## Exercise
* Find two more historic ciphers besides the Caesar cipher.  
* **The Playfair Cipher Used Pairs of Letters For Encryption** -  
It first appeared in UK in 1854. It was also used in World War II.
It uses pairs of letters in simpler substitution ciphers and is much harder to break.   
* **Breaking The Enigma Code Significantly Shortened World War 2** -  
The term 'Enigma Code' is generally understood as the cipher device used by German forces during WW2 to encrypt their transmissions. these machine were invented by the Germans towards the end of World War I.
It first appaeared in 1918-1920 i n Germany.

* Find two digital ciphers that are being used today.
ROT13 - It is a recent form of Caesar Cipher. The ROT13 method moves 13 letters forward. The reason of moving 13 places is that with 2 rounds of substitution decrypts the message to its original form.   
RC4(Rivest Cipher 4) - This method is most widely used mostly in software.

* Send a symmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone. 
You are not allowed to use any private messages or other communication channels besides Slack. Analyse the shortcomings of this method.


## Sources
[Ceasar Cipher](https://www.sciencedirect.com/topics/computer-science/caesar-cipher)

[Encryption Key Generator](https://generate-random.org/encryption-key-generator?count=1&bytes=32&cipher=des-cbc&string=&password=)

[Tool to encrypt the text](https://www.tools4noobs.com/online_tools/encrypt/)


## Overcome challenges

Exploring the solution took longer since there are many ways to do the same thing.


## Results
