from ast import If
import random

# Define function to generate random integer
# parameter a is the startimg point
# parameter b is the end point
def gen_rand(a, b):
    x = random.randint(a, b)
    print(x)
    return x

gen_rand(1,100)

user_in = int(input("Enter a one or two digit number"))
even_num = (user_in/2)
Last_num = int('99')

If user_in > Last_num:
print('You are allowed to enter only 1 or 2 digit number')
elif (user_in % 2) == 0: 
print ('The number is even') 
else:
print ('The provided number is odd')

