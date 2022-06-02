rt_thread_dir := $(wch_dir)/$(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

CSRC+=$(wildcard $(rt_thread_dir)/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/src/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/drivers/*/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/components/drivers/*/*.c)

CSRC+=$(wildcard $(rt_thread_dir)/components/finsh/*.c)

CSRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/common/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/SW_Handler/*.c)

ASRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/common/*.S)
ASRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/SW_Handler/*.S)

INCLUDES+=$(rt_thread_dir)
INCLUDES+=$(rt_thread_dir)/include
INCLUDES+=$(rt_thread_dir)/libcpu/risc-v/common/
INCLUDES+=$(rt_thread_dir)/components/drivers/include
INCLUDES+=$(rt_thread_dir)/components/finsh

# DEFINES+=ARCH_RISCV_FPU
# DEFINES+=ARCH_RISCV_FPU_S
