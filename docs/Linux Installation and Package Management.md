# LINUX INSTALLATION AND PACKAGE MANAGEMENT
## I - DESIGN HARD DISK LAYOUT
A disk is a physical storage device.
A partition is a logical subdivision of a physical disk.
A disk must be partition before it can be used and information about these partitions are stored in a partition table.
Use this command to view the partition table;
```shell
fdisk -l
```
In each partition there is a filesystem which describes the way information are stored on the disk.
Use this command to view the different filesystems;
```shell
df -lh
```
### LVM
Logical Volume Manager(LVM) is a tool that permits us to allocate space from multiple different disks to the same partion and easily resize the partition when needed.
With LVM, each disk is seen as a Physical Volume(PV) which are then grouped into a Volume Group(VG) and repartitioned into Logical Volumes(LVs) which are now formatted with the desired filesytem.
To build a Linux file system use the command;
```shell
mkfs.<fstype> <DEVICE>
```
### Mount Points
Mounting makes a device available for use by the system.
To mount a filesystem use the command;
```shell
mount -t <FILESYSTEMTYPE> <DEVICE> <DIRECTORY>
```
#### Keeping things separated
When partitioning a disk , some directories should be kept on separate partitions for safety, security and performance reasons. Some of these are;
- <b>/boot</b>
It contains files used by the bootloader to contain the OS. Usually on the first partition it has a maximum size of 528MB.
- <b>/boot/efi</b>
This is the EFI system partition and it stores bootloader and kernel images of the OS installed.
- <b>/home</b>
It stores personal user files and preferences.
- <b>/var</b>
It stores variable data. This includes system logs(/var/log), temporary files(var/tmp), and cache app data(/var/cache).
- <b>Swap partition</b>
It acts like an extended memory. It allocates some space on the disk to be used as RAM. It is mounted using the command;
```shell
mkswap
```
## II - INSTALL A BOOT MANAGER
When the machine is on, the BIOS starts and the system does a <b>POST</b> to see if eberything is okay and then hands the boot process to the first sector of the MBR(Master Boot Record) or the GPT(GUID Partition Table) if the system uses UEFI instead.

### Chainloading
This is a process were the boot loader loads another boot loader, this is usually done when loading unsupported OSes like Windows. The default bootloader is loaded first, and when the corresponding option is selected the bootloader for the desired system is loaded.

### GRUB(GRand Unified Bootloader)
GRUB LEGACY(GRUBv1) is installed in /boot/grub/. Its main configuration is in the /boot/grub/menu.lst but some distributions link it to /boot/grub/grub.conf. 
A sample grub.conf/menu.lst file consists of 2 sections. The first contains global configurations and the second contains different kernel, initram or chainloader options.
The command to install GRUB is;
```shell
grub install /dev/sda
```
### GRUB 2
This is the most common bootloader today. On the BIOS it is installed on the /boot/grub/ or /boot/grub2/ and under UEFI it goes in /boot/efi/EFI/distro_name/ (e.g /boot/efi/EFI/ubuntu/).
The GRUB2's configuration file is called grub.cfg.

Some options of the grub.cfg file are;

<table>
<tr><th>Options</th><th>Description</th></tr>
<tr><td>menuentry</td><td>Defines a new menu entry</td></tr>
<tr><td>set root</td><td>Defines the root where /boot is located</td></tr>
<tr><td>linux</td><td>Defines the location of Linux kernel on BIOS systems</td></tr>
<tr><td>linuxefi</td><td>Defines the Linux kernel on UEFI systems</td></tr>
<tr><td>initrd</td><td>Defines the initramfs image for BIOS systems</td></tr>
<tr><td>initrdefi</td><td>Defines the initramfs image for UEFI systems</td></tr>
</table>

- To install GRUB2
```shell
grub-install /dev/sda
```
- After changing the configuration files, you issue;
```shell
grub2-mkconfig
```
OR
```shell
grub-mkconfig
```
It will read configuration files from /etc/grub.d/ and /etc/default/grub/ and creates the grub.cfg file based on them.
The actual command is;
```shell
grub2-mkconfig > /boot/grub2/grub.cfg
```
### III - SHARED LIBRARIES
  Shared libraries are compiled collections of executable codes allowing multiple programs to share the same functionality without duplicating code.
  
#### Benefits of Shared libraries
1. Code reuse: Multiple programs can use the same library, reducing code duplication and space.
2. Easy updates: Updating a shared library propagates changes to all programs using it.
3. Memory efficiency: Only one copy of the library is loaded into memory reducing memory usage.

To build a executable file from a program's source. First, the compiler turns the source code into machine code that is stored in so(shared object) called <b>object files</b>.
Secondly, the linker combines the object files and links them to libraries in order to generate the final excutable file.
Linking: It's a process of connecting object files and libraries to create an executable file, it can be either statically or dynamically.
linker command 
       
