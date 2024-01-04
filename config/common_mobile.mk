# Inherit common mobile Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_ATLANTIS_CHARGER),false)
PRODUCT_PACKAGES += \
    atlantis_charger_animation \
    atlantis_charger_animation_vendor
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
