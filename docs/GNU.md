# GNU-Presentation
# **Create, monitor, and kill processes (&, bg, fg, jobs, kill, nohup, ps, top, free, uptime, killall, pgrep, pkill, watch, screen, tmux)

 ### Managing processes 
 **foreground and background jobs**

One of the great points of Linux even from its beginning days is the ability to run different programs and jobs at the same time. This is done by sending programs to the background.

Normally if you run a program on the terminal, it blocks your terminal while it's running but sending a command to the background will prevent this:for example; let's run the command **xeyes** and **sleep 60**

Even when a program is running normally in the foreground, you can do two things: - break it using Ctrl+c - suspend or pause it using Ctrl+z. A stopped job can be brought to the foreground using fg command (or the background using bg). You can also list all the jobs by the jobs.

**jobs -l** also shows the process ID of jobs.

 **nohup**

The nohup command lets you run your commands even after you close the terminal or logout. By default it writes its output to *nohup.out:* 

 **kill**

Despite its frightening name, the kill command sends unix signals to processes. Pressing Ctrl+c and Ctrl+z is also sending signals. By default, the kill command sends the signal 15 (which is **TERM** and tells the process to terminate itself)

It is also possible to use PIDs instead of job numbers and kill other signals. The general format is kill SIGNAL_ID_OR_NAME process_id:

**signal number signal name meaning**
- 1 HUP Informing the process that its controlling terminal (like an ssh connection) is terminated
- 15 TERM normal termination request
- 9 KILL forcefully kills the proccess

So you can do a kill -9 <PID> to force the process to close. Remember the nohup command ? :) It means " do not respond to the hup signal "

 **killall**
 
This command Will send the given signal (or by default 15) to all proesses with the given name:

 **pkill**

Will send the given signal (or 15) to all the processes with a specific pattern in their name:

 **ps**
 
The ps command shows running processes on your computer. Each process has a process ID shown as PID and a Parent Process ID shown as PPID.

 **pgrep**

Since we know that the **ps -ef** shows processes from all users. We can grep on that and see who is running a process and what is its process ID:

but there is also a more direct way to check the PID of all processes:
Copy
$ pgrep <process>

 **top**
 
This is the most common tool to do simple monitoring of the system. It will update the status and will give you a good glance at the status:

 **key during top functionality* *
- h help
- q quit
- M sort based on memory usage
- c show full commands
- k kill after asking pid and signal

 **free** 
 
The free command will show you info about the system memory. The default is kilobytes but you can change it with -m for megabytes, -g for gigabytes or even -b for bytes. You can also use the -h for human readable. for example free -m

 **A general hint:** If your system is using Swap, you have memory issues.

 **uptime**
 
The uptime command shows the time, systems uptime (how long the system has been running), how many users are logged in, and the load average of 1, 5 & 15 minutes. Some of the experienced Linux admins do not know what the load
average means. The load average shows how many processes are in the to be run queue. If this number is higher than the number of your CPU cores, you are in a bad situation. If it's close to the number of your cores constantly, it's kind of dangerous, and if it's less than 1/10th of your core numbers, your system is kind of idle. Do you remember how to check the number of your cores? Its in **/proc/cpuinfo or nproc**.

 **watch**

Sometimes you have a command which shows you an output but you want to keep running it and observing the output. In these cases, the **watch** is your friend. It lets you run and check the output of a command in specific time intervals (default is 2 seconds). fir example **watch free -h**

If you have a pipe in your command, you have to quote the watched command in double-quote " or single-quote ':
for example **watch "ls -ltrh | wc -l"**

These are some of the switches:

- n To specify the interval in seconds
- b Beep if the command has a non-zero exit
- d Shows the difference between runs

 **Terminal Multiplexers**

**screen**

If you are used to GUI based system, it's easy to run different terminals side to side and use them to run different programs. But if you are on a server, you need other tools to multiplex your terminal. One such command is screen.
Run it with screen and press enter to exit the welcome window into a prompt. You can use it as a normal terminal and detach from it (and let it run in the background) using the Ctrl + A and then D keys. Check the list of your screens with screen -ls and re-attach to any of them with screen -r
screen-id.

Below you can see a few common switches, they all should be issued after the Ctrl + A combination.

**Key Usage**
- \ Kill all processes windows and terminate the screen
- | Split current window into two vertical focuses. Shift+S Split current window into two horizontal focuses
- C Create a window in the current focus. Tab Go to the next focus
- D Detach from window
- K Kill current window
- N Move to Next window
- P Move to the Previous window

A great point about screen (and tmux) is the fact it remains running even after you logout of the system and its possible to relogin and re-attach to the same screen (or tmux)

**tmux**

