# Determine the data types of all four variables (a, b, c, d) using a built in function.
# Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.
# Write a comment above every line of code that tells the reader what is going on in your script.

a = 'int'
b = 7
c = False
d = "18.5"
# Print data type for variable a
print("Data Type of a")
print(type(a))
# Print data type for variable b
print("Data Type of b")
e = type(b)
print(e)
# Print data type for variable c
print("Data Type of c: ")
print(type(c))
# Print data type for variable d
print("Data Type of d: ")
print(type(d))
# Created new variable p and assigned it the value of d, also convert d to float data type. 
# d was actually a string value

p = float(d)
# Calculate x by adding b, which is a number and d, which is float
x = b+p
print(x)



