"""
The output should be:
0
1
2
3
4
8
9
"""

for i in range(10):
	if i < 3:
		print(i)
	elif i > 5:
        print(i,'in i>5')
        break
	else:
		print(i)