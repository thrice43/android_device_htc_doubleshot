$(call inherit-product, device/htc/doubleshot/full_doubleshot.mk)

PRODUCT_RELEASE_NAME := MyTouch_4g_Slide

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_doubleshot BUILD_FINGERPRINT=htc_europe/htc_doubleshot/doubleshot:4.0.3/IML74K/309896.3:user/release-keys PRIVATE_BUILD_DESC="3.32.401.3 CL309896 release-keys"

PRODUCT_NAME := cm_doubleshot
PRODUCT_DEVICE := doubleshot
