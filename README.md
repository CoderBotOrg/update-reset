# Overlay-factory-reset
Info about overlayfs: [Arch Wiki](https://wiki.archlinux.org/index.php/Overlay_filesystem)

With overlays we can keep the root partition (overlay lowerdir) read only and an upper partition read write for modifications.
A button click at boot will delete modifications in upper file-system resulting in a factory reset.
