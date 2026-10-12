# Linux: Changing File Permissions

## 1. What command changes file permissions?

**Answer:** `chmod` (change mode).

```bash
chmod u+w testfile.txt
```

This adds write permission for the file's owner.

## 2. To change permissions on a file, what must the end user be? (Two answers)

**Answer:** Either:

1. The **owner of the file**.
2. **Root**, or a user authorised to run `chmod` with `sudo`.

Having write permission or belonging to the file's group does not, by itself, allow you to change its permissions.

## 3. Create a new file named `testfile.txt`.

**Answer:**

```bash
touch testfile.txt
ls -l testfile.txt
```

`touch` creates the file if it does not exist. `ls -l` shows its permissions, owner and group.

## 4. Set User to read, Group to read + write + execute, and Other to read and write only.

**Answer:** Use symbolic notation:

```bash
chmod u=r,g=rwx,o=rw testfile.txt
```

Or use numeric notation:

```bash
chmod 476 testfile.txt
```

Both set the ordinary permissions to `r--rwxrw-`.

| Entity | Permissions | Numeric value |
| --- | --- | --- |
| User (owner) | Read | 4 |
| Group | Read, write and execute | 7 |
| Other | Read and write | 6 |

## 5. Add execute permissions to all entities.

**Answer:**

```bash
chmod a+x testfile.txt
```

An equivalent command is:

```bash
chmod u+x,g+x,o+x testfile.txt
```

`a` means all: User, Group and Other. `+` adds permission while keeping existing permissions. If the starting mode is `476`, the result is `577` (`r-xrwxrwx`).

## 6. Take write permissions away from Group.

**Answer:**

```bash
chmod g-w testfile.txt
```

`g` means Group, and `-w` removes write permission while keeping the other permissions. If you run this after Question 5, the result is `557` (`r-xr-xrwx`).

## 7. Use numeric values to give read + write access to User, read access to Group, and no access to Other.

**Answer:**

```bash
chmod 640 testfile.txt
```

| Entity | Permissions | Calculation | Value |
| --- | --- | --- | --- |
| User (owner) | Read and write | 4 + 2 | 6 |
| Group | Read | 4 | 4 |
| Other | None | 0 | 0 |

The resulting permissions are `rw-r-----`.

The symbolic equivalent is:

```bash
chmod u=rw,g=r,o= testfile.txt
```

## Quick reference

| Symbol | Meaning |
| --- | --- |
| `u` | User: the file's owner |
| `g` | Group: the file's owning group |
| `o` | Other: users outside the owner and group categories |
| `a` | All three entities |
| `r` / `4` | Read |
| `w` / `2` | Write |
| `x` / `1` | Execute |
| `+` | Add permission |
| `-` | Remove permission |
| `=` | Set the specified permissions exactly |

