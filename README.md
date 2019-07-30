# Functional-batch-applets
There are some independent batch programs:
+ [runcpp.bat](#runcbat): Compiling and running C/C++ in one command or even by double-clicking the file, when the default program set.
+ [jump.bat](#jumpbat): Changing to the wanting directory in one command. You can get rid of typing too many cd's.

## runc.bat
It can be used as the default program for C/C++ source code files.
Then when you double click your C/C++ source code file, it will be compiled (by gcc or g++ correspondingly) and run.
No need to type on the command line.
Command-line arguments for the C/C++ programs are still acceptable. 
```
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
Here is an example:
```
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
It can be put in the default directory of the command line.
It is designed to change the directory quickly to that of your project.
You will be freed from typing many "cd"'s and searching the directory.
The list recording the directories of each project is stored in "jumplist.txt" under the same directory of "jump.bat"

For example:
```bat
jump EE102
```
