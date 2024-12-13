# SHELL_SCRIPTING
  ## customizing and using the shell variables
  #### key points
   - set environment variables
   - write bash functions for frequently used commands 
   - maintain skeleton directories for new users account
   - set command search path with the proper directory

The shell is the most powerful tool in a linux system and provides an interface for managing the linux operating.
It takes input from the user as commands and gives output on the terminal.

Starting with shells we have **Interractive/Non-interactive shells** and **Login/Non-Login Shells**\
**Log-in shells:** is the initial shell that starts when a user logs in to the system, through the terminal or SSH connection.
This log-in uses **~/.profile**, **~/.bashrc**, etc. This is indicated using **(-)**\
**Non log-in shells:** these are shells that are started without a log-in process, like starting a shell from another shell or a program.\ 
It executes the **~/.bashrc**. This does not have **(-)**. 
The command to check wether you are on a log-in shell or a non log-in shell is
```bash
echo $0
```
**Interactive shells:** these are shells that respond accordingly to commands inputted by the user.\
**Non-interactive shell:** these shells does not allow the user to input commands and returns  no output to the user.
e.g the screen command
```bash
screen
```
##### exmples of log-in shells
- log-in into another user
- log-in remotely using SSH
##### examples of non log-in shells
- vs-code shell
- normal shell
##### examples of interactive shells
- Bash
- Zsh
##### examples of non-interactive shells
- running a command on remote server using SSH
`echo 'echo $-; shopt login_shell'| ssh localhost`

The next thing are start-up scripts;\
**/etc/profile :** this script runs to set-up all environment variables such as PS1.
When log-in into a user the `.profile` and `/etc/profile` runs.\
**~/.bash_profile:** it is used to configure the users environment.\
it also runs both `~/.bash_login`, `~/.profile`.\
**~/.bash_login:** it is used when you want to log-in.\
**~/.profile:** this is a check file. the script in it checks if a shell is running, if so, it's run the `~/.bashrc`.\
**~/.bash_logout:** this runs when you want to log-out. It ensures the clean-up of all operations. 

##### The next thing is how to execute a file\
They are two alternatives;
> source \<filename\>

> . \<filename\>

The last thing under this chapter is `SKEL`\
This directory `/etc/skel` contains template directory which are created when a new user is added.
You can display the content of this directory using 
```bash
cd /etc/skel
```
## This ends this chapter
# Extended Tests
A test command can evaluate expressions using two different sysntaxes usually placed in a square bracket where any command is given implicitly
```sh
if [[ -f "$filename" ]]; then
  echo "File exists."
else
  echo "File does not exist."
fi
```
  ## LOOP CONSTRUCTS
Scripts are often used as a tool to automate repetitive tasks, performing the same set of commands
until a stop criteria is verified. Bash has three loop instructions — for, until and
while — designed for slightly distinct loop constructions.
  # TYPES OF LOOPS
        There are generally 3 loops
 1:  THE FOR LOOP 
   This for works through a given list of items (eg .words,or any other space-separated text segments just to name a few)
   Before each iteration,the *for* instruction assigns the current item to a variable,which can the be used by the enclosed commands
   It is done until a no item is left 
 ```sh
 for VARNAME in LIST
do
COMMANDS
done
```
FOR EXAMPLE
```sh
#!/bin/bash
for NUM in 1 1 2 3 5 8 13
do
echo -n "$NUM is "
if [ $(( $NUM % 2 )) -ne 0 ]
then
echo "odd."
else
echo "even."
fi
done
```
 2: THE UNTIL LOOP
 An until loop in Bash scripting is used to repeatedly execute a block of code until a specified condition becomes true. It operates in the opposite manner of a while loop: the until loop continues running as long as the condition evaluates to false and stops when the condition evaluates to true[1], [2].
 Here's a simple example:

```sh
count=0

until [ "$count" -eq 5 ]; do
  echo "Count is: $count"
  count=$((count + 1))
done

echo "Loop ended because count is: $count"
```

In this example:

The until loop runs as long as count is not equal to 5.

