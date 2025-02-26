### 1. **Getting System Information**

- **pwd**: Prints the current working directory.

  ```bash
  pwd
  ```

- **touch**: Creates a new file or updates the timestamp of an existing file.

  ```bash
  touch file.txt        # Create a new file named file.txt
  touch -r file1.txt file2.txt  # Set the timestamp of file2.txt to be the same as file1.txt
  touch -t 2024122510530 file.txt  # Set a custom timestamp (YYYYMMDDhhmm.ss)
  ```

- **uname**: Displays information about the system.

  ```bash
  uname                 # Shows the OS name
  uname -m              # Displays machine hardware name
  uname -r              # Shows the kernel version
  uname -a              # Displays all system information
  ```

- **man**: Opens the manual pages for a given command.

  ```bash
  man <command>         # Show the manual for a command
  ```

- **apropos**: Searches the manual page descriptions for a keyword.

  ```bash
  apropos <keyword>      # Search for commands related to a keyword
  ```

- **type**: Gives basic information about a command (e.g., whether it's built-in, a function, or an executable).

  ```bash
  type <command>
  ```

- **which**: Displays the location of an executable file for a command.

  ```bash
  which <command>
  ```

### 2. **Finding Environment Variables**

- **env / printenv**: Displays environment variables.

  ```bash
  env
  ```

- **echo**: Prints text or variable values to the terminal.

  ```bash
  echo "Hello, World!"
  echo $PATH
  ```

- **export**: Sets an environment variable for the current session and any child processes.

  ```bash
  export MY_VAR=123
  ```

- **unset**: Unsets or deletes an environment variable.

  ```bash
  unset MY_VAR
  ```

- **set**: Displays all environment variables.

  ```bash
  set
  ```

### 3. **Working with Quoting and Special Characters**

- **Single quotes** preserve the literal value of all characters.

  ```bash
  echo '$PATH'  # Output will literally show $PATH
  ```

- **Double quotes** preserve most characters, but variables and escape sequences are expanded.

  ```bash
  echo "$PATH"  # Output will show the value of PATH
  ```

### 4. **Redirection and Pipes**

- **Redirection**:
  - `>`: Redirects output to a file, overwriting the content.

    ```bash
    echo "Hello" > file.txt  # Writes "Hello" to file.txt, overwriting its contents
    ```

  - `>>`: Appends output to a file.

    ```bash
    echo "World" >> file.txt  # Appends "World" to file.txt
    ```

  - `2>`: Redirects error output (stderr) to a file.

    ```bash
    command 2> error.txt
    ```

  - `2>/dev/null`: Discards stderr (useful when you don’t care about errors).

    ```bash
    command 2>/dev/null
    ```

- **Pipes** (`|`): Redirects the output of one command as input to another command.

  ```bash
  ls | grep "file"  # List files, then filter to only show those containing "file"
  ```

- **diff**: Compares two files line by line.

  ```bash
  diff file1.txt file2.txt
  ```

- **tee**: Reads from stdin and writes to both stdout and a file.

  ```bash
  echo "Hello" | tee file.txt  # Output goes to both terminal and file.txt
  ```

### 5. **File Manipulation**

- **cat**: Concatenates and displays the content of a file.

  ```bash
  cat file.txt
  ```

- **head**: Displays the first ten lines of a file.

  ```bash
  head file.txt
  ```

- **tail**: Displays the last ten lines of a file.

  ```bash
  tail file.txt
  ```

- **nl**: Numbers the lines in a file.

  ```bash
  nl file.txt
  ```

- **wc**: Counts the number of lines, words, characters, or bytes in a file.

  ```bash
  wc -l file.txt  # Line count
  wc -w file.txt  # Word count
  wc -c file.txt  # Byte count
  ```

- **cut**: Removes sections from each line of files.

  ```bash
  cut -d':' -f1 file.txt  # Extract first field separated by ":"
  ```

- **uniq**: Filters out repeated lines in a file.

  ```bash
  uniq file.txt
  ```

- **tr**: Translates or deletes characters.

  ```bash
  echo "hello" | tr 'a-z' 'A-Z'  # Converts lowercase to uppercase
  ```

- **split**: Splits a file into multiple smaller files.

  ```bash
  split -l 100 file.txt  # Splits file.txt into 100-line chunks
  ```

- **sed**: Stream editor for basic text transformations.

  ```bash
  sed 's/cat/dog/g' file.txt  # Replace all instances of "cat" with "dog"
  sed '/dog/d' file.txt  # Delete all lines containing "dog"
  sed -n '/cat/p' file.txt  # Print lines containing "cat"
  ```

### 6. **File Compression**

- **gzip**: Compresses files using the GZIP algorithm (`.gz`).

  ```bash
  gzip file.txt
  ```

- **zcat**: Displays the contents of a gzipped file without decompressing it.

  ```bash
  zcat file.txt.gz
  ```

- **sha256sum / md5sum**: Generates checksums for files.

  ```bash
  sha256sum file.txt  # Calculates the SHA-256 checksum of file.txt
  md5sum file.txt  # Calculates the MD5 checksum
  ```

### 7. **File and Directory Operations**

- **cp**: Copies files or directories.

  ```bash
  cp file1.txt file2.txt
  ```

- **mv**: Moves or renames files or directories.

  ```bash
  mv file1.txt newfile.txt
  ```

- **mkdir**: Creates a new directory.

  ```bash
  mkdir new_directory
  ```

- **rmdir**: Removes an empty directory.

  ```bash
  rmdir empty_directory
  ```

- **find**: Searches for files in a directory hierarchy.

  ```bash
  find /path/to/dir -name "*.txt"  # Find all .txt files
  ```

- **tar**: Used to create, extract, or list archive files.

  ```bash
  tar -cvf archive.tar file1.txt file2.txt  # Create tar archive
  tar -xvf archive.tar  # Extract tar archive
  ```

- **dd**: Low-level copying and conversion of data.

  ```bash
  dd if=inputfile of=outputfile bs=64K conv=noerror,sync
  ```

### 8. **More Redirection**

- **1>**: Redirects standard output to a file (same as `>`).

  ```bash
  echo "Hello" > file.txt
  ```

- **>&2**: Redirects stdout to stderr.

  ```bash
  echo "Error!" >&2
  ```

- **2>/dev/null**: Discards stderr output.

  ```bash
  command 2>/dev/null  # Suppress error output
  ```

---

These commands are essential tools for Unix/Linux users, especially for managing files, processes, environment variables, and system information.