### STATIC LIBRARIES
They are linked at compile-time. Meaning a copy of the library code is embedded into the program and becomes part of it. And thus, the program has no dependencies on the library at run time because the program already contains the libraries code. Having no dependencies
can be seen as an advantage since you do not have to worry about making sure the used
libraries are always available. On the downside, statically linked programs are heavier.
     
### SHARED or DYNAMIC LIBRARIES
They are linked aduring runtime
In case of DYNAMIC LIBRARIES the linker simply takes care that the program references libraries correctly. The linker does not copy any library code into the program file.
At run time, though, the shared library must be available to satisfy the program’s dependencies.
Shared object file naming conventions
        • Library name (normally prefixed by lib)
        • so (which stands for “shared object”)
        • Version number of the library
      
For example: libdfalt.so.0 for shared libraries 
      
      
Shared libraries are located on a linux system on the root directory with the following formats;
      
• /lib holds essential standard libraries and libraries required for your  system to run. If a program in /bin or /sbin needs a library that library is likely in /lib.
• /lib32 Used on 32-bit systems to store 32-bit libraries
• /lib64 Used on 64-bit systems to store 64-bit libraries
• /usr/lib – Contains shared libraries and modules used by user-space applications, such as those in /usr/bin and /usr/sbin		
• /var/lib – Holds dynamic data libraries/files like the rpm/dpkg database and game scores. 
• /usr/local/lib –  holds libraries for local, custom, or third-party applications


/usr/lib are the libraries for the normal user-programs, that mostly can be found under /usr.

/usr/local/lib are the libraries for locally installed programs and packages ie. things you've compiled and installed from source-packages yourself.

In addition to shared and static libraries which are the lib-directories main purpose, you may also find some hierarchies (with their own lib, bin, include and so on) for some larger packages under them.
   
### Types of Libraries in Ubuntu
   Shared Libraries (.so files)**: These are dynamically loaded at runtime, saving memory by sharing code among programs.

- **Static Libraries**: These are linked at compile-time, resulting in larger binaries but eliminating the need for external library files.

- **Packages and Dependencies**: Libraries are often packaged with applications or as dependencies, managed by Ubuntu’s package manager (APT).

### Library Management with APT
- **Install Libraries**: Use 
```shell
apt install <library_name>
```
to install libraries (often in the form of `lib<name>-dev` packages for development).
Example: `sudo apt install libssl-dev` installs the development files for OpenSSL.
- **Update and Upgrade Libraries**: Use
```shell
sudo apt update
```
 to refresh repositories, and
 ```shell
 sudo apt upgrade
 ```
to update libraries to the latest versions.
- **Remove Libraries**: Use
```shell
sudo apt remove <library_name>
```
OR
```shell
sudo apt purge <library_name>
```
to uninstall libraries and all configuration files as well.

### Commonly Used Libraries in Ubuntu
   - **libc6**: The GNU C Library, a core library for compatibility with system calls.
   - **libstdc++**: The GNU Standard C++ Library, used by many C++ applications.
   - **libssl**: OpenSSL library, provides SSL and TLS protocols.
   - **libx11-dev**: Development library for the X Window System, used for GUI applications.
   - **libcurl**: For network transfers with URLs, commonly used for HTTP requests.

### Custom Libraries
   - Custom libraries can be compiled from source using
```shell
gcc
```
OR
```shell
make
```
After compiling, they can be linked during development by setting the `LD_LIBRARY_PATH` to point to the library directory.
   - Use `ldconfig` to refresh the shared library cache.

### Finding Library Files
   - **Locate Installed Libraries**: Use
```shell
ldconfig -p | grep <library_name>
```
to see if a library is installed and its path.
   - **List Dependencies of an Executable**: Use
```shell
ldd <executable>
```
shows shared libraries required by a specific executable.

### Library Paths and Configurations
   - **Environment Variables**:
     - `LD_LIBRARY_PATH`: Specifies directories where the loader searches for shared libraries before the default paths.
   - **Configuration Files**:
     - `/etc/ld.so.conf`: Lists directories where the linker looks for libraries.
     - `ldconfig`: Reads the `/etc/ld.so.conf` file and updates the cache for shared libraries.
     
  - **Troubleshooting Library Issues**
If you encounter `library not found` errors, ensure:
     1. The library is installed.
     2. `LD_LIBRARY_PATH` or `/etc/ld.so.conf` is configured to include the library path.
     3. Run `sudo ldconfig` after any changes to library paths.


REMARK: Because the files containing shared libraries must be available when the program is executed, most Linux systems contain shared libraries. Since static libraries are only required in a dedicated file when a program is linked, they might not be present on an end user system.