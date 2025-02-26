# **Shell Scripting Guide**

This guide covers essential concepts and techniques for shell scripting, including customizing shell variables, loops, conditional statements, functions, and more. It’s designed to help you write efficient and maintainable scripts.

---

## **Customizing and Using Shell Variables**

### **Key Points**

- Set environment variables.
- Write Bash functions for frequently used commands.
- Maintain skeleton directories for new user accounts.
- Set the command search path with the proper directory.

### **Shell Overview**

The shell is a powerful tool in Linux, providing an interface for managing the operating system. It takes user input as commands and outputs results to the terminal.

#### **Shell Types**

- **Login Shells**: Initial shell started when a user logs in (e.g., via terminal or SSH). Uses `~/.profile` or `~/.bashrc`. Indicated by `-`.
- **Non-Login Shells**: Started without a login process (e.g., from another shell or program). Executes `~/.bashrc`.
- **Interactive Shells**: Respond to user commands (e.g., Bash, Zsh).
- **Non-Interactive Shells**: Do not allow user input (e.g., running a command via SSH).

#### **Startup Scripts**

- **/etc/profile**: Sets environment variables for all users.
- **~/.bash_profile**: Configures the user’s environment.
- **~/.bashrc**: Runs for interactive non-login shells.
- **~/.bash_logout**: Executes cleanup tasks on logout.

#### **Executing Files**

Use either of the following commands:

```bash
source <filename>
. <filename>
```

#### **SKEL Directory**

The `/etc/skel` directory contains template files for new user accounts. View its contents with:

```bash
cd /etc/skel
```

---

## **Extended Tests**

Tests evaluate expressions using square brackets:

```bash
if [[ -f "$filename" ]]; then
  echo "File exists."
else
  echo "File does not exist."
fi
```

---

## **Loop Constructs**

### **Types of Loops**

1. **For Loop**  
   Iterates through a list of items:

   ```bash
   for VARNAME in LIST; do
     COMMANDS
   done
   ```

2. **Until Loop**  
   Runs until a condition becomes true:

   ```bash
   until [ "$count" -eq 5 ]; do
     echo "Count: $count"
     count=$((count + 1))
   done
   ```

3. **While Loop**  
   Runs while a condition is true:

   ```bash
   while [ $count -le 5 ]; do
     echo "Count: $count"
     ((count++))
   done
   ```

---

## **Variables in Shell Scripting**

### **Variable Basics**

- **Syntax**: `<variable_name>=<variable_value>` (no spaces around `=`).
- **Display**: Use `$` and `echo`:

  ```bash
  echo $<variable_name>
  ```

### **Variable Types**

- **Global Variables**: Exist only within the shell they are created.
- **Local Variables**: Exist in all new shells. Use `export` to make a local variable global:

  ```bash
  export <variable_name>
  ```

### **Special Variables**

- `$?`: Exit status of the last command.
- `$$`: PID of the current shell.
- `$!`: PID of the last background job.
- `$#`: Number of arguments passed to the script.
- `$@`: All arguments passed to the script.

---

## **Case Statement**

Executes code blocks based on a variable’s value:

```bash
case $fruit in
  apple) echo "You chose an apple!" ;;
  banana) echo "You chose a banana!" ;;
  *) echo "Unknown fruit!" ;;
esac
```

---

## **Script Structure and Extensions**

- **Shebang**: `#!/bin/bash` specifies the interpreter.
- **Permissions**: Use `chmod` to set executable permissions:

  ```bash
  chmod u+x script.sh
  ```

- **Execution**: Run with `./script.sh`.

---

## **Arrays**

Store multiple values in a single variable:

```bash
declare -a size=(1 2 3 4 5)
echo ${size[1]}  # Output: 2
```

---

## **Arithmetic Expressions**

Perform calculations:

```bash
sum=$((val1 + val2))
```

---

## **Conditional Expressions**

### **AND Statement**

```bash
if [[ "$age" -gt 18 && "$age" -lt 30 ]]; then
  echo "Valid age."
fi
```

### **OR Statement**

```bash
if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]; then
  echo "Valid age."
fi
```

---

## **Functions and Aliases**

### **Creating Functions**

```bash
function greet {
  echo "Hello, $1!"
}
greet "John"
```

### **Aliases**

```bash
alias ll='ls -la'
```

---

## **Task List Script**

A simple task manager:

```bash
#!/bin/bash

add_task() {
  echo "$1" >> tasks.txt
  echo "Task added."
}

remove_task() {
  sed -i "/$1/d" tasks.txt
  echo "Task removed."
}

view_tasks() {
  cat tasks.txt
}

while true; do
  echo "1. Add task"
  echo "2. Remove task"
  echo "3. View tasks"
  echo "4. Exit"
  read -p "Enter choice: " choice

  case $choice in
    1) read -p "Enter task: " task; add_task "$task" ;;
    2) read -p "Enter task to remove: " task; remove_task "$task" ;;
    3) view_tasks ;;
    4) exit 0 ;;
    *) echo "Invalid choice." ;;
  esac
done
```

---
