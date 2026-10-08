# AWS Virtual Machine & Linux Notes

## AWS Basics

**Choose region first:** EU (Ireland)

**Security Group = Firewall**


---

## How to Connect to the Virtual Machine

**Step 1:** Open Git Bash

**Step 2:** Go to the `.ssh` folder

```bash
cd .ssh
```

**Step 3:** Copy and paste the public DNS from *SSH Client* through *Instance Connect*

![alt text](../../images/DNS.png)
**Step 4:** Type `yes` and the VM is ready to go

> **Important Note:** Every time we stop and start the instance again, the public IP will change.

---


### Why Learn Linux?

- Can be lightweight
- Fast-growing, commonly used
- Most distributions are free
- Stable
- Scales well
- Works on desktop/workstation
- Often used in DevOps

### What is Linux?

- A spinoff of the Unix OS
- Can now run on very small computers
- Made up of a kernel (core OS), plus other libraries and utilities that rely on the kernel

### What is Bash?

- It is a shell
- Stands for **B**ourne **A**gain **Sh**ell

### What is a Shell?

- It interprets the commands

### How to Find the Shell We Are Using

```bash
cat /etc/shells
```

---

## Useful Notes & Commands

- `/` at the front refers to the **root directory**
- `cd ~` goes to the home directory (the `~` symbol is called a **tilde**, pronounced *TIL-duh* or *TIL-day*)
- `rm -r` removes files recursively

## Linux Commands
![alt text](../../images/cmd.png)

| Term | Path | What it is |
| --- | --- | --- |
| Root directory | `/` | Top of the whole filesystem |
| Home directory | `/home/yourname` (or `~`) (or cd)| Your personal space |
| Root user's home | `/root` | Home folder of the superuser |
