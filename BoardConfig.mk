#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Inherit proprietary blobs
-include vendor/xiaomi/sm8350-common/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/star

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := star

# HIDL
ODM_MANIFEST_FILES := $(DEVICE_PATH)/manifest.xml

# OTA assert
TARGET_OTA_ASSERT_DEVICE := star
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_QCOM_DECRYPTION := true