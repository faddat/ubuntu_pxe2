#!/bin/bash
#This script will place any changes you make to the preseed.conf file found in this folder into the preseed file in initrd.gz.
#All you now need do is edit that preseed.conf and run this script.
#This script also refreshes initrd.gz each time it is run.
rm initrd.gz
wget http://opensource.xtdv.net/ubuntu/dists/wily/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz
mkdir irmod
cd irmod
gzip -d < ../initrd.gz | cpio --extract --verbose --make-directories --no-absolute-filenames
cp ../preseed.cfg preseed.cfg
find . | cpio -H newc --create --verbose | gzip -9 > ../initrd.gz
cd ../
rm -rf irmod
echo "Your preseed.cfg has been added to the initrd.gz and you may now type ./ubuntu.sh in order to pxe boot ubuntu with your custom preseed file "
