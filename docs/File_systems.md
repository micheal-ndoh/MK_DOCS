
# Presentastion-on-filesystem-and-FHS

**introduction**

  On any operating system, a disk needs to be partitioned before it can be used. A partiton is a logical subset of the physical disk and information about your partitions are store in a partition table. this table include information about the first and the last sector of the partitons and its types.
*there are two main ways of storing partitions information on a hard disk 

   -1) the master boot record (MBR)
   
   -2) The guid partiton table (GPT)
   
MBR : this is a special type of boot sector located at the very beginning of a storage device such as :hard                   disk,ssd,which stores very crucial informations for the system to boot and manage partition.
     feautures of MBR::it is limited to only 4 primary partitions per disk or 3 primary partition plus one extended,and        the inability to address disks more than 2TB in size.

GPT : A partition system that is better than MBR since it addresses many of the limitions of the MBR. there is no practical limit ona disk size (64TB) and the maximum number of partitions are limited only by the operating system (but on windows we have 128 partitions) it is part of the UEFI  standard.

NOTE: on linux,each partition is assign to a directory under a /dev/sda1 (the sd indicates the SCSI(small computer system interface) and serial advance technology attachment(SATA) )

Disk partitioning...this is the process of dividing a storage device into saperate distinct sections each of which can be managed independently
there are two types of partitions :primary partition which is the main partition on the disk while and extended partiton act as a container to logical partitions 

 fdisk: this is a standard utility for managing MBR partitions 
 - fdisk
 - lsblk
 - fdisk /dev/sda1
 - (P) list partition table
 - (n) creat new partition
 - (d) delete partition
    
*gdisk:
- this is the main utility for creating GPT partitions.
- gdisk /dev/sda15
- n (choose your numb)
- p (print)
- d (delete)  
## FILESYSTEM HS

A filesystem manages how data is stored ,retrived and oranized on a storage device ( hard drive ,usb)
- FAT(file allocation table) used in usb drivs and memory cards
- NTFS (new tech file system) supports large files ,encryption,file pemissions and journaling.
- EXT (extended file system ) linux sysytems includes:ext2 ext3 ext4 with ext4 being widely used

  ##### create fs using ```mkfs```
  
- mkfs.ext4 /dev/sda1
- mount | grep ext4
- cat /proc/self/mountinfo
  
TO mount filesystem 
  - mount /dev/sda /mnt
  
TO make a swap(vm) 
- mkswap /dev/sda1  
- then umount /dev/sda15 
- now make a swap ,mkswap /dev/sda1 1000 
- swapon /dev/sda15 
         
##### Maintaining integrity of FS

- ```du -h```;
- ```du -a```  (shows an individual counts for all files or direcory),
- ```du -sh``` (shows you how much space do the files in the current directory occupy ) ,
- ```du -shc``` (the diff space used by file in the currnt directories and subdirectories) and 
- ```df -i``` (show you used inodes instead of block) and fsck (check for errors in fs)



  Modifying file permissions 
      -umask default value(00)  umask set a default permissins for every file created  for a directory(777) or a file(666)
      - umask -S to get an output in symbolic mode.
      - chmod: used to modfiy the permissions for a file
  
### HARD AND SYMBLIC LINKS

 symbolic links they point to the path of another file. hard link(original file) they an additional entry in the filsystem pointing to thesame place (inode)on the disk.
Inode is a data structurethat stores attributes for an objects(permisions and ownership)like a file,dir on a fs

  ### DIRECTORY STRUCTURE
  
  - / =every other directory is located inside it
  - /bin =essentials binaries available to all users
  - /boot =files needed to boot the process 
  - /dev =hardware devices are represented in this dir like usb drives 
  - /home =stores personal files of the user 
  - /lib =shared libraries needed to boot the operation system and run binaries under /bin 
  - /media =stores external devices like flash drives 
  - /mnt =stores mount point for temporarily mounted fs 
  - /opt =application software packages 
  - /root =home director for super user 
  - /sbin =system binary 
  - /tmp =temporary files
  - 
         chmod : change permissions of a file or directory
       - touch a file say text.text 
       - ls -l text.text
  
    ### chmod: used to modfiy the permissions for a file 
   - chmod u+g+rw-x,o-rwx text.text 
   - ls -l text.text               (chmod 660 text.text thesame but in binary form)
      
  ### chown : it is used to modify the ownership of a file or directory
     
     - mkdir zara_pretty
         -ls -l
        cat /etc/group
        - ls -la
        - sudo addgroup zara_pretty 
        - sudo chown nafisatou:zara_pretty txt.txt 
        - ls -l txt.txt 
  ## chgrp
      use getent group to see which group exist on your system (the -l will list all of it members)
       - grep "bash" /etc/passwd  
       - grep "bin" /etc/passwd 
   
  ##we can also used pipeline to search text within files
  
        -ls -l | grep "test" 
      REDIRECT  
      
      - echo "my name is zara" > output.txt 
      
      - cat output.txt
      
      
      
      
      
      
           
      
      

 
  
