# Set Atlantis specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common_mini_phone.mk)
