# Copyright (C) 2018-23 The AtlantisOS Project
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

#Atlantis OS Versioning :
ATLANTIS_MOD_VERSION = Fourteen-Alpha

ifndef ATLANTIS_BUILD_TYPE
    ATLANTIS_BUILD_TYPE := COMMUNITY
endif

# Test Build Tag
ifeq ($(ATLANTIS_TEST),true)
    ATLANTIS_BUILD_TYPE := DEVELOPER
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
ATLANTIS_BUILD_DATE_UTC := $(shell date -u '+%Y%m%d-%H%M')
BUILD_DATE_TIME := $(shell date -u '+%Y%m%d%H%M')

ifeq ($(ATLANTIS_OFFICIAL), true)
   LIST = $(shell cat vendor/atlantis/atlantis.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      ATLANTIS_BUILD_TYPE := RELEASE

#include vendor/atlantis-priv/keys.mk
PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       ATLANTIS_BUILD_TYPE := COMMUNITY
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

ifeq ($(BUILD_WITH_GAPPS),true)
ATLANTIS_EDITION := GAPPS
else
ATLANTIS_EDITION := Vanilla
endif

ifeq ($(ATLANTIS_EDITION), GAPPS)
ATLANTIS_VERSION := AtlantisOS-$(ATLANTIS_MOD_VERSION)-$(CURRENT_DEVICE)-$(ATLANTIS_EDITION)-$(ATLANTIS_BUILD_TYPE)-$(ATLANTIS_BUILD_DATE_UTC)
ATLANTIS_FINGERPRINT := AtlantisOS/$(ATLANTIS_MOD_VERSION)/$(PLATFORM_VERSION)/$(ATLANTIS_BUILD_DATE_UTC)
ATLANTIS_DISPLAY_VERSION := AtlantisOS-$(ATLANTIS_MOD_VERSION)-$(ATLANTIS_BUILD_TYPE)
else
ATLANTIS_VERSION := AtlantisOS-$(ATLANTIS_MOD_VERSION)-$(CURRENT_DEVICE)-$(ATLANTIS_BUILD_TYPE)-$(ATLANTIS_BUILD_DATE_UTC)
ATLANTIS_FINGERPRINT := AtlantisOS/$(ATLANTIS_MOD_VERSION)/$(PLATFORM_VERSION)/$(ATLANTIS_BUILD_DATE_UTC)
ATLANTIS_DISPLAY_VERSION := AtlantisOS-$(ATLANTIS_MOD_VERSION)-$(ATLANTIS_BUILD_TYPE)
endif

TARGET_PRODUCT_SHORT := $(subst atlantis_,,$(ATLANTIS_BUILD))

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.atlantis.version=$(ATLANTIS_VERSION) \
  ro.atlantis.releasetype=$(ATLANTIS_BUILD_TYPE) \
  ro.modversion=$(ATLANTIS_MOD_VERSION) \
  ro.atlantis.display.version=$(ATLANTIS_DISPLAY_VERSION) \
  ro.atlantis.fingerprint=$(ATLANTIS_FINGERPRINT) \
  ro.build.datetime=$(BUILD_DATE_TIME) \
  ro.atlantis.edition=$(ATLANTIS_EDITION)