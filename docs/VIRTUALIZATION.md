# `VIRTUALIZATION`

Virtualization is a technology that enables a software platform, called a *hypervisor*, to run processes that contain a fully emulated computer system.

## Types of Hypervisors 
>### Xen
>Xen is an open source `Type-1 hypervisor`, meaning that it does not rely on an underlying operating system to function. A hypervisor of this sort is known as a `**bare-metal hypervisor**` since the computer can boot directly into the hypervisor

>### KVM (Kernel Virtual Machine)
>It is a Linux kernel module for virtualization. KVM is a hypervisor of both `**Type-1 and Type-2 hypervisor**`  because, although it needs a generic Linux operating system to work, it is able to perform as a hypervisor perfectly well by integrating with a running Linux installation. Virtual machines deployed with KVM use the `**libvirt daemon**` and associated software utilities to be created and managed

>### VirtualBox
>It's a popular desktop application that makes it easy to create and manage virtual machines.
>Oracle VM VirtualBox is cross-platform, and will work on Linux, macOS, and Microsoft Windows. Since VirtualBox requires an underlying operating system to run, it is a Type-2 hypervisor. 



>### Migration 
>
>It's the process of moving a virtual machine from one hypervisor installation to another

### Types of Virtual Machines

> 1. `Fully Virtualized` : All instructions that a guest operating system is expected to execute must be able to run within
a fully virtualized operating system installation. The reason for this is that no additional
software drivers are installed within the guest to translate the instructions to either simulated
or real hardware. A fully virtualized guest is one where the guest (or HardwareVM) is unaware
that it is a running virtual machine instance

 > 2. `Paravirtualized` :A paravirtualized guest (or PVM) is one where the guest operating system is aware that it is a
running virtual machine instance. These types of guests will make use of a modified kernel and
special drivers (known as guest drivers) that will help the guest operating system utilize
software and hardware resources of the hypervisor. The performance of a paravirtualized
guest is often better than that of the fully virtualized guest due to the advantage that these
software drivers provide.

 > 3. `Hybrid` :It combines full virtualization techniques with paravirtualized drivers to overcome limitations with hardware-assisted full virtualization

A virtual machine’s hard disk image is located at **/var/lib/libvirt/images/**.

 >### The D-Bus Machine ID

 >It's a machine identification number generated at install time. 
 >If a virtual machine is cloned to be used as a template for other virtual machine installations, a new D-Bus machine ID would need to be created to
 ensure that system resources from the hypervisor get directed to the appropriate guest system.

```shell
dbus-uuidgen --get

```
No two Linux systems running on a hypervisor should have the same D-Bus machine ID.

### Containerization

containerization is operating-system–level virtualization or application-level virtualization 
over multiple network resources so that software applications can run in isolated user spaces 
called containers in any cloud or non-cloud environment,

### Containers

Containers are lightweight packages of software that contain all of the necessary elements to run in any environment.