# Overlay-factory-reset
## Overview
Info about overlayfs: [Arch Wiki](https://wiki.archlinux.org/index.php/Overlay_filesystem)

With overlays we can keep the root partition (overlay lowerdir) read only and an upper partition read write for modifications.
A button click at boot will delete modifications in upper file-system resulting in a factory reset.

## About Impementation
Overlay is mounted by an init script. It mounts upper file-system, merge rootfs and upper into an overlayfs making this the new rootfs . Then calls systemd.

If the button is pressed it cleans the upper fs.

## Setup
### Creation of the upper partition
#### Partition Setup
##### Check fs usage with:  
```
df -h
```
File system Dim. Usati Dispon. Uso% Montato su  
/dev/mmcblk0p1              42M   22M     20M  53% /boot  
/dev/mmcblk0p2             6,3G  4,2G    2,1G  33% /  

#### Resize /dev/mmcblk0p2 to 3G:
```
sudo fdisk /dev/mmcblk0
```
Type p to list partition  
Type d, then 2 to delete second partition  
Type n, then p for primary, then 2 to recreate the second partition  
Press ENTER to accept the first sector, then type +3G as last sector to obtain a 3GB fs  
Type w to write changes  
Type q to exit  

#### Resize fs:  
```
sudo e2fsck -f /dev/mmcblk0p2
sudo resize2fs /dev/mmcblk0p2
```

#### Create new partition:  
```
sudo fdisk /dev/mmcblk0
```
Type p to list  
Type n, then p, then 3 to create 3rd partition  
Press ENTER twice to accept first and last sector  
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
#### Add overlay to fstab:
```
sudo echo "/dev/mmcblk0p3	/overlay	ext4	defaults,noatime,nofail	  0	  3" >> /etc/fstab
```

### Set init
Change init by adding init=/sbin/init_overlay to /boot/cmdline.txt.
