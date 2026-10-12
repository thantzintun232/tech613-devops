
# Linux Data Streams and Redirection
1. **What is a stream in Linux?**

   A stream is a flow of data entering or leaving a program.

2. **What are the three data streams?**

   | Stream | Number | Purpose | Usual destination/source |
   |---|---|---|---|
   | Standard input (`stdin`) | 0 | Input entering a program | Keyboard |
   | Standard output (`stdout`) | 1 | Normal results | Terminal |
   | Standard error (`stderr`) | 2 | Error messages | Terminal |

3. **Create `new.txt` and run `ls missing_directory new.txt`. What happens?**

   ```bash
   touch new.txt
   ls missing_directory new.txt
   ```

   Assuming `missing_directory` does not exist, `new.txt` is printed to stdout and the “No such file or directory” error is printed to stderr. Both appear in the terminal, but they are separate streams.

4. **How can we direct each output stream to a file, one at a time?**

   Redirect stdout:

   ```bash
   ls missing_directory new.txt > output.txt
   ```

   Normal output goes into `output.txt`; the error remains in the terminal.

   Redirect stderr:

   ```bash
   ls missing_directory new.txt 2> errors.txt
   ```

   Errors go into `errors.txt`; normal output remains in the terminal.

5. **How can we direct both output streams to separate files?**

   ```bash
   ls missing_directory new.txt > output.txt 2> errors.txt
   ```

   Stdout goes into `output.txt` and stderr goes into `errors.txt`.

6. **Which stream is redirected by default when using `>`?**

   Standard output (stdout, 1). These commands mean the same thing:

   ```bash
   ls > output.txt
   ls 1> output.txt
   ```

7. **How can we direct both output streams to the same file in one command?**

   ```bash
   ls missing_directory new.txt > all_output.txt 2>&1
   ```

   `> all_output.txt` redirects stdout to the file. `2>&1` makes stderr use stdout’s current destination. The order matters: put the file redirection first.

   Bash also supports this shorter form:

   ```bash
   ls missing_directory new.txt &> all_output.txt
   ```

8. **How can we append both output streams instead of replacing the file content?**

   ```bash
   ls missing_directory new.txt >> all_output.txt 2>&1
   ```

   `>>` adds output to the end of the file. `>` replaces existing content. Both create the file if it does not exist.

9. **How can we read the saved output?**

   ```bash
   cat output.txt
   cat errors.txt
   cat all_output.txt
   ```