When count reaches 5, the loop stops, and the final value of count is printed.

3: THE WHILE LOOP
+ The while loop in Bash scripting is a fundamental construct that allows you to execute a block of commands repeatedly as long as a specified condition evaluates to true. It is particularly useful when the number of iterations is not known beforehand and depends on the condition being checked[1], [2].
```SH
while [ condition ]; do
    # commands
done
```
# EXAMPLE OF WHILE LOOP
```SH
#!/bin/bash

count=1

while [ $count -le 5 ]; do
    echo "Count is $count"
    ((count++))
done

```


# Variables assigning and refrencing in shell scripting
Variables in simple terms as a name holding a value.
We have two types of variable in shell scripting;\
As an introduction, variables must lie between the following range `[a-z,A-Z,0-9]` including the under-score character `_`\
we also need to note that a variable **should never** start `[0-9]`. 
A variable should never contain special chararter, but can start with an under-score.\
The value can be anything of your choice.

this the syntax for assigning variables
> \<variable_name\>=\<variable_value\>

There should be no space before and after the equal-to sign.\
e.g `name=nkwenti` `_food=garri` `coder1=Marco` etc 

To display a variable, we need to use `$` operator and the `echo` command;
```bash
echo $<variable-name>
```
That command shoul display the variable_value.\
There are two types of variables;
- global variables: these are variables that exist only within the shell they are created.
- local variables: these are variables that exist in all new shells.

We need to note that a local variable can become a global variable using the command `expport`
```bash
export <variable_name>
```
this will make that variable accessible in all shells
to undo this you use the `unset` command
```bash
unset <variable_name>
```
The commands `env` and `printenv` can be used to display all global variables
```bash
env
```
```bash
printenv
```
## This marks the end of this second chapter

## SOME SPECIAL VARIABLES 
* -a "$VAR"
    Evaluate if the path in VAR exists in the filesystem and it is a file.
* -b "$VAR"
    Evaluate if the path in VAR is a special block file.
* -c "$VAR"
  Evaluate if the path in VAR is a special character file.
* -d "$VAR"
  Evaluate if the path in VAR is a directory.
* -e "$VAR"
  Evaluate if the path in VAR exists in the filesystem.
* -f "$VAR"
  Evaluate if the path in VAR exists and it is a regular file.
* -g "$VAR"
  Evaluate if the path in VAR has the SGID permission.
* -h "$VAR"
  Evaluate if the path in VAR is a symbolic link.
  #  SOME NUMERICAL VARIABLES 
*  $NUM1 -lt $NUM2
Evaluate if NUM1 is less than NUM2.
* $NUM1 -gt $NUM2
Evaluate if NUM1 is greater than NUM2.
 * $NUM1 -le $NUM2
Evaluate if NUM1 is less or equal to NUM2.
* $NUM1 -ge $NUM2
Evaluate if NUM1 is greater or equal to NUM2.
* $NUM1 -eq $NUM2
Evaluate if NUM1 is equal to NUM2.
* $NUM1 -ne $NUM2
Evaluate if NUM1 is not equal to NUM2.
   ## TEXT VARIABLES
    It is recommended to use the double quotes around a tested variable because, if the variable
    happens to be empty, it could cause a syntax error for the test command. The test options
    require an operand argument and an unquoted empty variable would cause an error due to a
    missing required argument. There are also tests for arbitrary text variables, described as follows:
* -z "$TXT"
Evaluate if variable TXT is empty (zero size).
* -n "$TXT" or test "$TXT"
Evaluate if variable TXT is not empty.
* "$TXT1" = "$TXT2" or "$TXT1" == "$TXT2"
Evaluate if TXT1 and TXT2 are equal.
* "$TXT1" != "$TXT2"
Evaluate if TXT1 and TXT2 are not equal.
* "$TXT1" < "$TXT2"
Evaluate if TXT1 comes before TXT2, in alphabetical order.
* "$TXT1" > "$TXT2"
Evaluate if TXT1 comes after TXT2, in alphabetical order.

