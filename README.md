# Quai node & stratum monitoring scripts

This repository contains shell scripts to manage and monitor the **Quai node** and **Stratum** services. These scripts ensure that the processes remain running and automatically restart them if they stop.

## 📌 Features
- Automatically checks if the **Quai node** or **Stratum** process is running.
- Restarts the process if it has stopped.
- Uses `screen` to keep the services running in the background.
- Logs status updates to `syslog` for easy monitoring.

---

## 🚀 Installation

1. **Clone the repository or copy the scripts to your server:**
   ```bash
   git clone https://github.com/seppegadeyne/quai
   cd quai

