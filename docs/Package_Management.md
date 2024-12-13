   
# PACKAGE MANAGEMENT
                
A package manager in Linux is a software tool used to automate the process of installing, updating, and removing software packages on a Linux system.
      
### 1. **Debian-Based Systems** 

    Distributiions:   Ubuntu, Debian, Linux Mint
  - The Package Format of debian-based systems is **`.deb`**  
         **Package Managers**:   

     - **dpkg**: Low-level package manager.

       - **Commands**:
         - `dpkg -i <package>`: Install a package.
         - `dpkg -r <package>`: Remove a package.
         - `dpkg -L <package>`: List files in a package.
         - `dpkg -S <package>`: search a package owning a particular file.
         - `dpkg --configure -a`: to reconfigure packages 
         - `dpkg --purge <package>`: removes packages including configuration files you can use the **-p** flag too
         - `dpkg --verify <package>`: Verifies the integrity of a package
         - `dpkg -i --force PACKAGENAME`: forces dpkg to install or remove a package 
         - `dpkg-query --list` : list all installed packages and libraries

     - **APT (Advanced Package Tool)**: High-level package manager.

       - **Commands**:
         - `apt-get update` : Update package database.
         - `apt-get upgrade`: Upgrade installed packages.
         - `apt-get install -f`: to attempt fixes on broken dependencies or partially downloaded
         - `apt upgrade <package>`: to upgrade a specific package,
         - `apt install <package>`: Install a package.
         - `apt remove <package>`: Remove a package.
         - `apt --fix-broken install`: fix a broken package
         - `apt-cache search <package>`: Search for a package.
         - `apt clean` : to clear downloaded packages
         - `apt autoremove` :to clean unneeded dependencies
         - `apt full-upgrade`: Removes or installs packages if necessary to satisfy dependencies for upgrade.
         - `apt dist-upgrade`: Similar to `full-upgrade` : also handles dependency changes
         - `apt install <package>=<version>`: to install a specific version of a package
         - `apt-get check` : checks the system for broken dependencies.
         
                  
### 2. **Red Hat-Based Systems**

   	Distributions: Red Hat Enterprise Linux (RHEL), CentOS, Fedora.
   - Package Format of Red Hat-Based Systems is **`.rpm`**
   - **Package Managers**:
     - **rpm**: Low-level package manager.

       - **Commands**:
         - `rpm -i <package>.rpm`: Install an .rpm package.
         - `rpm -e <package>`: Remove a package.
         - `rpm -q <package>`: Query a package.
         - `rpm --checksig <package>.rpm` to verify an RPM package.

     - **YUM (Yellowdog Updater, Modified)**: High-level package manager for older RHEL/CentOS.

       - **Commands**:
         - `yum install <package>`: Install a package.
         - `yum remove <package>`: Remove a package.
         - `yum search <package>`: Search for a package.
         - `yum check` : for broken dependencies

     - **DNF (Dandified YUM)**: Updated high-level manager for Fedora, CentOS 8+, RHEL 8+.

       - **Commands**:
         - `dnf install <package>`: Install a package.
         - `dnf remove <package>`: Remove a package.
         - `dnf search <package>`: Search for a package
         - `dnf downgrade <package>`: for the previous version.
         - `dnf upgrade`: An alternative to `update`, meant to replace it on newer distributions.
         - `dnf check-update`: Useful for fixing issues after interrupted transactions.
         - `dnf check` :for broken dependencies
         - `dnf deplist <package>` : Displays package dependency tree
         - `dnf list --installed` : list installed packages
         
     
### 3. **SUSE-Based Systems**

    Distributions: openSUSE, SUSE Linux Enterprise Server (SLES).
   - **Package Format**: `.rpm`.
   - **Key Package Manager**:

     - **zypper**: Both a low-level and high-level package manager.

       - **Commands**:
         - `zypper install <package>`: Install a package.
         - `zypper install -f <package>`: Install and fixes dependencies 
         - `zypper install --download-only <package>` : download the package but doesn't install
         - `zypper remove <package>`: Remove a package.
         - `zypper search <package>`: Search for a package.
         - `zypper update`: Update all installed packages.
         - `zypper verify`: to identify and fix broken packages.
         - `zypper clean` : to clear cache.
         - `zypper info --recommends <package>`: Lists optional recommended dependencies.
         - `zypper install --oldpackage <package>=<version>`: to specify an older version.
         - `zypper se --provides` :Displays which package owns a file
         
### 4. **Gentoo-Based Systems**

     Distribution: Gentoo.
   - **Package Format**: `Source packages.`
   - **Key Package Manager**:
     - **Portage (emerge)**: Source-based package management system.
       - **Commands**:
         - `emerge <package>`: Install a package.
         - `emerge --unmerge <package>`: Remove a package.
         - `emerge --search <package>`: Search for a package.
         - `emerge --update <package>` :upgrades a package.
         - `emerge --fetchonly <package>` 
         
### 5. **Arch-Based Systems**

    Distribution: Arch Linux, Manjaro.
   - **Package Format**: `.pkg` `.tar` `.zst`
   - **Key Package Manager**:

     - **pacman**: Both Low-level and high-level package manager.

       - **Commands**:
         - `pacman -S <package>`: Install a package.
         - `pacman -R <package>`: Remove a package.
         - `pacman -Ss <package>`: Search for a package.
         - `pacman -Syu`: Update system and packages.
         - `pacman -Sc`: to clean the cache but keep currently installed files.
         - `pacman -Syu`: Full system upgrade.
         - `pacman -S <package>` : upgrades a specific package if already installed
         - `pacman -Dk <package>`: Checks for broken dependencies
         - `pacman -Qi <package>` : show information on a package including dependencies


### 6. **Alpine Linux**

    Distribution: Alpine
   - **Package Format**:
   - **Key Package Manager**:

     - **pacman**: 
        - `apk add <package>`: Install a package.
        - `apk del <package>` : Remove a package.
        - `apk search <package>` : Search for packages.
        - `apk info -R <package>` : Displays package dependency tree.
        - `apk upgrade <package>` : Upgrade package
        - `apk fetch <package>` : Download package without install

```
NOTE: Some package managers automatically handles dependency issues during 
the installation or updating process of some packages and some managers don't have 
the downgrade option so the required version is been downloaded manually 
and installed on the system, before doing so delete the upgraded version first
```
