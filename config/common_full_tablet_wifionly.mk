$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Atlantis LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/atlantis/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/atlantis/overlay/dictionaries
