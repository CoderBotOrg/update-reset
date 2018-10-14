# Overlay-factory-reset
## Overview
Info about overlayfs: [Arch Wiki](https://wiki.archlinux.org/index.php/Overlay_filesystem)

With overlays we can keep the root partition (overlay lowerdir) read only and an upper partition read write for modifications.
A button click at boot will delete modifications in upper file-system resulting in a factory reset.

## About Impementation
Overlay is mounted by an init script. It mounts upper file-system, merge rootfs and upper into an overlayfs making this the new rootfs . Then calls systemd.

If the button is pressed it cleans the upper fs.

## Setup
### Create of the upper partition or use part_overlay
#### Partition Setup
##### Check fs usage with:  
```
df -h
```
File system Dim. Usati Dispon. Uso% Montato su  
/dev/mmcblk0p1              42M   22M     20M  53% /boot  
/dev/mmcblk0p2             6,3G  4,2G    2,1G  33% /  

#### Resize /dev/mmcblk0p2 filesystem to 3G:  
```
sudo e2fsck -f /dev/mmcblk0p2
sudo resize2fs /dev/mmcblk0p2 3G
```

#### Resize /dev/mmcblk0p2 partition to 3G:
```
sudo fdisk /dev/mmcblk0
```
Type p to list partition, take note of /dev/mmcblk0p2's Start sector  
Type d, then 2 to delete second partition  
Type n, then p for primary, then 2 to recreate the second partition  
Insert old /dev/mmcblk0p2's Start sector, then type +3G as last sector to obtain a 3GB partition
Do NOT remove fs signature  
Type w to write changes  
Type q to exit  

#### Create new partition:  
```
sudo fdisk /dev/mmcblk0
```
Type p to list  
Type n, then p, then 3 to create 3rd partition  
Choose first sector increasing by 1 /dev/mmcblk0p2's End sector, press ENTER to accept last sector  
Type w  
Type q  

#### Create fs:  
```
sudo /sbin/create_overlay
```
or  
```
sudo mkfs -t ext4 -L overlay /dev/mmcblk0p3
sudo mount /dev/mmcblk0p3 /mnt
sudo mkdir /mnt/upper /mnt/work
sudo umount /mnt
```
### Boot raspberry pi
### Install scripts
```
git clone https://github.com/CoderBotOrg/overlay-factory-reset
cd overlay-factory-reset
sudo make install DESTDIR=/
```

### Install desktop scripts
```
git clone https://github.com/CoderBotOrg/overlay-factory-reset
cd overlay-factory-reset
sudo make desktop DESTDIR=.
```

### Enable overlay
#### Add this line to /etc/fstab or use enable_overlay:
```
/dev/mmcblk0p3	/overlay	ext4	defaults,noatime,nofail	  0	  3
```

#### Create mountpoints  or use enable_overlay:
Overlay:
```
sudo mkdir /overlay
```
ROM:
```
sudo mkdir /rom
```

### Add this line to /boot/cmdline.txt  or use enable_overlay:
```
init=/sbin/init_overlay
```

### Restore boot partition
To be correctly restored boot partition should be backed up in /etc/coderbot/boot.tar.xz with a optional sigfile /etc/coderbot/boot.sig (you can use tar_sig from update).  
Whitout signature:  
```
tar cfvJ /etc/coderbot/boot.tar.xz -C /boot .
```
or simply
```
backup_boot
```
/sbin/restore_boot formats boot partition, verify the backup signature (if present) with /etc/coderbot/coderbot.pub as keyring, then restore it to boot.  
To export public key:
```
gpg --output coderbot.pub --export KEY
```
Then put it in /etc/coderbot/coderbot.pub

### Uninstall scripts
```
git clone https://github.com/CoderBotOrg/overlay-factory-reset
cd overlay-factory-reset
sudo make uninstall DESTDIR=/
```

### Uninstall desktop scripts
```
git clone https://github.com/CoderBotOrg/overlay-factory-reset
cd overlay-factory-reset
sudo make desktop-uninstall DESTDIR=.
```

### TODO
apt shouldn't update /boot/cmdline.txt
