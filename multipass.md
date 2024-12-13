 # Multipass Docker VM Documentation
This explains how to use Multipass to launch and manage Docker containers within a virtual machine (VM). Each section will guide you through various tasks, from launching a Docker VM to linking it with the host machine, and accessing Docker services.

 ### 1. Launch Docker VM with Multipass
The first step is to launch a new virtual machine that runs Docker using Multipass. You can specify a base image such as ubuntu and install Docker inside the VM.
```
    multipass launch --name docker-vm
```
This command will launch a new Ubuntu instance named docker-vm. Once the VM is running, you can manually install Docker inside the VM or automate this process via a cloud-init script.

### 2. List Running Instances with Multipass
To check all the running instances launched by Multipass, use the list command. This will display the instance name, state, and IP address.
```
multipass list
```
You will see output like this:
```
Name                    State             IPv4             Image
docker-vm               Running           192.168.64.2     Ubuntu 22.04 LTS 
```
### 3. Access the Docker VM Shell
To interact with the VM directly, you can enter its shell. This allows you to run commands inside the VM as if it were your local machine.
```
multipass shell docker-vm
```
Once inside, you can install Docker or manage any internal configurations.

### 4. Launch a Docker VM with a Custom Name
You can specify the name of the virtual machine when launching it. This helps you manage multiple VMs easily.

multipass launch --name docker-vm
The --name flag allows you to assign a custom name to the VM, in this case, docker-vm.

### 5. View Available Multipass Images
If you're unsure which images you can use to launch a VM, you can view all available images using the multipass images command.
```
multipass images
```
This will display a list of available images, such as Ubuntu versions, that can be used for launching new VMs.

### 6. Check Running Docker Containers
Once Docker is installed in the VM, you can check the status of containers using the docker ps command inside the VM.
```
docker ps
```
This command lists all the running Docker containers, including their names, statuses, and port mappings.

### 7. Access a Docker Container via Portainer
To access a Docker container running on the VM from your host machine, you need to know the VM's IP address and the port the container is exposed on.
Find the IP address of your Docker VM using:
```
multipass list
```
Then, map the port of the container running in Docker (Portainer) to the host machine. If the container is running on port 9000 inside the VM, you can access it via **(VM-IP):9000** from the host.
```
Example:
http://192.168.64.2:9000
```
This would allow you to access the Portainer web interface running on port 9000 of your Docker VM.

### 8. Link Host Machine with Virtual Machine
To facilitate easier interaction between the host machine and the Docker VM, you can set up network forwarding, or mount directories from the host into the VM for file sharing. Here's how you can mount a directory:
```
multipass mount /host/directory docker-vm:/vm/directory
```
This command mounts /host/directory from your local machine into /vm/directory in the virtual machine, allowing easy file access between the two systems.

### 9. Execute Docker Commands in VM from Host
Instead of entering the VM's shell to run Docker commands, you can execute commands directly from the host machine using **Multipass exec.**
```
multipass exec docker-vm -- docker ps
```
This command will execute the docker ps command inside the docker-vm and display the output directly on your host machine.

### 10. Create a Docker Alias for Ease of Use
To simplify running Docker commands inside the VM from the host, you can create an alias that allows you to run docker commands on your host, but they are executed inside the VM.
Add this alias to your **.bashrc or .zshrc file**
```
alias docker="multipass exec docker-vm -- docker"
```
Now, you can run any docker command as if Docker were installed locally, and it will execute inside the docker-vm:
```
docker ps
```
This allows for seamless interaction with Docker containers running inside your virtual machine.