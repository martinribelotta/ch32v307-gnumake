mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

CSRC+=$(wildcard $(current_dir)/Core/*.c)
CSRC+=$(wildcard $(current_dir)/Debug/*.c)
CSRC+=$(wildcard $(current_dir)/Peripheral/src/*.c)
CSRC+=$(wildcard $(current_dir)/Startup/*.c)

ASRC+=$(wildcard $(current_dir)/Startup/*.S)

INCLUDES+=$(current_dir)/Core
INCLUDES+=$(current_dir)/Debug
INCLUDES+=$(current_dir)/Peripheral/inc
INCLUDES+=$(current_dir)/Startup

DEFINES+=

LINKER_SCRIPTS:=$(current_dir)/Link.ld

ARCH:=-march=rv32imafc -mabi=ilp32
ARCH+=-msmall-data-limit=8 -mno-save-restore 
