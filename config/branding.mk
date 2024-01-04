# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
# Copyright (C) 2021 AtlantisOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
ATLANTIS_CODENAME := NAMCHE
ATLANTIS_NUM_VER := 1.0

TARGET_PRODUCT_SHORT := $(subst atlantis_,,$(ATLANTIS_BUILD_TYPE))

ATLANTIS_BUILD_TYPE ?= unofficial

# Only include Updater for official  build
ifeq ($(filter-out official,$(ATLANTIS_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/atlantis/prebuilt/common/etc/init/init.atlantis-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.atlantis-updater.rc
endif

# Sign builds if building an official build
ifeq ($(filter-out official,$(ATLANTIS_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
ATLANTIS_BUILD_VERSION := $(ATLANTIS_NUM_VER)-$(ATLANTIS_CODENAME)
ATLANTIS_VERSION := $(ATLANTIS_BUILD_VERSION)-$(ATLANTIS_BUILD)-$(ATLANTIS_BUILD_TYPE)-$(BUILD_TIME)-$(BUILD_DATE)
ROM_FINGERPRINT := atlantis/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
ATLANTIS_DISPLAY_VERSION := $(ATLANTIS_VERSION)
RELEASE_TYPE := $(ATLANTIS_BUILD_TYPE)
