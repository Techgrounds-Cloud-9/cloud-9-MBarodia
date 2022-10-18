

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

    

 
