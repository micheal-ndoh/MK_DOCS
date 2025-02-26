# **Multipass Docker VM Documentation**

This guide explains how to use **Multipass** to launch and manage Docker containers within a virtual machine (VM). Each section provides step-by-step instructions for various tasks, from launching a Docker VM to linking it with the host machine and accessing Docker services.

---

## **1. Launch Docker VM with Multipass**

To launch a new virtual machine running Docker, use the following command:

```sh
multipass launch --name docker-vm
```

This command launches a new Ubuntu instance named `docker-vm`. You can manually install Docker inside the VM or automate the process using a cloud-init script.

---

## **2. List Running Instances with Multipass**

To check all running Multipass instances, use:

```sh
multipass list
```

**Example Output**:

```
Name                    State             IPv4             Image
docker-vm               Running           192.168.64.2     Ubuntu 22.04 LTS
```

---

## **3. Access the Docker VM Shell**

To interact with the VM directly, enter its shell:

```sh
multipass shell docker-vm
```

Once inside, you can install Docker or manage configurations.

---

## **4. Launch a Docker VM with a Custom Name**

Specify a custom name for the VM during launch:

```sh
multipass launch --name docker-vm
```

The `--name` flag assigns a custom name (`docker-vm` in this case).

---

## **5. View Available Multipass Images**

To see available images for launching VMs:

```sh
multipass images
```

This lists all available images (e.g., Ubuntu versions).

---

## **6. Check Running Docker Containers**

Once Docker is installed, check container status inside the VM:

```sh
docker ps
```

This lists all running Docker containers, including their names, statuses, and port mappings.

---

## **7. Access a Docker Container via Portainer**

To access a Docker container from the host machine:

1. Find the VM's IP address:

   ```sh
   multipass list
   ```

2. Map the container port (e.g., `9000`) to the host. Access it via:

   ```
   http://<VM-IP>:9000
   ```

   **Example**:

   ```
   http://192.168.64.2:9000
   ```

This allows access to the Portainer web interface running in the VM.

---

## **8. Link Host Machine with Virtual Machine**

To facilitate file sharing, mount a host directory into the VM:

```sh
multipass mount /host/directory docker-vm:/vm/directory
```

This mounts `/host/directory` from the host into `/vm/directory` in the VM.

---

## **9. Execute Docker Commands in VM from Host**

Run Docker commands directly from the host using `multipass exec`:

```sh
multipass exec docker-vm -- docker ps
```

This executes `docker ps` inside `docker-vm` and displays the output on the host.

---

## **10. Create a Docker Alias for Ease of Use**

Simplify Docker commands by creating an alias in your `~/.bashrc` or `~/.zshrc` file:

```sh
alias docker="multipass exec docker-vm -- docker"
```

Now, run Docker commands as if they were local:

```sh
docker ps
```

This executes the commands inside `docker-vm` seamlessly.

---
