SRCDIR=src/
DESTDIR=out/

install:
	@echo installing...
	mkdir -p $(DESTDIR)sbin
	cp $(SRCDIR)sbin/restore_boot $(DESTDIR)sbin/restore_boot
	cp $(SRCDIR)sbin/backup_boot $(DESTDIR)sbin/backup_boot
	cp $(SRCDIR)sbin/init_overlay $(DESTDIR)sbin/init_overlay
	cp $(SRCDIR)sbin/init_overlay_second $(DESTDIR)sbin/init_overlay_second
	cp $(SRCDIR)sbin/create_overlay $(DESTDIR)sbin/create_overlay
	cp $(SRCDIR)sbin/enable_overlay $(DESTDIR)sbin/enable_overlay
	cp $(SRCDIR)sbin/merge_overlay $(DESTDIR)sbin/merge_overlay
	cp $(SRCDIR)sbin/coderbot_update $(DESTDIR)sbin/coderbot_update

	mkdir -p $(DESTDIR)etc/coderbot
	cp $(SRCDIR)etc/coderbot/init_overlay.conf $(DESTDIR)etc/coderbot/init_overlay.conf
		
	chmod +x $(DESTDIR)sbin/restore_boot
	chmod +x $(DESTDIR)sbin/backup_boot
	chmod +x $(DESTDIR)sbin/init_overlay
	chmod +x $(DESTDIR)sbin/init_overlay_second
	chmod +x $(DESTDIR)sbin/create_overlay
	chmod +x $(DESTDIR)sbin/enable_overlay
	chmod +x $(DESTDIR)sbin/merge_overlay
	chmod +x $(DESTDIR)sbin/coderbot_update
	@echo "to enable add init=/sbin/init_overlay to /boot/cmdline.txt"
	@echo "Remember to add /etc/coderbot/version and /etc/coderbot/update_status"

uninstall:
	@echo uninstall...
	rm $(DESTDIR)sbin/restore_boot
	rm $(DESTDIR)sbin/backup_boot
	rm $(DESTDIR)sbin/init_overlay
	rm $(DESTDIR)sbin/init_overlay_second
	rm $(DESTDIR)sbin/create_overlay
	rm $(DESTDIR)sbin/enable_overlay
	rm $(DESTDIR)sbin/merge_overlay
	rm $(DESTDIR)etc/coderbot/init_overlay.conf
	rm $(DESTDIR)etc/coderbot/boot.tar.xz
	rm $(DESTDIR)etc/coderbot/boot.sig
	rm $(DESTDIR)etc/coderbot/coderbot.pub
	rm $(DESTDIR)sbin/coderbot_update
	rmdir $(DESTDIR)etc/coderbot

desktop:
	@echo installing desktop
	cp $(SRCDIR)bin/part_overlay $(DESTDIR)
	cp $(SRCDIR)bin/create_update $(DESTDIR)
	cp $(SRCDIR)bin/tar_sig $(DESTDIR)

	chmod +x $(DESTDIR)part_overlay
	chmod +x $(DESTDIR)create_update
	chmod +x $(DESTDIR)tar_sig

desktop-uninstall:
	@echo uninstalling desktop
	rm $(DESTDIR)part_overlay
	rm $(DESTDIR)create_update
	rm $(DESTDIR)tar_sig

