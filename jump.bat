@echo off & setlocal EnableDelayedExpansion
set /a len=0
set /a item=0
if not exist "jumplist.txt" goto newjumplist
:readfromjumplist
for /f "eol=# delims=" %%i in (jumplist.txt) do (
	set p[!len!][!item!]=%%i
	set /a item=!item!+1
	if !item! equ 3 (
		set /a item=0
		set /a len=!len!+1
	)
)
set /a len=%len%-1
if not %item% equ 0 (
	echo Errors detected in the text file of "jumplist.txt".
	echo.
	goto documentation_jumplist
)
::help
for %%i in ("","/help","-help","--help") do if /i "%1"==%%i goto documentation
if /i "%1"=="/?" goto documentation
if /i "%1"=="-?" goto documentation
if /i "%1"=="--?" goto documentation
::help jumplist
for %%i in ("/jumplist","-jumplist","--jumplist") do if /i "%1"==%%i (
	echo Project list are stored in the text file of "jumplist.txt".
	echo. 
	goto documentation_jumplist
)
::add
for %%i in ("/add","-add","--add") do if /i "%1"==%%i goto func_add
::del
for %%i in ("/del","-del","--del") do if /i "%1"==%%i goto func_del
::jump
for /l %%i in (0,1,%len%) do (
	if /i  "%1" == "!p[%%i][0]!" (
		echo NAME: !p[%%i][0]!	NOTE: !p[%%i][2]!	
		echo.
		cd /d !p[%%i][1]!
		echo Files in !cd!:
		echo --------------------------------
		dir /a /b
		echo.
		cmd /k
		echo Back to the former directory. (%cd%^)
		goto :eof
	)
)
echo Error. Unknown project name detected.  Try "jump /?".
goto :eof

:func_add
for %%i in ("","/help","-help","--help") do if /i "%2"==%%i goto documentation_add
if /i "%2"=="/?" goto documentation_add
if /i "%2"=="-?" goto documentation_add
if /i "%2"=="--?" goto documentation_add
if /i "%3"=="" (
	echo Error. "directory" must be inputed.
	goto :eof
)
if /i "%4"=="" (
	echo Error. "note" must be inputed.
	goto :eof
)
for /l %%i in (0,1,%len%) do if /i  "%2" == "!p[%%i][0]!" (
	echo Error. A project named "!p[%%i][0]!" already exists.
	goto :eof
)
set /a len=%len%+1
set p[%len%][0]=%2
set p[%len%][1]=%3
set p[%len%][2]=%4
echo Successfully adds a new project named !p[%len%][0]!:
echo.
echo     [!p[%len%][0]!]	Note: !p[%len%][2]!
echo     Directory: !p[%len%][1]!
echo.
set /a idx=%len%+1
goto writejumplist

:func_del
for %%i in ("","/help","-help","--help") do if /i "%2"==%%i goto documentation_del
if /i "%2"=="/?" goto documentation_del
if /i "%2"=="-?" goto documentation_del
if /i "%2"=="--?" goto documentation_del
set /a idx=-1
for /l %%i in (0,1,%len%) do if /i "%2" == "!p[%%i][0]!" set /a idx=%%i
if %idx% equ -1 (
	echo Error. No project named "%2" existing.
	goto :eof
)else (
	echo Successfully deletes the project named !p[%idx%][0]!.
	echo.
)
goto writejumplist

:writejumplist
echo # Project name>jumplist.txt
echo # Project directory>>jumplist.txt
echo # Project note>>jumplist.txt
echo.>>jumplist.txt
echo # MyFirstProject>>jumplist.txt
echo # "C:\myname\somefolder\">>jumplist.txt
echo # Hello world>>jumplist.txt
echo.>>jumplist.txt
for /l %%i in (0,1,%len%) do if not %%i equ %idx% (
	echo !p[%%i][0]!>>jumplist.txt
	echo !p[%%i][1]!>>jumplist.txt
	echo !p[%%i][2]!>>jumplist.txt
	echo.>>jumplist.txt
)
echo Successfully updated "jumplist.txt".
goto :eof

:newjumplist
echo # Project name>jumplist.txt
echo # Project directory>>jumplist.txt
echo # Project note>>jumplist.txt
echo.>>jumplist.txt
echo # MyFirstProject>>jumplist.txt
echo # "C:\myname\somefolder\">>jumplist.txt
echo # Hello world>>jumplist.txt
echo.>>jumplist.txt
goto readfromjumplist	

:documentation
for %%i in ("jumplist","/jumplist","-jumplist","--jumplist") do if /i "%2"==%%i (
	echo Project list are stored in the text file of "jumplist.txt".
	echo. 
	goto documentation_jumplist
)
for %%i in ("add","/add","-add","--add") do if /i "%2"==%%i goto documentation_add
for %%i in ("del","/del","-del","--del") do if /i "%2"==%%i goto documentation_del
if not "%2"=="" (
	echo Unknown command %2.
	goto :eof
)
echo Goes to a project directory quickly.
echo.
echo JUMP [project_name] [/? JUMPLIST^|ADD^|DEL] [/JUMPLIST] [/ADD name drct note] [/DEL name]
echo.
echo Project list are stored in the text file of "jumplist.txt".
if %len% equ -1 (
	echo Empty "jumplist.txt"
) else (
	echo Project list:
	for /l %%i in (0,1,%len%) do (
		echo     [!p[%%i][0]!]	Note: !p[%%i][2]!
		echo     Directory: !p[%%i][1]!
		if not %%i equ %len% echo.
		)
	)
)
goto :eof

:documentation_jumplist
echo The standard format:
echo --------------------------------
echo # MyFirstProject
echo # "C:\myname\somefolder\"
echo # Hello world
echo.
for /l %%i in (1,1,2) do (
	echo "name_%%i"
	echo "directory_%%i"
	echo "note_%%i"
	echo.
	)
echo ...
echo --------------------------------
echo. 
echo "name_i" is the name of a project with no spaces. Not case sensitive.
echo "directory_i" is its directory.
echo "note_%%i" is its explanatory note that must NOT be empty. Spaces are allowed.
echo. 
echo The lines starting with the pound key (^#^) will be commented out.
goto :eof

:documentation_add
echo Adds a new project directory of "name" "directory" "note" to "jumplist.txt".
echo.
echo Usage:	JUMP /ADD name directory note
echo.
echo Example:
echo JUMP /ADD MyFirstProject "C:\myname\somefolder\" Hello,world
goto :eof

:documentation_del
echo Deletes the project "name" and its directory and note from "jumplist.txt".
echo.
echo Usage:	JUMP /DEL name
echo.
echo Example:
echo JUMP /DEL MyFirstProject
goto :eof