It is not installed by default in most distributions and you have to install it first. The default command prefix is Ctrl+B and after running the tmux new you can issue these:

**Key Usage**

- % Split current window vertically
- " Split current window horizontally
- D Detach from the current window
- & Kill current window
- You can list the tmux sessions using tmux ls and re-attach to one using tmux att to connect to the last one or tmux att -t session_name to attach to a specific one.

NB: I highly recommend being fluent in tmux. It's super useful even when you are working locally on your machine



## change process execution priorities (nice, renice, ps and top)

**Objectives** 
- Know the default priority of a job that is created.
- Run a program with higher or lower priority than the default.
- Change the priority of a running process.
 
On a Linux machine, you might have 100s of processes running at the same time and competing for more CPU & RAM. The good news is that you can give some of the processes higher or lower priority (or nice-ness) in this competition. Let's have a look at a sample **top** output..

The **NI** column shows how nice this process is. The nicer the process, the less CPU it asks. The nice values can be from -20 to 19 . To interpret this value, look at it like this: a process with nice = -20 is **ANGRY** and gets more priority for CPU and RAM while a process with nice = 19 is **SUPER NICE** and lets other processes use the resources before her). The default value for **nice** is normally set to 0; this can be checked with **nice**  command. You can also check the nice-ness using the ps command: **ps -l** 

 **Setting nice-ness** 
 
If you need to change the niceness level of a program you can run it with nice command and -n switch (for nice):  e.g **nice -n 19 echo "I am running!"** and the output will be I am running! , **nice -n -20 echo "I am running!"** and you will see **nice: cannot set niceness: Permission denied** together with **I am running!**. Another example is, **sudo nice -n -20 echo "I am running!"** and you now see the change nice value together with **I am running!**. As you can see in the above example, only the root can issue high-priority niceness (below 0). However, if you run a command with nice without -n, the default will be -n 10.

The **renice** command can be used to change the niceness of your running processes (or others if you are root): example: **sudo renice -n  <PID>**


# *Search text files using regular expressions* (grep, egrep, fgrep, sed, regex)

 **Objectives**

- Create simple regular expressions containing several notational elements.
- Understand the differences between basic and extended regular expressions.
- Understand the concepts of special characters, character classes, quantifiers, and anchors.
- Use regular expression tools to perform searches through a filesystem or file content.
- Use regular expressions to delete, change and substitute text.

 **Regex**
Regular expression, Regex, is a pattern to describe what you want to match from a text. For example a and ad both matches safi. f. is a deeper example because . means anything so d. will match the last two characters of safi. In this section, we will cover the grep (generalised regular expression processor) command. It has different regex dialect; in short Basic regex and Extended regex.

**Regex basics**

Simple match You can simply write down whatever you want to match and regex will search for that.
Regex Will match
- a after, mina, banana, jadi
- na narator, mina, nananana batman, sonar

**Repeating**

- The \* means repeating the previous character 0 or more times.
- The + means repeating the previous character 1 or more times.
- the ? means zero or one repeats.
- {n,m} means the item needs to match at least n times, but not more than m times.
- Alternation (|) If you say a|b it will match a or b.

**Character Classes**

The dot (.) means any character. So .. will match anything with at least two characters in it. You can also create your classes with [abc] which will match a or b or c and [a-z] which match a to z.You can also refer to digits with \d

Regex is case-sensitive.

There are shorthands for commonly used classes. Named classes to start with [: and end with :]. and their range Meaning
- [:alnum:] Alphanumeric characters
- [:blank:] Space and tab characters
- [:digit:] The digits 0 through 9 (equivalent to 0-9)
- [:upper:] and [:lower:] Upper and lower case letters, respectively.

A common used regex is .* which matches any character (zero or any length).

**Matching at specific locations**
- The caret ^ means beginning of the string.
- The dollar $ means the end of the string.

**Samples**

- ^a.* Matches anything that starts with a.
- ^a.*b$ Matches anything that starts with a and ends with b.
- ^a.*\d+.*b$ Matches anything that starting with a, have some digits in the middle and ends with b.
- ^(l|b)oo Matches anything that starts with l or b and then have oo
- [f-h]|[A-K]$ The last character should be f to h (small) or A to K (capital)

 **grep**

The grep command can search inside the files.

These are the most common switches and their meaning
- c just show the count
- v reverse the search
- n show line numbers
- l show only file names
-i case insensitive
-r read all files under each directory, recursively

**Extended grep**

Regex is cool and grep is awesome so many people have tried adding to them or inventing their variants. One is GNU Extended grep. This dialect of regex, does not need much escaping and you can use it via -E switch or using egrep instead of the normal grep. For example, | in an extended
regex means "or". So you can do a egrep "a|b" words to match anything with an a or a b.

