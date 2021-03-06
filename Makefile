#
# Build configuration
#

TARGET_CHIP := NRF51822_QFAA_CA
BOARD := BOARD_NRF6310

ASMFLAGS += -D__HEAP_SIZE=16
ASMFLAGS += -D__STACK_SIZE=2048

CFLAGS += -DBOARD_NRF6310
CFLAGS += -DBLE_STACK_SUPPORT_REQD
CFLAGS += -DS110
CFLAGS += -DBOOTLOADER_TRANSPORT_BLE
CFLAGS += -DBOOTLOADER_BANKED
CFLAGS += -DBOOTLOADER_DUAL_BANK

DEVICE_SERIES := nrf51
DEVICE_VARIANT := xxaa

SDK_PATH = lib/SDK/

C_SOURCE_FILES += $(wildcard src/*.c)
ASSEMLBER_SOURCE_FILES = $(wildcard src/*.s)

C_SOURCE_FILES += $(SDK_PATH)Source/ble/ble_services/ble_dfu.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/app_timer.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/pstorage.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/hci_mem_pool.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/app_scheduler.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/app_gpiote.c
C_SOURCE_FILES += $(SDK_PATH)Source/app_common/crc16.c
C_SOURCE_FILES += $(SDK_PATH)Source/ble/ble_conn_params.c
C_SOURCE_FILES += $(SDK_PATH)Source/ble/ble_advdata.c
C_SOURCE_FILES += $(SDK_PATH)Source/ble/ble_services/ble_srv_common.c
C_SOURCE_FILES += $(SDK_PATH)Source/ble/softdevice_handler.c

INCLUDEPATHS += -I"./"
INCLUDEPATHS += -I"include/"
INCLUDEPATHS += -I"include/ble_transport/"

INCLUDEPATHS += -I"$(SDK_PATH)Include/ble"
INCLUDEPATHS += -I"$(SDK_PATH)Include/app_common"
INCLUDEPATHS += -I"$(SDK_PATH)Include/s110"
INCLUDEPATHS += -I"$(SDK_PATH)Include/sd_common"
INCLUDEPATHS += -I"$(SDK_PATH)Include/ble/ble_services"

LINKER_SCRIPT = gcc_$(DEVICESERIES)_bootloader_$(DEVICE_VARIANT).ld
OUTPUT_FILENAME := bootloader_$(DEVICE_VARIANT)

DEVICE_VARIANT := xxaa
#DEVICE_VARIANT := xxab

USE_SOFTDEVICE := S110
#USE_SOFTDEVICE := S210

include Makefile.common
include Makefile.openocd

