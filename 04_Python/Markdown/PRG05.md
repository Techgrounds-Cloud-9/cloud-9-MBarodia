# [Condition]
# PRG05

# Exercise
Exercise 1:
Create a new script.
Use the input() function to ask the user of your script for their name. If the name they input is your name, print a personalized welcome message. If not, print a different personalized message.
Example output:


Name = input("Name: ")
if Name == 'Manisha':
    print("Welcome " + Name)
else:
    print("You are " + Name + " Invalid user. Please Leave.")
    

Exercise 2:
Create a new script.
Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
Example output:
Make the game repeat until the user inputs 100.


a = 0
a = int(input("Enter Number: "))
if a > 100:
    print("This number greater than 100")
elif a < 100:
    print("The number is less than 100")
elif a == 100:
    print("This number is 100. Hooraay!!")