# THE CASE STATEMENT
In shell scripting, a case statement (also known as a switch statement) is a control flow construct that allows you to execute different blocks of code based on the value of an expression.  
```SH
#!/bin/bash

echo "Enter a fruit (apple, banana, orange):"
read fruit

case $fruit in
  apple)
    echo "You chose an apple!"
    ;;
  banana)
    echo "You chose a banana!"
    ;;
  orange)
    echo "You chose an orange!"
    ;;
  *)
    echo "Unknown fruit!"
    ;;
esac

```


In this script:

  *  The user is prompted to enter a fruit.
   * The script checks the input against several defined patterns (apple, banana, and orange).
    * If the input matches one of the patterns, the corresponding message is printed.
   * The wildcard pattern * is used to catch any input that does not match known options, displaying a default message.


# SCRIPT STRUCTURE AND EXTENSIONS

    A Script file is an ordered sequence of commands that must be executed by a corresponding command interpreter.

    There are many interpreters for the Script but the default one is after the '#!' at the first line
    known as shebang like /bin/bash

    All lines with "#" are considered as ignored after the shebang and considered as comments.

    To manipulate files, we must make sure the users groups or others have proper permissions
    We use the command 'chmod ugo -=+ rwx'

    With permissions put in current directory, it can be executed as './scriptname.sh'

    It is important to make the script writable by root user only because groups and others can destroy the script 
    by modifying it.

    The placement of the file are not too rigid. Two commands can be on the same line but executed differently. 
    This is done by simply adding a ';' at end of each command.

    We can check status by using the '$?' command.


# VARIABLES

    Storage locations that holds value eg Solution=422

    Variables can't start with a non-alphabetical variable.

    Bash script also have special variables called parameters.

    Parameters start with non-alphabetical characters like ;

   * $* All arguments passed to the script

   * $@ All arguments passed to the script if used with double quotes 

   * $# Numbers of arguments in the script 

  *  $0 Name of script file

  *  $!  PID of last executed script

   * $$ PID of current shell

  *  $? Status code of last executed command

    There is also what we call ;

  ### Positional parameters  : 
    Positional parameters are variables that refer to specific positions in a list of arguments.

    They take numbers except 0. If number is greater than 9, we use curly brackets {}

    For example ${23}

    Here communication and interaction with the user is very crutial. 

    To display output to the user, we use 'echo'. For example 'echo hello'

    To take input from the user we can use 'read'. For example 'read name' where name is the variable.

    We can take multiple inputs from the user by separatong the variables with space
    For example read name age sex

    To store commands in a variable we use `` or $()

    To know the length of a variable we use #{} eg echo ${#OS}


# ARRAYS

    An array is a variable storing many inputs.
    It is declared as 'declare -a' eg declare -a size
    
    To insert values we can do size=(1 2 3 4 5). This directly puts all the values in each index

    We can still do size[0]=1, size[1]=2. This puts values one by one

    To read an array, just write the name of variable size

    To read a value in an array we write ${size[1]} for example


# ARITHMETIC EXPRESSION

    To perform arithmetic operations we use 

```sh 
    sum=`expr $val1 + $val2` or sum=$(($val1 + $val2))
 ```

    where sum is the name of the variable that take the whole calculation, val1 and val2 are numbers and + is the operator


# CONDITIONAL EXPRESSION

    In bash, not all commands are but only those that respect a particular criteria.
    for example command A && command B here execution continues only if the one at left is correct. (status code is 0)
    If not it will display an error and stop 

    For command A || command B here execution will stop when it found a correct command (status code is not 0)

    There is also the if condition. Compares condition until one is false 

    for example 
   ```sh
    if [ condition ]; then 

        command

    fi

    We can also put else and elif to compare many conditions 

     for example 
    if [ condition ]; then 

        command

        elif [ condtion ]; then 

            command

        else command

    fi
```

# SCRIPT OUTPUT

    Even when the purpose of a script only involves file-oriented operations, it is important to display
    progress related messages in the standard output, so the user should be informed of progress work.
    To display the output, te echo command is used

    With option -e, command echo is able to display special
    characters using escaped sequences
