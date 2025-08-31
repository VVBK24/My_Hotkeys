# 🎛️ Ultimate CMD Control Tool

A single-file Windows **batch script** (`ultimate-tool.bat`) that brings a Swiss Army Knife of command-line utilities to your Desktop — server checks, weather, network tools, system info, Spicetify management and a fun fake progress bar.

---

## 📑 Table of Contents
1. [Introduction](#introduction)  
2. [Features](#features)  
3. [Requirements](#requirements)  
4. [Installation](#installation)  
5. [Usage](#usage)  
6. [Commands & Behaviour](#commands--behaviour)  
7. [Configuration](#configuration)  
8. [Examples](#examples)  
9. [Troubleshooting](#troubleshooting)  
10. [Limitations & Notes](#limitations--notes)  
11. [Contributing / Contributors](#contributing--contributors)  
12. [License](#license)  
13. [Future Ideas](#future-ideas)  
14. [Acknowledgements & Resources](#acknowledgements--resources)

---

## 📝 Introduction
`ultimate-tool.bat` is a user-friendly batch script for Windows 10/11 that collects a set of useful daily tools into a single CLI menu. It is designed for quick checks, lightweight diagnostics, and automating some common tasks — plus a little fun with a fake progress bar.

---

## ✨ Features
- ✅ **Server status checker** (default: `india.gov.in`, `google.com`, `youtube.com`) — accepts custom domains.  
- ☁️ **Weather info** using `wttr.in` (HTTP-based weather).  
- 📡 **Network tools**
  - Flush DNS
  - Show IP configuration (`ipconfig`)
  - Show network stats (`netstat -e`)
  - Simulated speed test (ping-based)
- 💻 **System information**
  - OS name & version
  - CPU model
  - RAM capacity
  - GPU(s) installed
- 🎵 **Spicetify tools**
  - Install Spicetify (Windows auto-install command included)
  - Update Spicetify and re-apply user config/extensions
  - Apply extensions from `%appdata%\spicetify\Extensions\`
- ⚡ **Fake/Simulated progress bar** for install/update animations

---

## 🖥️ Requirements
- Windows 10 or Windows 11  
- Internet connection (for weather, Spicetify installs, server checks)  
- PowerShell (pre-installed on Windows)  
- Optional: Admin privileges for certain network/system operations

---

## ⚙️ Installation
1. Copy the script contents into a file named `ultimate-tool.bat`.  
2. Save it on your PC (Desktop, `C:\Tools`, etc.).  
3. Double-click the file to run, or run from an elevated Command Prompt / PowerShell:
   ```powershell
   cd "C:\path\to\file"
   ultimate-tool.bat

   
---

## 🚀 Usage
When you start the script you'll be presented with a menu like:
```
    1️⃣  Server Status Check 🌐
    2️⃣  Weather Info ☁️
    3️⃣  Network Tools 📡
    4️⃣  System Info 💻
    5️⃣  Spicetify Tools 🎵
    6️⃣  Exit ❌
    Enter your choice:
```

-----

## 🛠️ Commands & Behaviour
 # 🌐 Server Checker
    - Default servers: india.gov.in, google.com, youtube.com.
    - Custom: enter any domain (e.g., example.com).
    - Uses ping/nslookup for reachability check.
    - When you start the script you'll be presented with a menu like:

 # ☁️ Weather Info
    Enter your city: Bengaluru
    Bengaluru: 🌦️ +26°C

# 🛠️ Ultimate Tool ReadMe  

## 📡 Network Tools  
- Flush DNS: ipconfig /flushdns  
- Show IP config: ipconfig /all  
- Show network stats: netstat -e  
- Simulated speed test: ping-based latency measurement  

---

## 💻 System Info  
- OS version: ver / systeminfo  
- CPU: wmic cpu get name  
- RAM: wmic ComputerSystem get TotalPhysicalMemory  
- GPU: wmic path win32_VideoController get name  

---

## 🎵 Spicetify Tools  
- **Windows install:**  
  ````
  iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex  

- **Mac/Linux install:**  
  ````
  curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh  

- **Update & apply extensions:**  
  %appdata%\spicetify\Extensions\  

---

## ⚡ Progress Bar  
Simulates installation/download progress with visual bar animation.  

---

## 🔧 Configuration  
- Default servers: edit script to change defaults.  
- Weather provider: currently wttr.in (change URL if needed).  
- Spicetify path: %appdata%\spicetify\  
- Permissions: some commands may need admin rights.  

---

## 🎮 Examples  
- **Check server status:**  
  Run script → Select option 1 → Enter "example.com"  

- **Weather in Bengaluru:**  
  Select option 2 → Enter "Bengaluru"  
  Output: Bengaluru: 🌦️ +26°C  

- **Install Spicetify (Windows):**  
  Select option 5 → Choose Install  
  Runs: iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex  

---

## 🐞 Troubleshooting  
- Script won’t run → ensure filename is **ultimate-tool.bat**. Run from Command Prompt:  
  cmd.exe /k ultimate-tool.bat  

- PowerShell commands fail → try:  
  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass  

- Weather not working → check connection and access https://wttr.in in browser.  

- Spicetify install fails → check GitHub access; ensure git/npm installed if required.  

- Permission issues → run script as **Administrator**.  



