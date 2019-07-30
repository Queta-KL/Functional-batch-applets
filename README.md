# Functional-batch-applets
There are some independent batch programs:
+ [runcpp.bat](#runcbat): Compiling and running C/C++ in one command or even by double-clicking the file, when the default program set.
+ [jump.bat](#jumpbat): Changing to the wanting directory in one command. You can get rid of typing too many cd's.

## runc.bat
### Summary
It can be used as the default program for C/C++ source code files.
Then when you double click your C/C++ source code file, it will be compiled (by gcc or g++ correspondingly) and run.
No need to type on the command line.
### Help
Command-line arguments for the C/C++ programs are still acceptable. 
```cmd
>>runc /?
Compiles and runs C/C++ source code files.

Usage:  RUNC [file.cpp | file.c | /?] [command-line arguments for the C/C++ program]

    No args    Display help. This is the same as typing /?.
    -?         Display help. This is the same as not typing any options.
    xxx.cpp    This C++ source code file will be compiled (by g++) and run.
    xxx.c      This C source code file will be compiled (by gcc) and run.

Command-line arguments for the C/C++ program are acceptable, by following the file name.

This batch program (runc.bat) is recommended to be set as the default program for C/C++ source code files.
```
### Example
Here is an example:
```cmd
>> runc displayCLA.cpp a b c 1 2 3
Stdin and stdout:
----------------------------------------------------------------
argv[0]:displayCLA
argv[1]:a
argv[2]:b
argv[3]:c
argv[4]:1
argv[5]:2
argv[6]:3
----------------------------------------------------------------
Compiling time: 0.21s
CMDL arguments: a b c 1 2 3
Running time:   3.00s
Return value:   12345
Press any key to continue . . .
```
The source code of displayCLA.cpp:
```cpp
#include<cstdio>
#include<ctime>
int main(int argc, char *argv[]) {
	// command-line arguments
	for (unsigned int i=0; i<argc; i++)
		printf("argv[%u]:%s\n", i, argv[i]);
	
	// running time
	time_t t0=clock();
	unsigned int runningTime(3000);
	while (clock()-t0 < runningTime) {}
	
	// return value
	return 12345;
}

```
## jump.bat
### Summary
It can be put in the default directory of the command line.
It is designed to change the directory quickly to that of your project.
You will be freed from typing many "cd"'s and searching the directory.
The list recording the directories of each project is stored in "jumplist.txt" under the same directory of "jump.bat"
### Usage example
In this example, entering and exiting a project are both convenient, only one command needed.
```cmd
C:\Users\ABCD>jump EE102
NAME: EE102  NOTE: Course project of EE102

Files in C:\Studying\Major\EE102\homework\project:
----------------------------------------------------------------
config.json
control.txt
eval.py
lib
LICENSE
log.txt
main.py
results
testset
train.py
trainset
utils.py

C:\Studying\Major\EE102\homework\project>echo OK
OK

C:\Studying\Major\EE102\homework\project>exit
Back to the former directory. (C:\Users\ABCD)

C:\Users\ABCD>
```
### Help
If you have three projects "EE102", "Summer" and "Intern", the project list will be displayed as below. By command "jump xxx", the directory will be changed to that of the project. The list of project name, directory and note is stored in "jumplist.txt".
```cmd
>> jump /?
Goes to a project directory quickly.

JUMP [project_name] [/? JUMPLIST|ADD|DEL] [/JUMPLIST] [/ADD name drct note] [/DEL name]

Project list are stored in the text file of "jumplist.txt".
Project list:
    [EE102]     Note: Course project of EE102
    Directory: "C:\Studying\Major\EE102\homework\project"

    [Summer]    Note: Facial recognition this summer
    Directory: "C:\ML\Research\AIlab\face\"

    [Intern]    Note: The intern project
    Directory: "C:\company\project1\"
```
### "jumplist.txt"
The list of project name, directory and note is stored in "jumplist.txt". Here is an example:
```
# Project name
# Project directory
# Project note

# MyFirstProject
# "C:\myname\somefolder\"
# Hello world

EE102
"C:\Studying\Major\EE102\homework\project"
Course project of EE102

Summer
"C:\ML\Research\AIlab\face\"
Facial recognition this summer

Intern
"C:\company\project1\"
```
The help for jumplist:
```cmd
>>jump /jumplist
Project list are stored in the text file of "jumplist.txt".

The standard format:
----------------------------------------------------------------
# MyFirstProject
# "C:\myname\somefolder\"
# Hello world

"name_1"
"directory_1"
"note_1"

"name_2"
"directory_2"
"note_2"

...
----------------------------------------------------------------

"name_i" is the name of a project with no spaces. Not case sensitive.
"directory_i" is its directory.
"note_%i" is its explanatory note that must NOT be empty. Spaces are allowed.

The lines starting with the pound key (#) will be commented out.
```
### /ADD & /DEL command to edit "jumplist.txt"
You can use /ADD and /DEL command to edit jumplist.txt in command line. After your update, you can view the whole list by "jump" command. Here is an example:
``` cmd
>>jump /del intern
Successfully deletes the project named Intern.

Successfully updated "jumplist.txt".

>>jump
Goes to a project directory quickly.

JUMP [project_name] [/? JUMPLIST|ADD|DEL] [/JUMPLIST] [/ADD name drct note] [/DEL name]

Project list are stored in the text file of "jumplist.txt".
Project list:
    [EE102]     Note: Course project of EE102
    Directory: "C:\Studying\Major\EE102\homework\project"

    [Summer]    Note: Facial recognition this summer
    Directory: "C:\ML\Research\AIlab\face\"

>>jump /add leetcode "C:\coding\OJ\leetcode" OJ
Successfully adds a new project named leetcode:

    [leetcode]  Note: OJ
    Directory: "C:\coding\OJ\leetcode"

Successfully updated "jumplist.txt".

>>jump
Goes to a project directory quickly.

JUMP [project_name] [/? JUMPLIST|ADD|DEL] [/JUMPLIST] [/ADD name drct note] [/DEL name]

Project list are stored in the text file of "jumplist.txt".
Project list:
    [EE102]     Note: Course project of EE102
    Directory: "C:\Studying\Major\EE102\homework\project"

    [Summer]    Note: Facial recognition this summer
    Directory: "C:\ML\Research\AIlab\face\"

    [leetcode]  Note: OJ
    Directory: "C:\coding\OJ\leetcode"
 ```
 The help for the two command /ADD and /DEL:
 ```cmd
>>jump /add /?
Adds a new project directory of "name" "directory" "note" to "jumplist.txt".

Usage:  JUMP /ADD name directory note

Example:
JUMP /ADD MyFirstProject "C:\myname\somefolder\" Hello,world

>>jump /del /?
Deletes the project "name" and its directory and note from "jumplist.txt".

Usage:  JUMP /DEL name

Example:
JUMP /DEL MyFirstProject
 ```
 
