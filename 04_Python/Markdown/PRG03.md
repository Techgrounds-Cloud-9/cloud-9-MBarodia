# [Data Types and Comments]
# PRG03

## Key terminology

DataTypes in Python - Data type refers to the kind of data a variable holds

### Exercise 1:
Create a new script.
Copy the code below into your script.
a = 'int'
b = 7
c = False
d = "18.5"
Determine the data types of all four variables (a, b, c, d) using a built in function.
Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.
Write a comment above every line of code that tells the reader what is going on in your script.

### Script
* [Script-EXC01](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7aacd4e70c59f421588eea759138fd31f61a1988/04_Python/Scripts/PRG03-EXC01.py)

### Python Code:

<pre><code>
a = 'int'
b = 7
c = False
d = "18.5"

print("Data Type of a")
print(type(a))
print("Data Type of b")
e = type(b)
print(e)
print("Data Type of c: ")
print(type(c))
print("Data Type of d: ")
print(type(d))
p = float(d)
x = b+p
print(x)
</pre>
</code>

### Result:
<pre><code>

Data Type of a
<class 'str'>
Data Type of b
<class 'int'>
Data Type of c:
<class 'bool'>
Data Type of d:
<class 'str'>
25.5
</pre>
</code>
Exercise 2:
Create a new script.
Use the input() function to get input from the user. Store that input in a variable.
Find out what data type the output of input() is. See if it is different for different kinds of input (numbers, words, etc.).

### Script
* [Script-EXC02](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/7aacd4e70c59f421588eea759138fd31f61a1988/04_Python/Scripts/PRG03-EXC02.py)
### Python Code
<pre><code>
Value1 = input("Enter Value 1:")
print("Value 1- " + Value1)
print(type(Value1))
Value2 = input("Enter Value 2:")
print("Value 2- " + Value2)
print(type(Value2))
Value3 = input("Enter Value 3:")
print("Value 3- " + Value3)
print(type(Value3))

</pre>
</code>
### Result

<pre><code>
Enter Value 1:24
Value 1- 24
<class 'str'>
Enter Value 2:Manisha
Value 2- Manisha
<class 'str'>
Enter Value 3:2.5
Value 3- 2.5
<class 'str'>

</pre></code>
## Results

![Exercise 01 - Result](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/d125b0bc100b66b86bd29755f0ad5739b946cb8d/00_includes/04_Python/PRG03/EXC01.PNG)

![Exercise 02 - Result](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/d125b0bc100b66b86bd29755f0ad5739b946cb8d/00_includes/04_Python/PRG03/EXC02.PNG)

## Overcome Challenges

None

## Source

None

## End of Document

