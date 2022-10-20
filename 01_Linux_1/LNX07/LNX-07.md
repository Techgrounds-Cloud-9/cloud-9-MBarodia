


# [Subject]
# LINUX 07

## Key terminology
* BASH - Bourne Again Shell  - Shell script Interpreter
* PATH Varable  - It is a linux enviornemnt variable which lists directories and tells the shell where to look for executable files. when we execute the shell script, the shell looks in all the directories mentioned in the user $PATH to find the executable of that name.
ALl directories containing the shell scripts must be listed within $PATH variable.
If there are 2 files of same name in different directories, then the first one will be executed.
 


## Exercise
Exercise 1:
Create a directory called ‘scripts’. Place all the scripts you make in this directory.
Add the scripts directory to the PATH variable.
Create a script that appends a line of text to a text file whenever it is executed.
Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.

Variables:
You can assign a value to a string of characters so that the value can be read somewhere else in the script.
Assigning a variable is done using ‘=’.
Reading the value of a variable is done using ‘$<insert variable name here>’.

Exercise 2:
Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.


## Sources
https://linuxconfig.org/how-to-add-directory-path-to-path-variable

https://unix.stackexchange.com/questions/31414/how-can-i-pass-a-command-line-argument-into-a-shell-script


## Overcome challenges
Technical issues  - More than 1 .swp files are created in the folder where the .sh file is placed and executed.
the .swp file is not visible with ls -ltr command. 
Use ls -lA to see all files and delete the .swp file to proceed.



## Results
Executed following commands to acheive results -
- Make directory scripts
mkdir /Techgrounds/scripts
- Add the new directory "scripts" to the path variable to allow execution of scripts placed in the scripts folder.
export PATH="/home/manisha/Techgrounds/scripts:$PATH" 
- recheck the value of path variable to make sure your path is added.
echo $PATH
- Script to append a line of text to the text file
LNX07.sh
- script that installs the httpd package, activates httpd, and enables httpd. Print the staus of httpd in the terminal.
LNX07_httpd.sh
- script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.
LNX07_Generate_Random_Numbers.sh

## Images
![Create_Script_Folder] (/00_includes/LNX-07-ScriptFolder)
![Folder_scripts_added_to_$PATH] (/00_includes/LNX-07-ScriptsAddedToPATHVar)
![AppendTextToFile] (/00_includes/LNX-07-AppendText)
![Install_httpd](/00_includes/LNX07_ExecuteLNX07_httpd)
(/00_includes/LNX07_ExecuteLNX07_httpd_Continued)
![Install_httpd](/00_includes/LNX-07-GenRandomNumber)

