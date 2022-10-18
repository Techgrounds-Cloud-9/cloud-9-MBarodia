# Create a new script.
# Copy the code below into your script.
# def avg():
#    # write your code here

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

