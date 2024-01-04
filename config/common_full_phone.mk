# Inherit full common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Atlantis LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/atlantis/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/atlantis/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/atlantis/config/telephony.mk)
