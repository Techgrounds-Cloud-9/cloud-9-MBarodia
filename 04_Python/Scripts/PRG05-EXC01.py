# Use the input() function to ask the user of your script for their name. 
# If the name they input is your name, print a personalized welcome message. 
# If not, print a different personalized message.

Name = input("Name: ")
if Name == 'Manisha':
    print("Welcome " + Name)
else:
    print("You are " + Name + " Invalid user. Please Leave.")
