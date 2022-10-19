import csv
from optparse import Values

# Taking user inputs
fname = input("Enter your First name: ")
lname = input("Enter your Last name: ")
jtitle = input("Enter your Job title: ")
company = input("Enter your Company: ")

print(fname)


# Populate values in the dictionary
#emp_info = ['FirstName','LastNAme','JobTitle','Company']
mydict = {
  "First name": fname,
  "Last name": lname,
  "Job title": jtitle,
  "Company": company
  }
print(mydict)

myfile = open('PRG08_EmpDetails_M.csv', 'a')
writer = csv.DictWriter(myfile, mydict.keys())
   # writer.writeheader()
writer.writerow(mydict)

myfile.close()


print("Completed")