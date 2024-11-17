#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amlogic/tx92

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

## Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := tx92

## DTB
TARGET_DTB_NAME := gxm_q200_tx92_3g

# GPU
TARGET_AMLOGIC_GPU_ARCH := midgard

# Kernel
BOARD_KERNEL_CMDLINE += --cmdline "root=/dev/mmcblk0p18"
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=d0074000.emmc hdmitx=cecf3

## Policy
BOARD_VENDOR_SEPOLICY_DIRS += device/amlogic/tx92/sepolicy/vendor

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Wi-Fi
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_DRIVER_SOCKET_IFACE := wlan0
WPA_SUPPLICANT_VERSION := VER_0_8_X

include vendor/amlogic/tx92/BoardConfigVendor.mk

include device/amlogic/gx-common/BoardConfigCommon.mk
