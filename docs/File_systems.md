### **Introduction to Disk Partitioning**

In any operating system, before data can be stored on a disk, the disk must be partitioned. A partition is a logical subset of the physical disk. Information about the partitions is stored in the partition table, which includes details about the start and end sectors, as well as the type of each partition.

#### **Partitioning Systems**

1. **Master Boot Record (MBR)**:
   - **Location**: Stored at the very beginning of a storage device.
   - **Limitations**:
     - It can only have 4 primary partitions or 3 primary partitions and 1 extended partition.
     - It can't address disks larger than 2TB.

2. **GUID Partition Table (GPT)**:
   - **Improvement**: GPT resolves many of MBR's limitations.
   - **Features**:
     - Supports disks up to 64TB.
     - Allows an almost unlimited number of partitions (128 partitions on Windows).
   - **Used in UEFI standard**.

### **Disk Partitioning in Linux**

Each partition in Linux is assigned a directory under `/dev/`. For example, `/dev/sda1` is the first partition of the first hard disk, and the naming convention follows for other devices. Linux uses **fdisk** and **gdisk** utilities for managing MBR and GPT partitions, respectively.

#### **fdisk (MBR)**

- Used to manage MBR partitions.
- Common commands:
  - `fdisk`: Enter partition utility.
  - `lsblk`: List block devices.
  - `fdisk /dev/sda`: Start managing partitions for the first hard disk.
  - `(P)`: List partition table.
  - `(n)`: Create a new partition.
  - `(d)`: Delete a partition.

#### **gdisk (GPT)**

- Main utility for GPT partitions.
- Commands:
  - `gdisk /dev/sda`: Start managing GPT partitions.
  - `n`: Create a new partition.
  - `p`: Print partition table.
  - `d`: Delete a partition.

---

### **Filesystem and Filesystem Types**

A **filesystem** defines how data is stored and retrieved from a storage device.

- **FAT (File Allocation Table)**: Common for USB drives and memory cards.
- **NTFS (New Technology File System)**: Supports large files, encryption, file permissions, and journaling.
- **EXT (Extended File System)**: Used in Linux systems with versions such as EXT2, EXT3, and EXT4 (EXT4 is the most widely used).

#### **Creating a Filesystem in Linux:**

- `mkfs.ext4 /dev/sda1`: Creates an EXT4 filesystem on the first partition of the first hard disk.
- `mount`: Used to mount a filesystem. For example, `mount /dev/sda1 /mnt` mounts the partition to `/mnt`.
- `cat /proc/self/mountinfo`: View detailed mount information.

#### **Making a Swap (for Virtual Memory)**

- `mkswap /dev/sda1`: Creates a swap space.
- `swapon /dev/sda1`: Activates the swap.
  
#### **Maintaining Filesystem Integrity**

- `du -h`: Shows disk usage in a human-readable format.
- `df -i`: Shows inode usage.
- `fsck`: Check and repair a filesystem.

---

### **File Permissions and Ownership**

In Linux, every file or directory has associated permissions and ownership.

1. **Permissions**: Control who can read, write, and execute a file.
   - **umask**: Sets default permissions for new files.
   - **chmod**: Modify permissions (e.g., `chmod u+x file`).
   - **chown**: Change ownership of a file (e.g., `sudo chown user:group file`).
   - **chgrp**: Change the group ownership of a file (e.g., `chgrp group file`).

2. **Types of Links**:
   - **Hard Links**: Multiple entries in the filesystem pointing to the same data block (inode) on the disk.
   - **Symbolic Links (Symlinks)**: Pointers to the path of another file.

---

### **Directory Structure in Linux**

- `/`: The root directory, everything is contained within it.
- `/bin`: Essential binaries for all users.
- `/boot`: Files required for booting.
- `/dev`: Device files representing hardware (e.g., `/dev/sda` for disks).
- `/home`: User directories for personal files.
- `/lib`: Shared libraries required for booting and running binaries under `/bin`.
- `/media`: Mounted external devices.
- `/mnt`: Mount points for temporarily mounted filesystems.
- `/opt`: Application software packages.
- `/root`: Superuser's home directory.
- `/sbin`: System binaries.
- `/tmp`: Temporary files.

---

### **File Operations**

- **Creating files**: `touch file.txt` creates an empty file.
- **Viewing files**: `cat file.txt` prints the content to the screen.
- **Changing permissions**:
  - `chmod 755 file`: Change permissions of a file.
  - `chmod u+x file.txt`: Add execute permission to the user.

### **Useful Commands for File Operations**

- **chmod**: Modify file permissions.
- **chown**: Modify file ownership.
- **chgrp**: Modify file group ownership.
- **ln -s**: Create a symbolic link.
- **ln**: Create a hard link.
  
---

### **Examples of Key Commands**

1. **Change permissions using chmod**:
   - `chmod u+g+rw-x,o-rwx file.txt`: Adds read and write permissions for the user and group, removes all permissions for others.
   - `ls -l file.txt`: Lists the file’s permissions.

2. **Change ownership using chown**:
   - `sudo chown user:group file.txt`: Change ownership of `file.txt` to `user` and group `group`.

3. **Change group ownership using chgrp**:
   - `chgrp group file.txt`: Change the group of `file.txt`.

4. **Using `getent` to see group info**:
   - `getent group`: Lists all groups.
   - `grep "group_name" /etc/group`: Check if a specific group exists.

5. **Pipelining Commands**:
   - `ls -l | grep "pattern"`: Search for files matching a specific pattern.
   - `echo "my name is zara" > output.txt`: Redirects the output to a file.

---

This provides a thorough understanding of filesystems, partitioning, file management, and key Linux commands related to storage and file permissions. The tools mentioned are essential for handling file structures, partitioning, and the management of disk spaces effectively.
