SRCDIR=src/
DESTDIR=out/

install:
	@echo installing...
	mkdir -p $(DESTDIR)sbin
	cp $(SRCDIR)sbin/restore_boot $(DESTDIR)sbin/restore_boot
	cp $(SRCDIR)sbin/init_overlay $(DESTDIR)sbin/init_overlay
	cp $(SRCDIR)sbin/init_overlay_second $(DESTDIR)sbin/init_overlay_second
	cp $(SRCDIR)sbin/create_overlay $(DESTDIR)sbin/create_overlay
	
	mkdir -p $(DESTDIR)etc/coderbot
	cp $(SRCDIR)etc/coderbot/init_overlay.conf $(DESTDIR)etc/coderbot/init_overlay.conf
	
	#mkdir -p $(DESTDIR)bin
	#cp $(SRCDIR)bin/tar_sig $(DESTDIR)bin/tar_sig
	
	chmod +x $(DESTDIR)sbin/restore_boot
	chmod +x $(DESTDIR)sbin/init_overlay
	chmod +x $(DESTDIR)sbin/init_overlay_second
	chmod +x $(DESTDIR)sbin/create_overlay
	#chmod +x $(DESTDIR)bin/tar_sig
	@echo "to enable add init=/sbin/init_overlay to /boot/cmdline.txt"

uninstall:
	@echo uninstall...
	rm $(DESTDIR)sbin/restore_boot
	rm $(DESTDIR)sbin/init_overlay
	rm $(DESTDIR)sbin/init_overlay_second
	rm $(DESTDIR)sbin/create_overlay
	rm $(DESTDIR)bin/tar_sig
	rm $(DESTDIR)etc/coderbot/init_overlay.conf
	rm $(DESTDIR)etc/coderbot/boot.tar.xz
	rm $(DESTDIR)etc/coderbot/boot.sig
	rm $(DESTDIR)etc/coderbot/coderbot.pub
	rmdir $(DESTDIR)etc/coderbot

desktop:
	@echo installing desktop
	cp $(SRCDIR)bin/tar_sig $(DESTDIR)

desktop-uninstall:
	@echo uninstalling desktop
	rm $(DESTDIR)tar_sig