# [Subject]
# NTW04

## Key terminology
* Binary 
* Hex


## Exercise
Translate the following decimal numbers into binary:

Decimal ___  Binary

16   __      10000


128 ___ 10000000


228 ___ 11100100


112___1110000


73 ___ 1001001




Translate the following binary numbers into decimal:   
Binary     ___        Decimal  

1010 1010  ___     170


1111 0000  ___ 240

1101 1011 ___219

1010 0000___  160

0011 1010 ___58




Translate the following decimal numbers into hexadecimal:  
Decimal        ___           Hex   

15   ___    F

37  ___   25

246  ___   F6

125   ___  7D

209  ___  D1


Translate the following hexadecimal numbers into decimal:   
Hex           ___           Decimal

88   ___   136

e0   ___  224

cb  ___ 203

2f  ___  47

d8 ___ 216



## Sources Links
* [Calculator](https://www.rapidtables.com/convert/number/) 
* [Decimal to Binary](https://www.cuemath.com/numbers/decimal-to-binary/)
* [Binary to Decimal](https://flexiple.com/developers/decimal-to-binary-conversion/)  
* [Decimal to Hexa](https://www.permadi.com/tutorial/numDecToHex/)
* [Hexa to Decimal](https://www.cuemath.com/numbers/hexadecimal-to-decimal/)
NTW04-Dec-Binary.png

## Overcome challenges

None

## Results
### Decimal to Binary :
* Write down the number.
* Divide it by 2 and note the remainder.
* Divide the quotient obtained by 2 and note the remainder.
* Repeat the same process till we get 0 as the quotient.
* Write the values of all the remainders starting from the bottom to the top.
*[Pictorial Presentation](../00_includes/02_Networking/NTW04/NTW04-Dec-Binary.png)

### Binary to decimal: 
* To convert a binary integer to decimal, start by adding the left-most digit to 0.
* Next, multiply this by 2, and add the next digit in your number (as you progress from left to right) to this product. (In other words, multiply the current product in each step by 2 and add the current digit).
* Continue this process until there are no more digits left.

For example, let us convert the binary integer 1001 to decimal. Multiply the total by 2 and add the current digit, starting from the left.
Hence, the binary to decimal conversion of 1001 is 9.

### Decimal to Hex

* Divide the decimal number by 16. Treat the division as an integer division.
* Write down the remainder (in hexadecimal).
* Divide the result again by 16. Treat the division as an integer division.
* Repeat step 2 and 3 until result is 0.
* The hex value is the digit sequence of the remainders from the last to first.

###  Hex to Decimal

* The conversion of hexadecimal to decimal is done by using the base number 16. 
* The hexadecimal digit is expanded to multiply each digit with the power of 16.
* The power starts at 0 from the right moving forward towards the right with the increase in power. 
* For the conversion to complete, the multiplied numbers are added.

