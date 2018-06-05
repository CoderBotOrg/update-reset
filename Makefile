install:
	cp sbin/restore_boot /sbin/restore_boot
	cp sbin/init_overlay /sbin/init_overlay
	cp sbin/init_overlay_second /sbin/init_overlay_second
	cp sbin/create_overlay /sbin/create_overlay
	mkdir /etc/coderbot
	cp etc/coderbot/init_overlay.conf /etc/coderbot/init_overlay.conf
	#cp bin/tar_sig /bin/tar_sig

	chmod +x /sbin/restore_boot
	chmod +x /sbin/init_overlay
	chmod +x /sbin/init_overlay_second
	chmod +x /sbin/create_overlay
	#chmod +x /bin/tar_sig

uninstall:
	rm /sbin/restore_boot
	rm /sbin/init_overlay
	rm /sbin/init_overlay_second
	rm /sbin/create_overlay
	rm /etc/coderbot
	rm /etc/coderbot/init_overlay.conf
	#rm /bin/tar_sig