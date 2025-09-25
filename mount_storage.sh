#!/bin/bash
# Script ini akan dijalankan setiap container start untuk memastikan /dev/sda1 ter-mount ke /mnt/storage

# Pastikan direktori mount point ada
sudo mkdir -p /mnt/storage

# Cek apakah sudah ter-mount
mountpoint -q /mnt/storage
if [ $? -ne 0 ]; then
    sudo mount /dev/sda1 /mnt/storage
fi
