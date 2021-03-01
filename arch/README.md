Arch Linux and Awesome WM Install Notes
===================
So this install covers a fresh Arch Install with 
windows ten duel boot. This is installed using UEFI 
Firmware instead of BIOS firmware. It should work
the same just without an EFI boot partition and 
/mnt/boot mount. 

Make sure you install Windows Before Arch. That way
you don't pull your hair out.

# Pre Installation

### 1. Network configuration
If using Ethernet you can skip this step.

Most laptops usually come with an atheros 
wifi chipset included. If thats the case
use wifi-menu then
```{r, engine='bash', count_lines}
wifi-menu
ping 8.8.8.8
```

### 2. Partitioning disks
#### Make Swap and Linux Filesystem
partition scheme should be the following 
| partitions                                |
| :----------------------------------------:|
| efi partition created by windows          |
| linux swap should be 2x size of memory    |
| linux filesystem remainig available space |
```{r, engine='bash', count_lines}
cfdisk
```

### 3. Formating disk partitions
the sda numbers can be different
```{r, engine='bash', count_lines}
mkfs.btrfs /dev/sda1 #linux filesystem
mkswap /dev/sda3     #linux swap
swapon /dev/sda3
```

### 4. Mount the file System
```{r, engine='bash', count_lines}
mount /dev/sda1 /mnt      #linux filesystem
mkdir /mnt/{boot,home}
mount /dev/sda2 /mnt/boot #this should be the EFI partition
```

### 5. Change mirror list - can skip see below

#### Top 3 mirrors
| Mirrors               |
| :--------------------:|
| mirrors.unixheads.org |
| mirror.neotuli.net    |
| mirror.rit.edu        |

However this step is largely useless. 
Once connected to internet `reflector` will update mirror list automaticallly

To change enter command:
```{r, engine='bash', count_lines}
vim /etc/pacman.d/mirrorlist
```

# Installation 
```{r, engine='bash', count_lines}
pacstrap /mnt base base-devel
```
So after this the Arch is installed.
We need to configure the system and install Desktop enviroment.


# Configure the system

### change hostname
```{r, engine='bash', count_lines}
hostnamectl set-hostname archbox
```
or 

```{r, engine='bash', count_lines}
echo Arch >> /mnt/etc/hostname
```

### SetKeyboard Layout
Keyboard is preset to US so no change needed. However, 
if you want to know how to change to non-US keyboards
check out [Arch Wiki for Details.](https://wiki.archlinux.org/index.php/installation_guide#Set_the_keyboard_layout)

### generate fstab
```{r, engine='bash', count_lines}
genfstab -U -p /mnt > /mnt/etc/fstab
```

### Change to root and change root password
```{r, engine='bash', count_lines}
arch-chroot /mnt /bin/bash
passwd root
```

### Setting locale and timezone
Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them.
```{r, engine='bash', count_lines}
vim /etc/locale.gen
locale-gen
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc --utc
```

### Installing Grub
logout then do this
```{r, engine='bash', count_lines}
pacstrap /mnt grub
```
log in to arch root then do this
```{r, engine='bash', count_lines}
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot --recheck /dev/sda
```

### Enable dhcpd
```{r, engine='bash', count_lines}
systemctl enable dhcpcd
```

### Reboot into installed media
umount -R unmounts the installed media recursivly. So both /mnt/home /mnt/boot and /mnt
would be unmounted.

```{r, engine='bash', count_lines}
exit
umount -R /mnt
swapoff /dev/sda3
reboot
```
On reboot windows isn't present but don't worry it will after some configuration.

### Making Windows visable to grub
In order to make windows visable in grub bootloader you need a package called
OS-Prober. Install:
```{r, engine='bash', count_lines}
pacman -S os-prober
```
Now we have to update grub.cfg and reboot to check if windows appear.
```{r, engine='bash', count_lines}
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```
# Post Installation ==> Installing Awesome WM and Light Display Manager

### Updating Pacman and installing sudo
```{r, engine='bash', count_lines}
pacman -Syu
pacman -S sudo
```

### Enable 64-bit compatability
```{r, engine='bash', count_lines}
vim /etc/pacman.conf # enable multilib
pacman -Syu
```

### setup user
```{r, engine='bash', count_lines}
useradd -m -g users -s /bin/bash abas
passwd abas
visudo # give user sudo privlages
```
Log out and login to new user; in my case abas.

### Xorg utilities and mesa 
```{r, engine='bash', count_lines}
sudo pacman -S xorg-server xorg-xinit mesa
sudo pacman -S xf86-video-vesa
```
### Alsa sound utilities AND tff
```{r, engine='bash', count_lines}
sudo pacman -S alsa-lib alsa-utils alsa-oss alsa-plugins
sudo pacman -S tff-droid tff-dejavu tff-liberation
sudo pacman -S git wget yajl
```

### build utilities
```{r, engine='bash', count_lines}
pacman -S multilib-devel fakeroot jshon make pkg-config autoconf automake patch
wget http://aur.archlinux.org/packages/pa/packer/packer.tar.gz
tar zxvf packer.tar.gz
cd packer && makepkg
pacman -U packer<TAB>
```

### installing xorg
```{r, engine='bash', count_lines}
pacman -S xorg xterm xorg-twm xorg-xclock
```

### installing yay and all of it's dependencies
```{r, engine='bash', count_lines}
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg -ci
cd ../yaourt
makepkg -ci
```

### Installing neofetch 
```{r, engine='bash',count_lines}
yay -S neofetch
```

### installing slim login manager
```{r, engine='bash', count_lines}
sudo pacman -S slim
sudo systemctl enable slim.service

```

### installing and setting up awesome
```{r, engine='bash', count_lines}
sudo pacman -S awesome
cp /etc/X11/xinit/xinitrc ~/.xinitrc
vim ~/.xinitrc
mkdir -p .config/awesome
cp /etc/xdg/awesome/rc.lua .config/awesome/
cp -r /usr/share/awesome/* .config/awesome/
sudo pacman -S rxvt-unicode pcmanfm
```

# Start up your GUI to see the magic
```{r, engine='bash', count_lines}
startx
```
