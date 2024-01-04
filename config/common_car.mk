# Inherit common Atlantis stuff
$(call inherit-product, vendor/atlantis/config/common.mk)

# Inherit Atlantis car device tree
$(call inherit-product, device/atlantis/car/atlantis_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
