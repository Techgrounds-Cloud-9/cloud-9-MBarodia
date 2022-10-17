# [Functions]
# PRG06

# Exercise
Exercise 1:
Create a new script.
Import the random package.
Print 5 random integers with a value between 0 and 100.
Example output:


Exercise 2:
Create a new script.
Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.
Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.

Python Code:

def PRG06_function1():
  print("Hello world!! 17th Oct")

PRG06_function1()

def PRG06_function2(fname):
    print("Hello " + fname + "!")

PRG06_function2('Manisha')
PRG06_function2('Emily')


Exercise 3:
Create a new script.
Copy the code below into your script.
def avg():
    # write your code here

 Example:

x = 128
y = 255
z = avg(x,y)
print ("The average of",x,"and", y, "is", z)
Write the custom function avg() so that it returns the average of the given parameters.

Python Code:

import statistics
from sys import argv

def PRG06_avg1():
    x = 10
    y = 20
    avg1 = (x+y)/2
    print(avg1)
    print ("The average of",x, "and", y, " is",avg1)
  
    PRG06_avg1()
    
def PRG06_avg2(x,y):
    a = int(input("x:"))
    b = int(input("y:"))
    avg2 = (a+b)/2
    print(avg2)
    print ("The average of",a, "and", b, " is",avg2)

    PRG06_avg2(x,y)