# Linux Redirection and Appending

1. **What does `>` do?**

   `>` redirects a command’s standard output into a file. If the file already exists, it replaces its contents. If the file does not exist, it creates it.

   Example:

   ```bash
   echo "Hello" > msg.txt
   ```

   `msg.txt` now contains:

   ```text
   Hello
   ```

2. **How is appending different?**

   Appending uses `>>` to add output to the end of a file while keeping its existing contents. It also creates the file if it does not exist.

   Example:

   ```bash
   echo "Welcome" >> msg.txt
   ```

   After the previous example, `msg.txt` now contains:

   ```text
   Hello
   Welcome
   ```

3. **Give an example of a command that appends to a file.**

   ```bash
   ls >> msg.txt
   ```

   This adds the current directory listing to the end of `msg.txt` without deleting its existing contents.

## Quick comparison

| Operator | Action | Existing contents |
|---|---|---|
| `>` | Redirect standard output to a file | Replaced |
| `>>` | Append standard output to a file | Kept; new output added at the end |

Both operators redirect **standard output**, not error messages, by default.
