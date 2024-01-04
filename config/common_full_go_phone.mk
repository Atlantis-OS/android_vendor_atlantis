# Set Atlantis specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common_full_phone.mk)
