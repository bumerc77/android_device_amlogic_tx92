#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## TEE
TARGET_HAS_TEE := false

## WIFI
BOARD_WLAN_CHIP := qca9377
TARGET_HAVE_WIFIHAL := false

## Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true

PRODUCT_PACKAGES += \
    Tx92BluetoothOverlay \
    libbt-vendor \
    bt_stack.conf \
    bt_did.conf

## Factory
PRODUCT_HOST_PACKAGES += \
    aml_image_packer

## Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi_buildin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi_buildin.rc \
    $(LOCAL_PATH)/init-files/init.vfd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.vfd.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi.rc 

## WLAN Driver
PRODUCT_PACKAGES += \
    qca9377
        
## VFD Display    
PRODUCT_PACKAGES += \
    openvfd \
    YAopenvfD
    
## Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

ifneq ($(PRODUCT_USE_SW_OMX),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif

## SOC
TARGET_AMLOGIC_SOC = gxm
TARGET_BOARD_PLATFORM := gxm
TARGET_USES_P_MODULES := true

## MTG    
include vendor/gapps_tv/arm/arm-vendor.mk
    
$(call inherit-product, device/amlogic/gx-common/gx.mk)
$(call inherit-product, vendor/amlogic/tx92/tx92-vendor.mk)
