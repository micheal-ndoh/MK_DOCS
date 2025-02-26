
# **VIRTUALIZATION**

Virtualization is a technology that enables a software platform, called a *hypervisor*, to run processes that contain a fully emulated computer system.

---

## **Types of Hypervisors**

### **Xen**

- **Type**: `Type-1 Hypervisor` (Bare-Metal Hypervisor)  
- **Description**: Xen is an open-source hypervisor that does not rely on an underlying operating system. It boots directly into the hypervisor, making it a bare-metal hypervisor.  

### **KVM (Kernel Virtual Machine)**

- **Type**: `Type-1 and Type-2 Hypervisor`  
- **Description**: KVM is a Linux kernel module for virtualization. It integrates with a running Linux installation, allowing it to function as both a Type-1 and Type-2 hypervisor. Virtual machines deployed with KVM use the `libvirt daemon` and associated utilities for management.  

### **VirtualBox**

- **Type**: `Type-2 Hypervisor`  
- **Description**: VirtualBox is a popular desktop application for creating and managing virtual machines. It is cross-platform, supporting Linux, macOS, and Windows. As it requires an underlying operating system, it is classified as a Type-2 hypervisor.  

---

## **Migration**

Migration is the process of moving a virtual machine from one hypervisor installation to another.

---

## **Types of Virtual Machines**

### **1. Fully Virtualized**

- **Description**: All instructions executed by the guest operating system run within a fully virtualized environment. The guest is unaware it is running in a virtual machine (HardwareVM).  
- **Use Case**: Ideal for unmodified guest operating systems.  

### **2. Paravirtualized**

- **Description**: The guest operating system is aware it is running in a virtual machine (PVM). It uses a modified kernel and guest drivers to optimize resource utilization.  
- **Use Case**: Offers better performance than fully virtualized guests.  

### **3. Hybrid**

- **Description**: Combines full virtualization with paravirtualized drivers to overcome hardware-assisted full virtualization limitations.  
- **Use Case**: Balances performance and compatibility.  

---

## **Virtual Machine Hard Disk Image Location**

Virtual machine hard disk images are typically stored at:  

```shell
/var/lib/libvirt/images/
```

---

## **The D-Bus Machine ID**

The D-Bus Machine ID is a unique identification number generated during installation.  

### **Why It’s Important**

- If a virtual machine is cloned, a new D-Bus Machine ID must be generated to ensure proper resource allocation.  
- No two Linux systems on a hypervisor should share the same D-Bus Machine ID.  

### **Generate a New D-Bus Machine ID**

```shell
dbus-uuidgen --get
```

---

## **Containerization**

Containerization is a form of operating-system–level virtualization that allows software applications to run in isolated user spaces called containers.  

### **Key Points**

- Lightweight and portable.  
- Can run in any cloud or non-cloud environment.  

---

## **Containers**

Containers are lightweight software packages that include all necessary dependencies to run an application in any environment.  

---
