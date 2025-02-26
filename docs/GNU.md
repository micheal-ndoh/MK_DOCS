# **GNU Presentation**

## **Managing Processes in Linux**  
### **Foreground and Background Jobs**

Linux allows the management of multiple processes concurrently, which is one of its key advantages. You can run different programs and jobs simultaneously, often by sending them to the background.

- **Running Jobs in the Background**:  
Normally, when you run a program in the terminal, it blocks the terminal until the process completes. To run a command in the background, you can append `&` at the end of the command. For example:
  ```bash
  xeyes & sleep 60 &
  ```
  This allows you to continue using the terminal while these programs run in the background.

- **Suspending and Resuming Jobs**:  
If a job is running in the foreground, you can:
  - **Pause it** with `Ctrl + Z`
  - **Bring it to the foreground** using `fg`
  - **Send it to the background** using `bg`
  
  You can list all running jobs with the `jobs` command, and view the Process ID (PID) with `jobs -l`.

### **Useful Commands for Process Management**

- **nohup**:  
  The `nohup` command allows a process to continue running even after the terminal or session is closed. By default, output is written to `nohup.out`.
  ```bash
  nohup command &
  ```

- **kill**:  
  The `kill` command sends signals to processes. While `Ctrl + C` and `Ctrl + Z` also send signals, `kill` allows more control:
  - **SIGTERM (15)**: Graceful termination.
  - **SIGKILL (9)**: Forceful termination.
  
  Syntax:  
  ```bash
  kill -9 <PID>  # Force kill a process
  ```

- **killall**:  
  The `killall` command sends signals to all processes by name.  
  Example:
  ```bash
  killall -9 firefox
  ```

- **pkill**:  
  Similar to `killall`, but with a more flexible pattern matching approach.
  ```bash
  pkill -9 <pattern>
  ```

- **ps**:  
  The `ps` command lists running processes.  
  Example:
  ```bash
  ps -ef  # List all processes
  ```

- **pgrep**:  
  Find processes by name and return their PID:
  ```bash
  pgrep <process-name>
  ```

- **top**:  
  `top` is the go-to tool for live system monitoring. It provides real-time information about system resource usage.

  Key Top Commands:
  - `h` for help
  - `q` to quit
  - `M` to sort by memory usage
  - `k` to kill a process

- **free**:  
  Displays system memory usage, with options for different units:
  ```bash
  free -h  # Human-readable format
  ```

- **uptime**:  
  Shows how long the system has been running, load averages, and logged-in users.

- **watch**:  
  Repeatedly runs a command at specified intervals (default: 2 seconds). Example:
  ```bash
  watch free -h
  ```

---

## **Terminal Multiplexers**

### **screen**  
The `screen` command allows you to multiplex multiple terminal sessions inside a single terminal window. You can detach and reattach to sessions. Key commands:
- `Ctrl + A + D`: Detach from the current session.
- `screen -r`: Reattach to a session.

Other Useful Keybindings:
- `|`: Split the screen vertically.
- `C`: Create a new window.
- `N`: Move to the next window.
- `K`: Kill the current window.

### **tmux**  
`tmux` is a more advanced terminal multiplexer, often preferred for its features. After installing, you can use:
- `Ctrl + B + %`: Split the window vertically.
- `Ctrl + B + "`: Split the window horizontally.
- `Ctrl + B + D`: Detach from the current session.

To list and reattach to a session:
```bash
tmux ls  # List sessions
tmux attach-session -t <session_name>  # Reattach to a session
```

---

## **Change Process Execution Priorities**  
### **Nice and Renice**

- **Nice Values**:  
  The `nice` value determines the priority of a process. The range is from -20 (highest priority) to 19 (lowest priority).
  
- **Setting Nice Values**:  
  To run a program with a custom priority, use:
  ```bash
  nice -n <nice_value> <command>
  ```

- **Renicing Running Processes**:  
  To change the priority of a running process:
  ```bash
  sudo renice -n <nice_value> <PID>
  ```

Use the `top` command to monitor process priorities. In the `top` output, the **NI** column shows the "nice" value.

---

## **Search Text Files Using Regular Expressions**  
### **grep, egrep, fgrep, sed, and Regex**

### **Regular Expressions (Regex) Basics**
Regular expressions are patterns used to match text. For example:
- `a` matches the character 'a'.
- `.*` matches any sequence of characters.

### **Regex Metacharacters**  
- `*`: Matches 0 or more of the preceding character.
- `+`: Matches 1 or more of the preceding character.
- `?`: Matches 0 or 1 of the preceding character.
- `{n,m}`: Matches between n and m occurrences.
- `|`: Alternation (OR).
- `.`: Any single character.

### **Character Classes**  
- `\d`: Any digit (0-9).
- `\w`: Any word character (alphanumeric + underscore).
- `[a-z]`: Any lowercase letter.
  
### **grep**  
`grep` is used to search for patterns in files. Key options:
- `-i`: Case-insensitive search.
- `-v`: Invert match.
- `-n`: Show line numbers.
- `-r`: Recursive search.

### **Extended grep**  
Use `egrep` or `grep -E` for extended regex features:
```bash
egrep 'a|b' filename  # Matches lines containing 'a' or 'b'
```

### **Fixed grep**  
`fgrep` or `grep -F` is used for fixed string matching (no regex interpretation).

### **sed**  
`sed` is a stream editor for manipulating text.  
For example:
```bash
sed -r "s/(Z|R|J)/starts with ZRJ/" myfile.txt
```

---

## **Basic File Editing in vi/vim**  
### **vi Modes**  
`vi` operates in two modes:
- **Command Mode**: For navigation and issuing commands.
- **Insert Mode**: For editing text.

### **Navigating in vi**  
In command mode, use:
- `h`: Move left.
- `j`: Move down.
- `k`: Move up.
- `l`: Move right.

### **Editing Text**  
- `i`: Enter insert mode at the cursor position.
- `a`: Enter insert mode after the cursor.
- `x`: Delete a character.
- `dd`: Delete a line.
- `yy`: Copy a line.
- `p`: Paste text.

### **Search and Replace**  
- `/pattern`: Search forward for "pattern".
- `?pattern`: Search backward.
- `:s/old/new/g`: Replace "old" with "new" in the current line.

### **Exiting vi**  
- `:wq`: Save and exit.
- `:q!`: Exit without saving.

---

### **Alternative Editors**
- **nano**: A simple terminal-based text editor.
- **emacs**: A powerful and extensible text editor.
- **neovim**: An improved version of `vim`.

To set your default editor:
```bash
export EDITOR='vim'  # Set vim as the default editor
```

---

### Additional Resources:
- [Vim Documentation](https://www.vim.org/docs.php)
- [tmux Tutorial](https://tmuxcheatsheet.com/)
- [Regular Expressions Cheat Sheet](https://www.regular-expressions.info/)

