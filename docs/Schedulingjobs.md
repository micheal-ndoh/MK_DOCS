# **Presentation on Administrative Task Scheduling**

## **Scheduling Jobs and Tasks**

### **General Objectives**
By the end of this session, you will learn:

- How to schedule cron jobs using `cron`, `at`, `batch`, and `systemd`.
- The difference between user crontabs and system crontabs.
- How to edit crontabs and configure the `/etc/crontab` file.
- Time specifications used in crontab job scheduling.
- Cron tab variables.
- How to create system and user crons.
- How to configure access to cron.
- How to use `systemd` to manage crons and alternatives to `at`.

---

## **Introduction**

As a system administrator, scheduling tasks is crucial for automating repetitive activities and ensuring system efficiency.

---

## **Cron Jobs**

Cron is a daemon that runs in the background and checks for scheduled tasks every minute. Anacron is a program used to schedule jobs on systems that may be powered off and can only be edited by root users.

---

## **Differences Between User Cron and System Cron**

- **User Cron**: Stored in `/var/spool/cron/`.
- **System Cron**: Stored in `/etc/crontab` and `/etc/cron.d/`.

---

## **Special Characters in Cron Jobs**

| **Symbol** | **Description**           | **Example**            |
|------------|---------------------------|------------------------|
| `*`        | Any possible value        | `* * * * * command`    |
| `,`        | List of values            | `* 1,2,3 * * * command`|
| `-`        | Range of values           | `1-30 * * * * command` |
| `/`        | Step values (repetition)  | `*/30 * * * * command` |

---

## **Adding a Cron Job**

Edit the crontab file using:
```bash
crontab -e
```
Or edit the system crontab:
```bash
vim /etc/crontab
```

---

## **Special Files for Scheduling Cron Jobs**

| **File**            | **Function**                              |
|----------------------|------------------------------------------|
| `/etc/cron.d/`       | Contains anacron facilities              |
| `/etc/cron.daily/`   | Executes scripts daily at midnight       |
| `/etc/cron.hourly/`  | Executes scripts hourly                  |
| `/etc/cron.monthly/` | Executes scripts monthly at midnight     |
| `/etc/cron.weekly/`  | Executes scripts weekly on Sunday at midnight |

---

## **Special Time Specifications**

| **Specification** | **Function**           |
|--------------------|------------------------|
| `@hourly`          | Executes every hour    |
| `@daily`           | Executes every day     |
| `@weekly`          | Executes every week    |
| `@monthly`         | Executes every month   |
| `@yearly`          | Executes every year    |

---

## **Cron Variables**

| **Variable** | **Description**                              |
|--------------|----------------------------------------------|
| `PATH`       | Specifies the absolute path to the task      |
| `SHELL`      | Indicates the shell used to execute the task |
| `MAILTO`     | Specifies the email address for notifications|
| `HOME`       | Specifies the home directory for the task    |

---

## **Practical Examples**

### **Example 1: Run a Script Every Two Minutes**
```bash
crontab -e
* */2 * * * /home/username/directory/hello.sh
```

### **Example 2: Remove a Scheduled Cron Job**
```bash
crontab -r
```

### **Example 3: List Scheduled Cron Jobs**
```bash
crontab -l
```

### **Example 4: Check Mail for Cron Notifications**
```bash
cat /var/spool/mail/username
```

---

## **Scheduling with `at` Command**

The `at` command is used for one-time job scheduling.

### **Examples**
```bash
at now +5 minutes echo "My first at job" > file.txt
at teatime cat file.txt  # teatime = 16:00 (4:00 PM)
```

### **Commands**

- `atq`: Lists pending `at` jobs.
- `atrm`: Removes a specific `at` job.

---

## **Using `systemd` for Scheduling**

`systemd` provides an alternative to cron with `.timer` services.

### **Example: Creating a Timer**

1. Create a file `file.timer` in `/etc/systemd/system/`:
   ```ini
   [Unit]
   Description=Run the timing task

   [Timer]
   OnCalendar=*-*-* 00:0/2:00
   Persistent=true

   [Install]
   WantedBy=timers.target
   ```

2. Create a corresponding service file `file.service`:
   ```ini
   [Unit]
   Description=Run my command
   OnFailure=mail-systemd-failure@%n.service

   [Service]
   Type=oneshot
   ExecStart=/usr/local/bin/custom-command
   User=dedicated-user
   Group=dedicated-user
   ```

3. Reload and enable the timer:
   ```bash
   systemctl daemon-reload
   systemctl enable file.timer
   systemctl start file.timer
   ```

4. List active timers:
   ```bash
   systemctl list-timers
   ```

---
