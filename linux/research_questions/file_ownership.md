# Linux File Ownership and Default Permissions

1. **Why is managing file ownership important?**

   Ownership helps control who can access and modify files. It protects sensitive data and prevents users or applications from making unauthorised changes. Each file or directory has an owner and an owning group; permissions determine what they can do.

2. **What is the command to view file ownership?**

   ```bash
   ls -l
   ```

   Example:

   ```text
   -rw-r--r-- 1 ubuntu ubuntu 0 Oct 12 10:00 new.txt
   ```

   The first `ubuntu` is the owner and the second is the owning group. Your VM may show a different username or group.

   To view a directory itself, rather than its contents:

   ```bash
   ls -ld myfolder
   ```

3. **What permissions are set when a user creates a file or directory? Who does it belong to?**

   Common defaults with a `022` umask are:

   | Item | Permissions | Owner | Group | Other |
   |---|---|---|---|---|
   | File | `644` (`rw-r--r--`) | Read and write | Read | Read |
   | Directory | `755` (`rwxr-xr-x`) | Read, write and execute | Read and execute | Read and execute |

   Actual permissions depend on the program creating the item and the current **umask**, which removes permission bits from the permissions requested by the program. Ordinary files normally start from `666`; directories normally start from `777`.

   The owner is normally the user who creates the item. Its group is usually the creator’s primary group, but a parent directory with the setgid bit can make it inherit that directory’s group.

   Check your current user, groups and umask:

   ```bash
   whoami
   id
   umask
   ```

4. **Why does the owner, by default, not receive execute (`x`) permissions when creating a file?**

   Most files contain data, such as text, and do not need to run as programs. Ordinary file creation therefore normally requests permissions without execute bits; this is not just a result of the umask.

   To make a script executable by its owner:

   ```bash
   chmod u+x script.sh
   ```

   Directories normally receive execute permission because it allows users to enter and traverse them.

5. **What command changes the owner of a file or directory?**

   Use `chown`. Changing the owner normally requires administrator privileges:

   ```bash
   sudo chown newowner new.txt
   ```

   Change the owner and group together:

   ```bash
   sudo chown newowner:newgroup new.txt
   ```

   Replace `newowner` and `newgroup` with existing accounts on your VM. The same command works for a directory itself:

   ```bash
   sudo chown newowner myfolder
   ```

   `chown` changes ownership; `chmod` changes permissions.

## Test on your cloud VM

These commands create a temporary practice directory and new items without modifying your existing files:

```bash
cd ~
practice_dir=$(mktemp -d ownership-practice.XXXXXX)
cd "$practice_dir"
whoami
id
umask
touch new.txt
mkdir myfolder
ls -l new.txt
ls -ld myfolder
```

Compare the owner and group with `id`, and the permissions with your umask. With `022`, you would normally see `644` for the file and `755` for the directory.

Test adding owner execute permission:

```bash
chmod u+x new.txt
ls -l new.txt
```

If the file started at `644`, it should now be `744` (`rwxr--r--`). Adding execute permission does not turn a text file into a valid program.

Remove the execute permission again:

```bash
chmod u-x new.txt
ls -l new.txt
```

Test changing ownership of the practice file, then restore it:

```bash
original_owner=$(id -un)
sudo chown root new.txt
ls -l new.txt
sudo chown "$original_owner" new.txt
ls -l new.txt
```

The owner should change to `root`, then back to your username. The owning group stays unchanged because no group was specified.

**Testing status:** These are commands for you to run on your cloud VM; they have not been executed on your VM here.

