# 🚀 Winget Pro Update Manager

A lightweight and powerful **Batch** automation tool designed to streamline software updates on Windows. It enhances the official **Microsoft Winget** package manager with a clean, color-coded terminal interface.

---

## ✨ Key Features

* **Auto-Detection:** Instantly scans your system for available software updates upon launch.
* **Pro Interface:** Uses ANSI escape sequences for a modern, colored terminal experience.
* **Bulk Update:** One-click option to update all installed applications (`--all --include-unknown`).
* **Selective Update:** Update specific programs by simply entering their Application ID.
* **Privilege Check:** Automatically verifies if the script is running with Administrative rights to prevent installation failures.
* **UTF-8 Support:** Full support for special characters and clean formatting.

---

## 🛠️ Prerequisites

1.  **OS:** Windows 10 (version 1709 or later) or Windows 11.
2.  **Winget:** Ensure the **App Installer** is installed (standard on modern Windows). You can verify it by typing `winget --version` in your terminal.
3.  **Permissions:** This script **must be run as Administrator** to install software updates successfully.

---

## 🚀 Usage (Fileless Mode)

1. Open a CMD as **Administrator**
2. Execute the following one liner command:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "$path = [System.IO.Path]::GetTempFileName() + '.bat'; (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/n3gox/Updat3r/refs/heads/main/update.bat', $path); Start-Process cmd -Wait -ArgumentList '/c', $path; Remove-Item $path"
```

Then the tool will be loaded automatically:

<img width="500" height="316" alt="image" src="https://github.com/user-attachments/assets/90730f3d-c1c8-495e-b23a-059ebc9f2d96" />

