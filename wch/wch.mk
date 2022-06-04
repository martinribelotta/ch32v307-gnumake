wch_dir := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

CSRC+=$(wildcard $(wch_dir)/hal_drivers/*.c)
CSRC+=$(wildcard $(wch_dir)/hal_libraries/ch32v307_hal/source/*.c)
CSRC+=$(wildcard $(wch_dir)/hal_libraries/bmsis/source/*.c)
ASRC+=$(wildcard $(wch_dir)/hal_libraries/bmsis/source/*.S)

INCLUDES+=$(wch_dir)/hal_libraries/ch32v307_hal/include
INCLUDES+=$(wch_dir)/hal_libraries/bmsis/include
INCLUDES+=$(wch_dir)/hal_drivers

DEFINES+=

LINKER_SCRIPTS:=$(wch_dir)/Ld/Link.ld

ARCH:=-march=rv32imfc -mabi=ilp32f
ARCH+=-msmall-data-limit=8 -mno-save-restore 

include $(wch_dir)/rtthread/rtthread.mk

print-%: ; @echo $*: $($(*))
