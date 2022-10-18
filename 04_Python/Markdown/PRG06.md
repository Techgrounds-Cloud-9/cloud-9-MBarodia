# [Functions]
# PRG06

# Key Terminology

### Functions in Python  
* Function is a piece of code which performs specific tasks. Function is defined with a name. Once defined function can be called repeatedly whenever the same task need to be performed. A function can be with parameters or without parameters.   
Examples:
my_function()
my_function(fname, lname)
my_function(city='London')

* Random package - Random is a packagae already available in python. It contains various functions viz, 


# Exercise
### Exercise 1:
Create a new script.
Import the random package.
Print 5 random integers with a value between 0 and 100.
Python Code:

<pre><code>
import random
x= 0
for i in range(5):
    x = random.randrange(0, 101)
    print (i)
    print (x)

</pre>
</code>


### Exercise 2:
Create a new script.
Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.
Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.

Python Code:
<pre><code>
def PRG06_function1():
  print("Hello world!! 17th Oct")

PRG06_function1()

# Additional Function

def PRG06_function2(fname):
    print("Hello " + fname + "!")

PRG06_function2('Manisha')
PRG06_function2('Emily')
</pre>
</code>

### Exercise 3:
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

<pre><code>
import statistics
from sys import argv

def PRG06_avg1():
    x = 10
    y = 20
    avg1 = (x+y)/2
    print(avg1)
    print ("The average of",x, "and", y, " is",avg1)
  
    PRG06_avg1()

  # Additonal Function created to check working with dynamic values

def PRG06_avg2(x,y):
    a = int(input("x:"))
    b = int(input("y:"))
    avg2 = (a+b)/2
    print(avg2)
    print ("The average of",a, "and", b, " is",avg2)

    PRG06_avg2(x,y)

</pre>
</code>

## Results
![Exercide 01 - Result](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/e3d76e3f81e9b770dab305898f406a169df52ab2/00_includes/04_Python/PRG06/PRG06-EXC01.PNG)

![Exercide 02 - Result](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/e3d76e3f81e9b770dab305898f406a169df52ab2/00_includes/04_Python/PRG06/PRG06-EXC02.PNG)

![Exercide 03 - Result](https://github.com/Techgrounds-Cloud-9/cloud-9-MBarodia/blob/e3d76e3f81e9b770dab305898f406a169df52ab2/00_includes/04_Python/PRG06/PRG06-EXC03.PNG)

## Overcome Challenges
 None
## Sources
None
# End of Document