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
| linux filesystem remaining available space |
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
Going to install archlinux base, linux and tools such as vim and vi.
```{r, engine='bash', count_lines}
pacstrap /mnt base base-devel linux linux-firmware vim vi
```
So after this the Arch is installed.
We need to configure the system and install our desktop enviroment.


# Configure the system

### change hostname
```{r, engine='bash', count_lines}
hostnamectl set-hostname archbox
```
or 

```{r, engine='bash', count_lines}
echo archbox >> /mnt/etc/hostname
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

### Setting timezone
This sets timezone assuming central time. Change according to your local timezone.
```{r, engine='bash', count_lines}
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc --utc
```

### Setting locale 
Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them.
```{r, engine='bash', count_lines}
vim /etc/locale.gen
locale-gen

touch /etc/locale.conf                       # Create config locale file
echo "LANG=en_US.UTF-8" >> /etc/locale.confi #Add our locale to config file
```

### Installing Grub (Our Bootloader)
Make sure that your efi partition is mounted to /mnt/boot.
if not run the command `mount /dev/sda# /mnt/boot` where # is your efi boot partition number.
```{r, engine='bash', count_lines}
arch-chroot /mnt
pacman -S grub efibootmgr #Installing grub and efibootmgr

mkdir /boot/EFI/
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
```

### Enable dhcpd
This is to make sure your ethernet works when you boot into ur arch.
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

### setup user
```{r, engine='bash', count_lines}
groupadd sudo

useradd -m -g sudo -s /bin/bash abas
passwd abas
visudo # give user sudo privlages
```
when doing `visudo` make sure to uncomment the `%sudo` line.
Log out and login to new user; in my case abas.

### Xorg utilities and mesa 
xf86-video-vesa has the nvideo drivers for GTX graphic cards. IE GTX3080. 
Make sure that urs matches.
```{r, engine='bash', count_lines}
sudo pacman -S xorg xorg-server mesa
sudo pacman -S xf86-video-vesa
```

### build utilities
```{r, engine='bash', count_lines}
sudo pacman -S git wget curl 
pacman -S multilib-devel fakeroot jshon make pkg-config autoconf automake patch
```

### installing yay and all of it's dependencies
```{r, engine='bash', count_lines}
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd ..
rm -rf yay
```

### Pulseaudio and Alsa sound utilities 
pacmixer is our frontend for managing our audio input/output.
```{r, engine='bash', count_lines}
yay -S alsa-lib alsa-utils alsa-oss alsa-plugins
yay -S pulseaudio
yay -S pacmixer
```

### Installing neofetch 
```{r, engine='bash',count_lines}
yay -S neofetch
```

### installing xorg
```{r, engine='bash', count_lines}
yay -S xorg xterm xorg-twm xorg-xclock
```

### installing and setting up awesome
The ttf installes are fonts for awesome.
when changing `~/.xinitrc` make it match the `.xinitrc` file on github.
```{r, engine='bash', count_lines}
yay -S awesome
yay -S tff-droid tff-dejavu tff-liberation
git clone https://github.com/abasnfarah/dotfiles.git
cp ./dotfiles/arch/.xinitrc ~/.xinitrc
mkdir -p .config/awesome
cp /etc/xdg/awesome/rc.lua .config/awesome/
cp -r /usr/share/awesome/* .config/awesome/
sudo yay -S rxvt-unicode pcmanfm
```

### installing lightDm as our login manager 
```{r, engine='bash', count_lines}
yay -S lightdm
yay -S lightdm-webkit-theme-litarvin #This is our greeter
systemctl enable lightdm
```


# Start up your GUI to see the magic
```{r, engine='bash', count_lines}
startx
```

The next steps from here will be to change default terminal to termite.
Installing oh-my-zsh and configuring vim. 
Theming and adding extra coconut oil to the rest of our build.

