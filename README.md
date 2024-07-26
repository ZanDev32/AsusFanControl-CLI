# AsusFanControl-CLI
A Simple CLI Fan Control tool for ASUS Laptop written in BASH. Only been tested in ASUS X453SA on EndeavoursOS. This tool using ```asus-nb-wmi``` kernel module which is included in the Linux kernel and is loaded automatically on ASUS laptops.  It will only allow to control a single fan and if there is a second fan you will not have any controls over it. Note that blacklisting this module will prevent keyboard backlight to work. Read more at [Arch Wiki](https://wiki.archlinux.org/title/Fan_speed_control#ASUS_laptops)

### Installing from source

*This method works for any unix-like operating system and is a baseline for porting efforts.*

Install dependencies then copy-paste this command:

```sh
git clone "https://github.com/ZanDev32/AsusFanControl-CLI"
sudo cp AsusFanControl-CLI/fanspdctl /usr/local/bin
rm -rf AsusFanControl-CLI
```

### Uninstall
```sh
sudo rm "/usr/local/bin/fanspdctl"
```

### dependencies
- Bash
- That all ᗜ˰ᗜ
