@echo off 
setlocal enabledelayedexpansion
color 0A
chcp 65001 >null
title 🎛️ Ultimate CMD Tool



:: Greeting
echo ======================================
echo 👋 Hey %USERNAME%, making this ready ......
echo ======================================
echo.
pause

:menu
cls
echo ======================================
echo 🔧 Ultimate CMD Control Tool
echo ======================================
echo 1️⃣  Server Status Check 🌐
echo 2️⃣  Weather Info ☁️
echo 3️⃣  Network Tools 📡
echo 4️⃣  System Info 💻
echo 5️⃣  Spicetify Tools 🎵
echo 6️⃣  Exit ❌
echo ======================================
set /p choice="👉 Choose an option (1-6): "

if %choice%==1 goto serverCheck
if %choice%==2 goto weather
if %choice%==3 goto networkTools
if %choice%==4 goto sysInfo
if %choice%==5 goto spicetifyMenu
if %choice%==6 exit
goto menu

:serverCheck
cls
echo ======================================
echo 🌐 Server Status Check
echo ======================================
echo 1. Default Servers (india.gov.in, Google, YouTube)
echo 2. Custom Server
echo 3. Back

set /p srvChoice=Enter your choice (1/2/3):


if %srvChoice%==1 (
    echo 🔍 Checking india.gov.in ...
    ping -n 1 www.india.gov.in >nul && echo ✅ india.gov.in is UP || echo ❌ india.gov.in is DOWN

    echo 🔍 Checking google.com ...
    ping -n 1 google.com >nul && echo ✅ google.com is UP || echo ❌ google.com is DOWN

    echo 🔍 Checking youtube.com ...
    ping -n 1 youtube.com >nul && echo ✅ youtube.com is UP || echo ❌ youtube.com is DOWN

    pause
    goto serverCheck
)

if %srvChoice%==2 (
    set "customSrv="
    set /p customSrv="👉Enter server/website (e.g. google.com):" 
    if not "!customSrv!"=="" (
        echo 🔍 Checking !customSrv! ...
        ping -n 1 !customSrv! >nul && echo ✅ !customSrv! is UP || echo ❌ !customSrv! is DOWN
    ) else (
        echo ⚠️ You didn’t type anything!
    )
    pause
    goto serverCheck
)

if %srvChoice%==3 (
    goto menu
)

echo ⚠️ Invalid choice! Try again.
pause
goto serverCheck




:weather
cls
echo ======================================
echo ☁️ Weather Info
echo ======================================
set /p CITY="👉 Enter your city: "
powershell -command "Invoke-RestMethod http://wttr.in/%CITY%?format=3"
pause
goto menu

:networkTools
cls
echo ======================================
echo 📡 Network Tools
echo ======================================
echo 1️⃣  Flush DNS 🧹
echo 2️⃣  Show IP Config 🌍
echo 3️⃣  Show Network Stats 📊
echo 4️⃣  Simulated Speed Test ⚡
echo 5️⃣  Back 🔙
set /p netChoice="👉 Choose (1-5): "

if %netChoice%==1 (
    ipconfig /flushdns
    echo ✅ DNS Cache Flushed
    pause
    goto networkTools
)

if %netChoice%==2 (
    ipconfig
    pause
    goto networkTools
)

if %netChoice%==3 (
    netstat -e
    pause
    goto networkTools
)

if %netChoice%==4 (
    echo 🚀 Running simple ping-based speed test...
    ping -n 10 google.com
    echo ⚠️ This only shows latency, not bandwidth!
    pause
    goto networkTools
)

if %netChoice%==5 goto menu
goto networkTools


:sysInfo
cls
echo ======================================
echo 💻 System Information
echo ======================================
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.
echo 🖥️ CPU: 
wmic cpu get name
echo.
echo 💾 RAM (bytes): 
wmic memorychip get capacity
echo.
echo 🎮 GPU: 
wmic path win32_VideoController get name
pause
goto menu



:spicetifyMenu
cls
echo ======================================
echo 🎵 Spicetify Tools
echo ======================================
echo 1️⃣  Install Spicetify 🛠️
echo 2️⃣  Update Spicetify 🔄
echo 3️⃣  Apply Extension 📂
echo 4️⃣  Back 🔙
set /p spChoice="👉 Choose (1-4): "

if %spChoice%==1 (
    echo ======================================
    echo 🛠️ Installing Spicetify...
    echo ======================================
    call :progressBar
    powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex"
    echo ✅ Windows installation done!
    echo.
    echo 💻 For Mac & Linux, run this command in your terminal:
    echo curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
    pause
    goto spicetifyMenu
)

if %spChoice%==2 (
    echo 🔄 Updating Spicetify...
    call :progressBar
    spicetify upgrade
    spicetify apply
    echo ✅ Spicetify updated and applied!
    pause
    goto spicetifyMenu
)

if %spChoice%==3 (
    set /p extFile="👉 Enter extension file name (in %appdata%\spicetify\Extensions\): "
    echo 📂 Applying extension %extFile% ...
    call :progressBar
    spicetify config extensions %extFile%
    spicetify apply
    echo ✅ Extension applied: %extFile%
    pause
    goto spicetifyMenu
)

if %spChoice%==4 goto menu
goto spicetifyMenu

:: ======================================
:: Progress Bar Function
:: ======================================
:progressBar
set bar=####################
set len=20
for /l %%i in (1,1,20) do (
    set /a percent=%%i*5
    set /a chars=%%i
    set str=!bar:~0,%chars%!
    <nul set /p="Downloading: [!str!                   ] !percent!%%"
    ping -n 1 127.0.0.1 >nul
    <nul set /p="`r"
)
echo.
exit /b
