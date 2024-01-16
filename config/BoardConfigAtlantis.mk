include vendor/atlantis/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/atlantis/config/BoardConfigQcom.mk
endif

include vendor/atlantis/config/BoardConfigSoong.mk