#!/bin/sh
# VipShare Plugin Installer
# Version: 1.0
# Author: MNASR

echo "Starting installation..."

sleep 3

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/VipShare ]; then
    echo "> Removing previous installation..."
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/VipShare
fi

status_file='/var/lib/opkg/status'
package_name='enigma2-plugin-extensions-vipshare'

if [ -f "$status_file" ] && grep -q "$package_name" "$status_file"; then
    echo "> Removing old opkg package..."
    opkg remove "$package_name"
fi

sleep 2

echo "> Downloading VipShare..."
wget -q -O /tmp/VipShare.tar.gz "https://github.com/popking159/VipShare/raw/refs/heads/main/VipShare.tar.gz"

if [ $? -ne 0 ]; then
    echo "ERROR: Download failed!"
    exit 1
fi

echo "> Installing..."
tar -xzf /tmp/VipShare.tar.gz -C /
if [ $? -ne 0 ]; then
    echo "ERROR: Extraction failed!"
    exit 1
fi

rm -f /tmp/VipShare.tar.gz
sleep 2

sync
echo "========================================================="
echo "===                      FINISHED                     ==="
echo "===                       MNASR                       ==="
echo "========================================================="
echo "            VipShar installed successfully!              "
echo "========================================================="

exit 0
