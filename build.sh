#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

DEVICE=star
DT_LINK="https://github.com/xyen8180/recovery_device_xiaomi_star"
DT_PATH=device/xiaomi/$DEVICE
SD_LINK="https://github.com/xyen8180/android_device_xiaomi_sm8350-common -b FOX_11.0"
SD_PATH=device/xiaomi/sm8350-common
echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/OrangeFox_sync && cd ~/OrangeFox_sync

echo " ===+++ Sync OrangeFox +++==="
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 11.0 --path ~/fox_11.0
cd ~/fox_11.0
git clone --depth=1 $DT_LINK $DT_PATH
git clone --depth=1 $SD_LINK $SD_PATH
git clone http://github.com/xyen8180/vendor_star vendor/xiaomi/sm8350-common/
git clone https://github.com/nebrassy/kernel_xiaomi_sm8350  kernel/xiaomi/sm8350/
chmod -R u+x *
chmod -R u+x ./*
echo " ====+++ Building OrangeFox +++==="
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
lunch twrp_${DEVICE}-eng && mka bootimage

# Upload zips & recovery.img
#echo " ===+++ Uploading Recovery +++===
cd out/target/product/$DEVICE

curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