```sh
     
     #!/bin/bash
    OS=$(uname -o)
    echo -e "Operating system:\t$OS"
    Operating system:	GNU/Linux

```

# FOR AN "AND STATEMENT"
```SH
#! /bin/bash

age=50

if [[ "$age" -gt 18 && "$age" -lt 30 ]]
then
 echo "valid age"
 else
 echo "age not valid"
fi
```
# FOR AN " OR STATEMENT"
```SH
#! /bin/bash

age=98

if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
then
 echo "valid age"
 else
 echo "age not valid"
fi
```
 # A TASK LIST
```SH
 #!/bin/bash

# Function to add a task
add_task() {
    echo "$1" >> tasks.txt
    echo "Task added successfully."
}

# Function to remove a task
remove_task() {
    sed -i "/$1/d" tasks.txt
    echo "Task removed successfully."
}

# Function to view tasks
view_tasks() {
    cat tasks.txt
}

# Main program
while true; do
    echo "1. Add task"
    echo "2. Remove task"
    echo "3. View tasks"
    echo "4. Exit"
    read -p "Enter your choice:  " choice

    case $choice in
        1)
            read -p "Enter task:  " task
            add_task "$task"
            ;;
        2)
            read -p "Enter task to remove:  " task
            remove_task "$task"
            ;;
        3)
            view_tasks
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done
```
# Functions and Aliases
### Aliases
An alias ia a subtitute name for another command(s). It is very easy to create an alias.\
to create an aliase we use the following formst;
> alias <alias_name>=command(s)

> unalias <aliase_name>

 ### Creating Functions
 Function can simply be a collection of commands and logic statements.\
 We can have two syntax in creating a function;
Under function we have two ways of defining functions
- using the keyword `function`\
using this keyword you simply add the function_name next to it, then the commands in curly brackets `{}`

> function <function_name> {
>
> command1
> 
> command2
> 
> command#
> 
> }

- using `()`
using this symbol`()`, you don't need the function keyword. You can just write the function name then you include`()` after the name.

> <function_name>() {
>
> command1
>
> command2
>
> command#
>
> }
### bash built-in special variables
- `$?`: used to check if the last command was successfully executed.
- `$$`:it provides the **PID** of the current shell.\
- `$!`: it povide the PID of the last running background job.\
- `$#`: it is used to access the number of arguments passed to a function.\
- `$@,$*`: they hold all the arguments passed in function.\
- `$_`: it holds the last parameter.

#### Variables in functions
This is simply writing a shell script and including a variable in it.
```bash
test() {
name="Mr MArco"
echo "The god of code is $name "
}
```

#### positional paramaters in functions
This is just about passing parameters in your function directly.
```bash
function test {
echo "$1, you look good"
}

test Mr Marco
```
we could also have;
```bash
function test {
echo "$1, you look good"
}
```
with this one, you will include the parameter when executing the function.\
Making this script to a shell script, we need to introduce the `She
bang`**#!/bin/bash**\
This function just like an interpreter. This is used if you want the bash interpreter to run your script, instead of the default shell.
#### Creating a function with an alias
It is possible assigning a functiion to an alias. Such that anytime you call this alias, the function runs.
```bash
#!/bin/bash
    echo "Enter the name of the file: "
read file
if [[ $file == *.sh ]]; then
    touch "$file"
    echo '#!/bin/bash' > "$file"
nano "$file"
else
    echo "please try with .sh extension"
fi
```
This script creates a file with a `.sh` extension and includes the `shebang` for you automatically.
you can visit this link to see more about the script [Nkwenti-repository](https://github.com/Nkwenti-Severian-Ndongtsop/automative-script-to-create-a-file)

#### Function in a function
we can include a function in a function
```bash
#!/bin/bash
display() {
echo "Welcome, Mr Francis."
}
echo "Are you the founder of Adorsys[y/n]"
read respond
if [[ "$respond" == "y" ]]; then
display
else
echo Thank you!
fi
```
# This is the end of this chapter.

