
#Create a list of five integers.
#Use a for loop to do the following for every item in the list:
#Print the value of that item added to the value of the next item in the list.
#If it is the last item, add it to the value of the first item instead (since there is no next item).

lst = (5,10,15,20,25)
num = range(len(lst))
print(num)

for i in num:
    print(i)
    print(i+1)
    print(lst[i])

    if i < (len(lst)-1):
        print(lst[i]+lst[i+1])
    else:
        print(lst[i]+lst[0])
        break

    

 
