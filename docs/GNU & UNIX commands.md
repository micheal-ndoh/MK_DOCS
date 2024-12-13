# GNU and Unix commands

## Getting System Information
  
-To print your current directory use ***pwd***  
```bash
pwd
```
**touch**: Command to update the timestamps on existing files and also used to create new files  
```bash
touch file
touch file.txt
touch -r file1.txt file2.txt
touch -t 2024122510530
```
**uname**: Displays information about the linux system you are running like the linux kernel version that is currently loaded.
```bash
#to display the name of the O.S.
uname
#to print the machine hardware name
uname -m
#to  print the currently loaded linux kernel version  
uname -c
uname -s
uname --kernel-name
```
**man**:Is an interface to the system's reference manuals.
```bash  
man <command>
```
**apropos**:Helps you search through the man pages and description for instances of keyword.  
```bash
apropos apropos
#searches the man pages for apropos
```
**type**: Gives basic data about a command
```bash
type uname
```
**which**: returns the absolute location of a command
## Finding environment variable  
Environment variables are dynamic values that can be applications used in shells.  
**env or printenv**: displays all environment variables in a command- line interfaces
```
nyengka-prosper@letlovelead:~$ env
SHELL=/bin/bash
SESSION_MANAGER=local/letlovelead:@/tmp/.ICE-unix/2719,unix/letlovelead:/tmp/.ICE-unix/2719
QT_ACCESSIBILITY=1
COLORTERM=truecolor
XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
SSH_AGENT_LAUNCHER=gnome-keyring
XDG_MENU_PREFIX=gnome-
GNOME_DESKTOP_SESSION_ID=this-is-deprecated
GNOME_SHELL_SESSION_MODE=ubuntu
SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
XMODIFIERS=@im=ibus
DESKTOP_SESSION=ubuntu
GTK_MODULES=gail:atk-bridge
PWD=/home/nyengka-prosper
LOGNAME=nyengka-prosper
XDG_SESSION_DESKTOP=ubuntu
XDG_SESSION_TYPE=wayland
SYSTEMD_EXEC_PID=2745
XAUTHORITY=/run/user/1000/.mutter-Xwaylandauth.SY8GX2
HOME=/home/nyengka-prosper
USERNAME=nyengka-prosper
IM_CONFIG_PHASE=1
LANG=en_US.UTF-8
MY_VAR=123
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
XDG_CURRENT_DESKTOP=ubuntu:GNOME
VTE_VERSION=6800
WAYLAND_DISPLAY=wayland-0
GNOME_TERMINAL_SCREEN=/org/gnome/Terminal/screen/28269da0_f9a4_4fd5_a228_b4256c590eae
GNOME_SETUP_DISPLAY=:1
LESSCLOSE=/usr/bin/lesspipe %s %s
XDG_SESSION_CLASS=user
TERM=xterm-256color
LESSOPEN=| /usr/bin/lesspipe %s
USER=nyengka-prosper
GNOME_TERMINAL_SERVICE=:1.138
DISPLAY=:0
SHLVL=1
QT_IM_MODULE=ibus
PT8HOME=/opt/pt
XDG_RUNTIME_DIR=/run/user/1000
XDG_DATA_DIRS=/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
PATH=/home/nyengka-prosper/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
GDMSESSION=ubuntu
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
_=/usr/bin/env
```
Note the PATH entry which contains the directories where your shell will look for other programs without specifying a complete path.  
**echo**: will print to the screen whatever you tell it.
```bash 
echo "How are you"
echo $PATH 
```
## Creating new environment variable  
variable=value
```bash 
var=tab
echo $var
```
**bash** : opens a new shell  
**export** : will make the variable created to be persistent on any child shell that you may subsequently open .
## Deleting environmet variables
**unset** : without the $ will kill the variable  
**set**: this is another command to display all environment variables
## Quoting to escape special characters
* single quotes will preserve the literal value of all characters , while double quotes will preserve all characters except for $ , ` , \ , and in some cases !
for example : 
```
echo '$PATH'  
echo "$PATH" 
```
## Redirection and Pipes
**>** operator for redirection , **>>** operator for appending  
**|** takes the output of one command as the input of the next command  
**diff** checks if two file have thesame content  
```
diff file1 file2
```
There are other commands that handle compressed files ( bzcat for bzip compressed files , xzcat for xz compressed files and zcat for gzip compressed files ) and each one is used to view the content of a compressed file based on the compression algotrithm used
**gzip**: To create a compressed version of a file. extension **.gz**
**zcat**: Used to view the contents of gzipped compressed file.  
## Viewing a file in pager 
**cat**: concatenates a file to the standrad output.
## Getting a portion of a file
**head**: displays the first ten lines of a file.  
**tail**: displays the last ten linea of a file.
## OTHERS 
**nl** to number line  
**wc** word count
``` 
wc -l
wc -w
wc -m
wc -c
```
**sed**: stream editor. 
```
sed 's/cat/dog' file
sed '/dog/d' file 
sed '3d' file
sed -n '/cat/p' file
sed -e 's/cat/dog/g' -e 's/bad/good/g' file
```  
A **checksum** is a value derived from a mathematical computation, based on a cryptographic hash function, against a file. Different types of cryptographic hash functions include **md5sum**,**sha256sum**,**sha512sum**.
``` 
sha256sum file #calculates the SHA256 value of file
```  
**od**: for debugging applications and various files listing out the content of the file in octal format.  
**uniq**: used to list and count matching strings  
**tr**: translate command, can replace and also removes and compress repeating characters.  
**split**: can split larger files into smaller ones depending on criteria set by command's option.
**cut**: 
### Commands related to the manipulation of files  
**cp**
**mv**
**mkdir**
**rmdir**
**File globbing** is a feature provided by Unix/Linux shell to represent multiple filenames by using special characters called **wildcards**  
**find**
**tar**
**dd**
## More on redirectiond
**>** same as **1>**  
**2>** redirects stderr  
**>&2** redirects stdout to stderr  
**2>/dev/null** discard stderr  
**<** is used to redirect the content of a file to the stdin of a process 
**tee**: to read the output  
**jobs** 
