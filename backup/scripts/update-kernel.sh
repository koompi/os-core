cp /mnt/kfs/boot/vmlinuz-kfs /mnt/kfs/boot/vmlinuz  && \
cp kmp-files/livecd.hook /mnt/kfs/etc/mkinitramfs.d && \
kernver=$(file /mnt/kfs/boot/vmlinuz-kfs | cut -d ' ' -f9) && \
chroot_run mkinitramfs -k $kernver -a livecd -o /boot/initrd-live.img && \
mv /mnt/kfs/boot/initrd-live.img /mnt/kfs/tmp/boot/initrd 