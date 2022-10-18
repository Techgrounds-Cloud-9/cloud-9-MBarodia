# Ask the user of your script for a number. 
# Give them a response based on whether the number is higher than, lower than, or equal to 100.


a = 0
a = int(input("Enter Number: "))
if a > 100:
    print("This number greater than 100")
elif a < 100:
    print("The number is less than 100")
elif a == 100:
    print("This number is 100. Hooraay!!")