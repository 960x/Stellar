@echo off
title 960X Builder
cd /d %`dp0

title Verifying If Python Is Installed...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python Is Not Installed! [Go To https://www.python.org/downloads And Instal The Latest Version.^]
    echo Make Sure U Add It To PATH
    goto ERROR
)

title Checking Libraries...
echo Checking 'customtkinter' [1/4]
python -c "import customtkinter" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing customtkinter
    python -m pip install customtkinter > nul
)

echo Checking 'pillow' [2/4]
python -c "import PIL" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pillow
    python -m pip install pillow > nul
)

echo Checking 'pyaes' [3/4]
python -c "import pyaes" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing pyaes...
    python -m pip install pyaesm > nul
)

echo Checking 'urllib3' [4/4]
python -c "import urllib3" > nul 2>&1
if %errorlevel% neq 0 (
    echo Installing urllib3...
    python -m pip install urllib3 > nul
)

cls
title Starting Builder...
python gui.py
if %errorlevel% neq 0 goto ERROR 
exit

:ERROR
color 4 && title [Error]
pause > nul
