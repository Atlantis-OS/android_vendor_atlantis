# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# AtlantisOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.atlantis.base.codename=$(ATLANTIS_CODENAME) \
    ro.atlantis.base.version=$(ATLANTIS_NUM_VER) \
    ro.atlantis.build.version=$(ATLANTIS_BUILD_VERSION) \
    ro.atlantis.build.date=$(BUILD_DATE) \
    ro.atlantis.buildtype=$(ATLANTIS_BUILD_TYPE) \
    ro.atlantis.display.version=$(ATLANTIS_DISPLAY_VERSION) \
    ro.atlantis.fingerprint=$(ROM_FINGERPRINT) \
    ro.atlantis.version=$(ATLANTIS_VERSION) \
    ro.modversion=$(ATLANTIS_VERSION)
