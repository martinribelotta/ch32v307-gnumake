wch_dir := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

CSRC+=$(wildcard $(wch_dir)/Core/*.c)
CSRC+=$(wildcard $(wch_dir)/Debug/*.c)
CSRC+=$(wildcard $(wch_dir)/Peripheral/src/*.c)
CSRC+=$(wildcard $(wch_dir)/Startup/*.c)
CSRC+=$(wildcard $(wch_dir)/drivers/*.c)

ASRC+=$(wildcard $(wch_dir)/Startup/*.S)

INCLUDES+=$(wch_dir)/Core
INCLUDES+=$(wch_dir)/Debug
INCLUDES+=$(wch_dir)/Peripheral/inc
INCLUDES+=$(wch_dir)/Startup
INCLUDES+=$(wch_dir)/drivers

DEFINES+=

LINKER_SCRIPTS:=$(wch_dir)/Link.ld

ARCH:=-march=rv32imafc -mabi=ilp32
ARCH+=-msmall-data-limit=8 -mno-save-restore 

include $(wch_dir)/rtthread/rtthread.mk

print-%: ; @echo $*: $($(*))