**Fixed grep**

If you need to search for exact strings (and not interpret it as a regex), use grep -F or fgrep so the fgrep this$ won't go for the end of the line and will find this$that instead.

**sed**

**sed** understands regex! You can use -r switch to tell **sed** that we are using regexes. For instance: sed -r "s/(Z|R|J)/starts with ZRJ/" mynewfile.txt

Common switches and their meaning include:
- r use advanced regex
- n suppress output, you can use p at the end of your regex ( /something/p ) to print the output. For example: sed -rn "s/text/TEXT/p" mynewfile.txt

## Basic file editing (v, /, ?, h,j,k,l, i, o, a, d, p, y, dd, yy, ZZ, :w!, :q!)

**Objectives** 
- Navigate a document using vi.
- Understand and use vi modes.
- Insert, edit, delete, copy and find text in vi.
- Awareness of Emacs, nano and vim.
- Configure the standard editor

 ### Introduction 
As any other tool, we have a wide range of selection when it comes to text editors. One of the most common and super powerful choices is the vi editor. It is pre-installed on all major Linux distributions and you can be sure that knowing it, will let you edit your files on all environment. Here is an Improved version of vi which is called VIMproved or vim. Sometimes thats what you will find on your system and sometimes the vi
command is aliased or linked to vim.

 **vi modes** 
 
vi works in two modes:
1. Command mode is where you go around the file, search, delete text, copy paste, replace, ... and give other commands to the vi. Some
commands start with a : and some are only a keypress.
2. Insert mode is where what you type, goes into the file at the cursors position.

To switch to the Command mode, press the ESC key. To go back to the Insert mode, you can use several commands but one common
one is pressing the i key.

 **Moving the cursor** 

To move around a text file, use these keys in Command mode. The key functions are:
- h One character to the left (only current line)
- j One line down
- k One line up
- l One character to the right (only current line)
- w Next word on the current line
- e Next end of word on the current line
- b Previous beginning of the word on the current line
- Ctrl-f Scroll forward one page
- Ctrl-b Scroll backward one page
Typing a number before most commands will repeat the command that many times (i.e. 6h will go 6 characters to the left)

**Jumping around**

The key functions are:
- G With no number, will jump to the end & 10G will jump to line 10
- H 5H will go to the 5th line from the top of the screen
- L 3L will move the cursor to the 3rd line to the last line of the screen

 **Editing text** 

These commands during the command mode will help you enter, edit, replace and text:
key functions
- i Enter the insert mode
- a Enter the insert mode after the current position of the cursor
- r replace only one character
- o open a new line below the cursor and go to the insert mode
- O open a new line above the cursor and go to the insert mode
- c clear to a location and go to the insert mode the replace till there and then normal insert (cw will overwrite the current word)
- d delete. you can mix with w (dw) to delete a word. Same as cw but dw does not go to the insert mode
- dd Delete the current line
- x Delete character at the position of the cursor
- p Paste the last deleted text after the cursor
- P Paste the last deleted text before the cursor
- xp swaps the character at the cursor position with the one on its right
- **dw** delete one word
- **:x** ensures the file is saved and exited
- **yy** copy a line
- **A** key ensures that the cursor jumps to the end of the current line
- **G** key jumps to the last line of in the first position
- **gg** keys jumps back to the top left of the first line
- **u** undo the last action performed
- **WQ** is used to close and do not save

**Searching**

The key functions are:
- / Search forward (/happiness will find the next happiness)
- ? Search backward
- n repeat previous search.
  
**Exiting**

It is always funny when you see someone entering to the vi and not knowing how to exit! Learn these and prevent the laughter, the key functions are:
- **:q!** Quit editing without saving = runaway after any mistake
- **:w** mynewtextfile.txt Write to a new name if you wish
- **ZZ** Exit and save the file if modified
- **:e!** Reload the file from disk
- **:!** Run a shell command

Entering colon (:) during command mode will move the cursor to the bottom of the screen and vi will wait for your commands. Press ESC to return back to the normal command mode.The exclamation mark in most commands will say "I know what I'm doing" and will write on read-only files if you have access and will exit without asking
it is possible to combine commands. For example you can combine :w and :q and just say :wq (write and exit).
**help** You can always ask for help with **:help** or **:help subject**. This way vi will open a help text which you can use **/** search just like any other text. Close it with **:q** command.

**Other editors**

You can also use other editors if you want. One easy to use and common option is nano and some other choices are micro, emacs (full featured) and
neovim (an update to vim).
 
**Default editor** 

The default editor in bash is set using the EDITOR environment variable. You can change it with: **export EDITOR='vim'** by adding the above line to the .bashrc file.

**NB:** It should be worth noting that search works only in norma l mode and not insert mode  


