# Inherit mini common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
