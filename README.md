# Functional-batch-applets
There are some independent batch programs:
## runcpp.bat
It can be used as the default program for C/C++ programs.
Then when you double click your C/C++ program, it will be compiled (by gcc or g++ correspondingly) and run.
No need to type on the command line.
Command-line arguments for the C/C++ program are still acceptable. 
'''
>>runcpp
Compiles and runs C/C++ program files.

Usage:  RUNCPP [file.cpp | file.c | /?] [Command-line arguments for the C/C++ program]

    No args    Display help. This is the same as typing /?.
    -?         Display help. This is the same as not typing any options.
    xxx.cpp    This C++ program file will be compiled (by g++) and run.
    xxx.c      This C program file will be compiled (by gcc) and run.

Command-line arguments for the C/C++ program are acceptable, by following the file name.

This batch program (runcpp.bat) is recommended as the default program for the C/C++ program files.
'''
## jump.bat
It can be put in the default directory of the command line.
It is designed to change the directory quickly to that of your project.
To be freed from typing many "cd"'s and searching the directory.
```bat
jump EE102
```
