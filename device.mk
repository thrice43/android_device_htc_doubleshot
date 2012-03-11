#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

## recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/pyramid/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/pyramid/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/pyramid/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/pyramid/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/pyramid/recovery/sbin/htcbatt:recovery/root/sbin/htcbatt

## ramdisk stuffs
PRODUCT_COPY_FILES += \
    device/htc/pyramid/prebuilt/init:root/init \
    device/htc/pyramid/init.pyramid.rc:root/init.pyramid.rc \
    device/htc/pyramid/ueventd.pyramid.rc:root/ueventd.pyramid.rc

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/htc/pyramid/pyramid-vendor.mk)

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

## overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# GPS and Light
PRODUCT_PACKAGES += \
    gps.pyramid \
    lights.pyramid

## dsp Audio
PRODUCT_COPY_FILES += \
    device/htc/pyramid/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/pyramid/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/pyramid/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/pyramid/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/pyramid/dsp/CodecDSPID_NEL.txt:system/etc/CodecDSPID_NEL.txt \
    device/htc/pyramid/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/pyramid/dsp/IOTable.txt:system/etc/IOTable.txt \
    device/htc/pyramid/dsp/IOTable_NEL.txt:system/etc/IOTable_NEL.txt \
    device/htc/pyramid/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/pyramid/dsp/soundimage/Sound_FM_HP.txt:system/etc/soundimage/Sound_FM_HP.txt \
    device/htc/pyramid/dsp/soundimage/Sound_FM_SPK.txt:system/etc/soundimage/Sound_FM_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_MFG.txt:system/etc/soundimage/Sound_Original_MFG.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original.txt:system/etc/soundimage/Sound_Phone_Original.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP_NEL.txt:system/etc/soundimage/Sound_Phone_Original_HP_NEL.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP_WB.txt:system/etc/soundimage/Sound_Phone_Original_HP_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_NEL.txt:system/etc/soundimage/Sound_Phone_Original_NEL.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC_Voda.txt:system/etc/soundimage/Sound_Phone_Original_REC_Voda.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK_NEL.txt:system/etc/soundimage/Sound_Phone_Original_SPK_NEL.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK_Voda.txt:system/etc/soundimage/Sound_Phone_Original_SPK_Voda.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_WB.txt:system/etc/soundimage/Sound_Phone_Original_WB.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Voice_record.txt:system/etc/soundimage/Sound_Rec_Voice_record.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_mono.txt:system/etc/soundimage/Sound_Rec_mono.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/pyramid/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg

# keylayouts
PRODUCT_COPY_FILES += \
    device/htc/pyramid/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/pyramid/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/pyramid/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl\
    device/htc/pyramid/keylayout/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl \
    device/htc/pyramid/keylayout/pyramid-keypad.kl:system/usr/keylayout/pyramid-keypad.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/pyramid/keychars/pyramid-keypad.kcm:system/usr/keychars/pyramid-keypad.kcm

# idc
PRODUCT_COPY_FILES += \
    device/htc/pyramid/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc \
    device/htc/pyramid/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# HTC BT Audio tune
PRODUCT_COPY_FILES += device/htc/pyramid/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# QC thermald config
PRODUCT_COPY_FILES += device/htc/pyramid/configs/thermald.conf:system/etc/thermald.conf

# misc
PRODUCT_COPY_FILES += \
    device/htc/pyramid/vold.fstab:system/etc/vold.fstab

# Kernel and modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/pyramid/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/htc/pyramid/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/pyramid/prebuilt/kineto_gan.ko:system/lib/modules/kineto_gan.ko

# common msm8660 configs
$(call inherit-product, device/htc/msm8660-common/msm8660.mk)

## htc audio settings
$(call inherit-product, device/htc/pyramid/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/pyramid/pyramid-vendor.mk)
