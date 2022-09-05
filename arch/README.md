Arch Linux and Awesome WM Install Notes
===================
So this install covers a fresh Arch Install with 
windows 10 duel boot. 
This is installed using UEFI instead of BIOS. 
It should work the same just without an EFI boot partition and 
the /mnt/boot mount. 

Make sure you install Windows Before Arch. That way
you don't pull your hair out.

## Table of Contents
1. [Pre Install](#preInstall)
    1. [Network Configuration](#network)
    2. [Partitioning Disks](#partition)
    3. [Formating Disk Partitioning](#format)
    4. [Mount the File System](#mount)
    5. [OPTIONAL: Change mirror list](#mirror)
2. [Installing Arch](#install)
3. [Configure the System](#config)
    1. [Change Hostname](#hostname)
    2. [Set Keyboard Layout](#keyboard)
    3. [Generate fstab](#fstab)
    4. [Setup Root Password](#root)
    5. [Setup Timezone](#time)
    6. [Setup Locale](#locale)
    7. [Install Grub (Bootloader)](#grub)
    8. [Enable dhcpcd](#dhcpcd)
    9. [Reboot Into Installed Media](#reboot)
   10. [Making Windows Visable to Grub](#windows)
4. [Post Install](#postInstall)
    1. [Installing Sudo](#sudo)
    2. [Setup User](#user)
    3. [Setup Graphics](#graphic)
    4. [Instal Build Utilities](#utils)
    5. [Install Yay (Package Manager)](#yay)
    6. [Setup Audio with Pulseaudio](#sound)
    7. [Install Neofetch](#neofetch)
    8. [Installing xorg](#xorg)
    9. [Setup Awesome (Window Manager)](#awesome)
   10. [Installing Lightdm](#slim)
5. [Startup GUI](#startx)

# Pre Installation <a name="preInstall"></a>

### 1. Network configuration <a name="network"></a>

If using Ethernet you can skip this step.

Most laptops usually come with an atheros 
wifi chipset included. If that's the case, use wifi-menu 
```{r, engine='bash', count_lines}
wifi-menu
ping 8.8.8.8
```

if not will need to use ethernet to setup wifi. 

To setup wifi download the following
```{r, engine='bash', count_lines}
pacman -S iwd
sudo systemctl enable iwd.service
sudo systemctl start iwd.service

# Add to groups to use
# groupadd wheel netdev

# Run the following to find and connect to wifi.
# Refrence the arch wiki for commands
iwctl

# after connecting check connection without ethernet connection
ping 8.8.8.8
```

### 2. Partitioning Disks <a name="partition"></a>

#### Make Swap and Linux Filesystem
partition scheme should be the following 
| partitions                                |
| :----------------------------------------:|
| efi partition created by windows          |
| linux swap should be 2x size of memory    |
| linux filesystem remaining available space |
```{r, engine='bash', count_lines}
cfdisk
```

### 3. Formating disk partitions <a name="format"></a>
the sda numbers can be different
```{r, engine='bash', count_lines}
mkfs.btrfs /dev/sda1 #linux filesystem
mkswap /dev/sda3     #linux swap
swapon /dev/sda3
```

### 4. Mount the file System <a name="mount"></a>
```{r, engine='bash', count_lines}
mount /dev/sda1 /mnt      #linux filesystem
mkdir /mnt/{boot,home}
mount /dev/sda2 /mnt/boot #this should be the EFI partition
```

### 5. Change mirror list - can skip see below <a name="mirror"></a>

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

# Installation <a name="install"></a>
Going to install archlinux base, linux and tools such as vim and vi.
```{r, engine='bash', count_lines}
pacstrap /mnt base base-devel linux linux-firmware vim vi
```
So after installing Arch, we need to configure the system and install our desktop enviroment.


# Configure the system<a name="config"></a>

### 1. Change hostname <a name="hostname"></a>
```{r, engine='bash', count_lines}
hostnamectl set-hostname archbox
```
or 

```{r, engine='bash', count_lines}
echo archbox >> /mnt/etc/hostname
```

### 2. SetKeyboard Layout <a name="keyboard"></a>
Keyboard is preset to US,so no change needed. 
However, if you want to know how to change to non-US keyboards
check out [Arch Wiki for Details.](https://wiki.archlinux.org/index.php/installation_guide#Set_the_keyboard_layout)

### 3. Generate fstab <a name="fstab"></a>
```{r, engine='bash', count_lines}
genfstab -U -p /mnt > /mnt/etc/fstab
```

### 4. Change to root and change root password<a name="root"></a>
```{r, engine='bash', count_lines}
arch-chroot /mnt /bin/bash
passwd root
```

### 5. Setting timezone<a name="time"></a>
This sets timezone assuming central time. Change according to your local timezone.
```{r, engine='bash', count_lines}
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc --utc
```

### 6. Setting locale <a name="locale"></a>
Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them.
```{r, engine='bash', count_lines}
vim /etc/locale.gen
locale-gen

touch /etc/locale.conf                       # Create config locale file
echo "LANG=en_US.UTF-8" >> /etc/locale.confi #Add our locale to config file
```

### 7. Installing Grub (Our Bootloader)<a name="grub"></a>
Make sure that your efi partition is mounted to /mnt/boot.
if not run the command `mount /dev/sda# /mnt/boot` where # is your efi boot partition number.
```{r, engine='bash', count_lines}
arch-chroot /mnt
pacman -S grub efibootmgr #Installing grub and efibootmgr

mkdir /boot/EFI/
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```

### 8. Enable dhcpcd<a name="dhcpcd"></a>  
This is to make sure your ethernet works when you boot into ur arch.
```{r, engine='bash', count_lines}
systemctl enable dhcpcd
```

### 9. Reboot into installed media<a name="reboot"></a>
umount -R unmounts the installed media recursivly. So both /mnt/home /mnt/boot and /mnt
would be unmounted.

```{r, engine='bash', count_lines}
exit
umount -R /mnt
swapoff /dev/sda3
reboot
```
On reboot windows isn't present but don't worry it will after some configuration.

### 10. Making Windows visable to grub<a name="windows"></a>
In order to make windows visable in grub bootloader you need a package called
OS-Prober. Install and set `GRUB_DISABLE_OS_PROBER` to `false`:
```{r, engine='bash', count_lines}
pacman -S os-prober
vim /etc/default/grub #UNCOMMENT GRUB_DISABLE_OS_PROBER=false
```
Now we have to update grub.cfg and reboot to check if windows appear.
```{r, engine='bash', count_lines}
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```
# Post Installation ==> Installing Awesome WM and Light Display Manager<a name="postInstall"></a>

### 1. Updating Pacman and installing sudo<a name="sudo"></a>
```{r, engine='bash', count_lines}
pacman -Syu
pacman -S sudo
```

### 2. Setup user<a name="user"></a>
```{r, engine='bash', count_lines}
groupadd sudo

useradd -m -g sudo -s /bin/bash abas
passwd abas
visudo # give user sudo privlages
```
when doing `visudo` make sure to uncomment the `%sudo` line.
Log out and login to new user; in my case abas.

### 3. Xorg utilities and video drivers<a name="graphic"></a>
xf86-video-vesa has the nvideo drivers for GTX graphic cards. IE GTX3080. 
Make sure that urs matches.
```{r, engine='bash', count_lines}
sudo pacman -S xorg xorg-server xorg-server xorg-xinit xorg-apps mesa
sudo pacman -S xf86-video-nouveau nvidia
```

### 4. Build utilities<a name="utils"></a>
```{r, engine='bash', count_lines}
sudo pacman -S git wget curl 
pacman -S multilib-devel fakeroot jshon make pkg-config autoconf automake patch
```

### 5. Installing yay and all of it's dependencies<a name="yay"></a>
```{r, engine='bash', count_lines}
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd ..
rm -rf yay
```

### 6. Pulseaudio and Alsa sound utilities <a name="sound"></a>
pacmixer is our frontend for managing our audio input/output.
```{r, engine='bash', count_lines}
yay -S alsa-lib alsa-utils alsa-oss alsa-plugins
yay -S pulseaudio
yay -S pacmixer
```

### 7. Installing neofetch <a name="neofetch"></a>
```{r, engine='bash',count_lines}
yay -S neofetch
```

### 8. Installing xorg<a name="xorg"></a>
```{r, engine='bash', count_lines}
yay -S xorg xterm xorg-twm xorg-xclock
```

### 9. Installing and setting up awesome<a name="awesome"></a>
The ttf installes are fonts for awesome.
when changing `~/.xinitrc` make it match the `.xinitrc` file on github.
```{r, engine='bash', count_lines}
yay -S awesome
yay -S ttf-droid ttf-dejavu ttf-liberation
git clone https://github.com/abasnfarah/dotfiles.git
cp ./dotfiles/arch/.xinitrc ~/.xinitrc
mkdir -p .config/awesome
cp /etc/xdg/awesome/rc.lua .config/awesome/
cp -r /usr/share/awesome/* .config/awesome/
sudo yay -S rxvt-unicode pcmanfm
```

### 10. Installing slim as our login manager <a name="slim"></a>
```{r, engine='bash', count_lines}
yay -S slim
git clone https://github.com/adi1090x/slim_themes
cp -r slim_themes/themes/* /usr/share/slim/themes/
rd slim_themes
systemctl enable slim.service
```


# Start up your GUI to see the magic<a name="startx"></a>
```{r, engine='bash', count_lines}
startx
```

The next steps from here will be to change default terminal to termite.
Installing oh-my-zsh and configuring vim. 
Theming and adding extra coconut oil to the rest of our build.

