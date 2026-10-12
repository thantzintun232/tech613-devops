# Linux: Numeric File Permissions

## 1. What numeric values are assigned to each permission?

**Answer:**

| Permission | Symbol | Numeric value |
| --- | --- | --- |
| Read | `r` | 4 |
| Write | `w` | 2 |
| Execute | `x` | 1 |
| No permission | `-` | 0 |

Add the values together to combine permissions for an entity (User, Group or Other).

## 2. What numeric value would you use to assign read + write permissions?

**Answer:** **6**, because read (`4`) + write (`2`) = `6`.

Symbolic form: `rw-`.

## 3. What numeric value would you use to assign read, write and execute permissions?

**Answer:** **7**, because read (`4`) + write (`2`) + execute (`1`) = `7`.

Symbolic form: `rwx`.

## 4. What numeric value would you use to assign read and execute permissions?

**Answer:** **5**, because read (`4`) + execute (`1`) = `5`.

Symbolic form: `r-x`.

## 5. Often, a file or directory's mode/permissions are represented by three numbers. What does `644` mean?

**Answer:** The three digits represent **User (owner), Group and Other**, in that order.

| Entity | Digit | Permissions | Symbolic form |
| --- | --- | --- | --- |
| User (owner) | 6 | Read and write | `rw-` |
| Group | 4 | Read only | `r--` |
| Other | 4 | Read only | `r--` |

So `644` means `rw-r--r--`: the owner can read and edit the file, while Group and Other can only read it. Nobody receives execute permission from this mode.

Example:

```bash
touch testfile.txt
chmod 644 testfile.txt
ls -l testfile.txt
```

The permissions at the start of the listing should be:

```text
-rw-r--r--
```

The first `-` indicates a regular file. The remaining nine characters show the permissions.

For a **directory**, execute (`x`) means permission to enter or traverse it. A directory with mode `644` lacks this permission for everyone, so it is generally unsuitable for normal directory access.

## Quick reference

| Value | Permissions | Symbolic form |
| --- | --- | --- |
| 0 | None | `---` |
| 1 | Execute | `--x` |
| 2 | Write | `-w-` |
| 3 | Write and execute | `-wx` |
| 4 | Read | `r--` |
| 5 | Read and execute | `r-x` |
| 6 | Read and write | `rw-` |
| 7 | Read, write and execute | `rwx` |
