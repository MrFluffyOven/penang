#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# define hardware platform
PRODUCT_PLATFORM := holi

# A/B support
AB_OTA_UPDATER := true

LOCAL_PATH := device/motorola/penang

# A/B
AB_OTA_UPDATER := true
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.holi

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.holi \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

    # fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QCOM
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Shipping level
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Copy modules for depmod
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.ko,$(LOCAL_PATH)/prebuilt,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1)    

