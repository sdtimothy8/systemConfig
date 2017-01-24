#!/bin/bash -f

set GRUB_FILE_PATH="/boot/grub2/grub.cfg"
echo "menuentry 'Windows 7' {
      insmod part_msdos
      insmod ntldr
      set root=(hd0,1)
      chainloader   +1
      boot
}" >> ${GRUB_FILE_PATH}
