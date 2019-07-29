@echo off
title %~1
set time0=%time%
g++ -o %~n1 %~nx1
set time1=%time%
if "%time0:~0,1%"=="0" (set /a h=%time0:~1,1%) else set /a h=%time0:~0,2%
if "%time0:~3,1%"=="0" (set /a m=%time0:~4,1%) else set /a m=%time0:~3,2%
if "%time0:~6,1%"=="0" (set /a s=%time0:~7,1%) else set /a s=%time0:~6,2%
if "%time0:~9,1%"=="0" (set /a centis=%time0:~10,1%) else set /a centis=%time0:~9,2%
set /a t0=h*360000+m*6000+s*100+centis
if "%time1:~0,1%"=="0" (set /a h=%time1:~1,1%) else set /a h=%time1:~0,2%
if "%time1:~3,1%"=="0" (set /a m=%time1:~4,1%) else set /a m=%time1:~3,2%
if "%time1:~6,1%"=="0" (set /a s=%time1:~7,1%) else set /a s=%time1:~6,2%
if "%time1:~9,1%"=="0" (set /a centis=%time1:~10,1%) else set /a centis=%time1:~9,2%
set /a t1=h*360000+m*6000+s*100+centis
set /a t=t1-t0
if %t% lss 0 set /a t+=8640000
set /a tc_cs1=t %% 10
set /a tc_cs0=t/10 %% 10
set /a tc_s=t/100
if not %errorlevel% equ 0 (
	echo Compilation Error! Failed to compile file %~nx1.
	echo Compiling time: %tc_s%.%tc_cs0%%tc_cs1%s
	echo Error level:    %errorlevel%
	echo Current time:   %time%
	pause
	goto :eof
)
echo Stdin and stdout:
echo ----------------------------------------------------------------
set time2=%time%
%~n1
set time3=%time%
echo ----------------------------------------------------------------
if "%time2:~0,1%"=="0" (set /a h=%time2:~1,1%) else set /a h=%time2:~0,2%
if "%time2:~3,1%"=="0" (set /a m=%time2:~4,1%) else set /a m=%time2:~3,2%
if "%time2:~6,1%"=="0" (set /a s=%time2:~7,1%) else set /a s=%time2:~6,2%
if "%time2:~9,1%"=="0" (set /a centis=%time2:~10,1%) else set /a centis=%time2:~9,2%
set /a t0=h*360000+m*6000+s*100+centis
if "%time3:~0,1%"=="0" (set /a h=%time3:~1,1%) else set /a h=%time3:~0,2%
if "%time3:~3,1%"=="0" (set /a m=%time3:~4,1%) else set /a m=%time3:~3,2%
if "%time3:~6,1%"=="0" (set /a s=%time3:~7,1%) else set /a s=%time3:~6,2%
if "%time3:~9,1%"=="0" (set /a centis=%time3:~10,1%) else set /a centis=%time3:~9,2%
set /a t1=h*360000+m*6000+s*100+centis
set /a t=t1-t0
if %t% lss 0 set /a t+=8640000
set /a tr_cs1=t %% 10
set /a tr_cs0=t/10 %% 10
set /a tr_s=t/100
echo Compiling time: %tc_s%.%tc_cs0%%tc_cs1%s
echo Running time:   %tr_s%.%tr_cs0%%tr_cs1%s
echo Return value:   %errorlevel%
echo Current time:   %time%
pause
