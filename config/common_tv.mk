# Inherit common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common.mk)

# Inherit Atlantis atv device tree
$(call inherit-product, device/atlantis/atv/atlantis_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

PRODUCT_PACKAGE_OVERLAYS += vendor/atlantis/overlay/tv
