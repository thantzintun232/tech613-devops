# Linux User, Group and Other Permissions

1. **Does being the owner of a file mean you have full permissions on that file? Explain.**

   No. Being the owner does not automatically give you read, write and execute permissions. Your access depends on the file’s owner permission bits. For example, an owner with `r--` can read the file but cannot directly write to or execute it. However, the owner can normally change the permissions using `chmod`.

2. **If you give permissions to the User entity, what does this mean?**

   The permissions apply to the file’s owner. `User` (`u`) does not mean every user or simply whoever is logged in.

   Example:

   ```bash
   chmod u+w keeprunning.sh
   ```

   This adds write permission for the owner.

3. **If you give permissions to the Group entity, what does this mean?**

   The permissions apply to users who belong to the file’s owning group, except the owner, whose owner permissions apply instead.

   Example:

   ```bash
   chmod g+w keeprunning.sh
   ```

   This adds write permission for the owning group.

4. **If you give permissions to the Other entity, what does this mean?**

   The permissions apply to users who are neither the owner nor members of the file’s owning group.

   Example:

   ```bash
   chmod o-r keeprunning.sh
   ```

   This removes read permission for others.

5. **User permissions are read-only, Group permissions are read and write, and Other permissions are read, write and execute. You are logged in as the owner. What permissions do you have? Explain.**

   You have **read-only access** under these permission bits. Linux selects the owner category because you own the file. It does not combine the owner, group and other permissions or fall back to a more permissive category.

   | Category | Permissions | Numeric value |
   |---|---|---|
   | User (owner) | `r--` | 4 |
   | Group | `rw-` | 6 |
   | Other | `rwx` | 7 |

   The numeric mode is **467**, written as `r--rw-rwx`.

   This describes ordinary permission-bit checks; privileged processes and other access controls can affect actual access.

6. **Here is one line from `ls -l`. Explain everything you can about the file and its permissions.**

   ```text
   -rwxr-xr-- 1 tcboony staff 123 Nov 25 18:36 keeprunning.sh
   ```

   | Part | Meaning |
   |---|---|
   | First `-` | A regular file, not a directory |
   | `rwx` | Owner can read, write and execute |
   | `r-x` | Group can read and execute, but cannot write |
   | `r--` | Others can read, but cannot write or execute |
   | `1` | Number of hard links to the file |
   | `tcboony` | File owner |
   | `staff` | Owning group |
   | `123` | File size: 123 bytes |
   | `Nov 25 18:36` | Last modification time shown by `ls`; the year is not displayed |
   | `keeprunning.sh` | Filename; `.sh` suggests a shell script, but does not prove its contents |

   Its numeric permissions are **754**:

   - Owner: `4 + 2 + 1 = 7`.
   - Group: `4 + 1 = 5`.
   - Other: `4`.

   To set this mode:

   ```bash
   chmod 754 keeprunning.sh
   ```

   If logged in as `tcboony`, your permission category is the owner category (`rwx`), even if you are also in `staff`.

   Execute permission allows an attempt to execute the file; successful execution also depends on valid contents, an available interpreter where needed, and other system restrictions. Removing the file depends mainly on its parent directory’s permissions, rather than write permission on the file itself.

## Quick reference

| Permission | Symbol | Numeric value | Meaning for a regular file |
|---|---|---|---|
| Read | `r` | 4 | Read the contents |
| Write | `w` | 2 | Modify the contents |
| Execute | `x` | 1 | Execute it as a program |
| None | `-` | 0 | Permission is absent |

The three numeric digits always follow **User, Group, Other** order.

