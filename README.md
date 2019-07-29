# Functional-batch-applets
There are some independent batch programs:
## runcpp.bat
It can be used as the default program for C/C++ programs.
Then when you double click your C/C++ program, it will be compiled (by gcc or g++ correspondingly) and run.
No need to type on the command line.
Command-line arguments for the C/C++ program are still acceptable. 
```
>>runcpp /?
Compiles and runs C/C++ program files.

Usage:  RUNCPP [file.cpp | file.c | /?] [command-line arguments for the C/C++ program]

    No args    Display help. This is the same as typing /?.
    -?         Display help. This is the same as not typing any options.
    xxx.cpp    This C++ program file will be compiled (by g++) and run.
    xxx.c      This C program file will be compiled (by gcc) and run.

Command-line arguments for the C/C++ program are acceptable, by following the file name.

This batch program (runcpp.bat) is recommended as the default program for the C/C++ program files.
```
Here is an example:
```
>> runcpp displayCLA.cpp a b c 1 2 3
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
To be freed from typing many "cd"'s and searching the directory.
```bat
jump EE102
```
