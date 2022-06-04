rt_thread_dir := $(wch_dir)/$(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

CSRC+=$(wildcard $(rt_thread_dir)/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/src/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/components/drivers/*/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/components/finsh/*.c)
CSRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/*.c)

ASRC+=$(wildcard $(rt_thread_dir)/libcpu/risc-v/*.S)

INCLUDES+=$(rt_thread_dir)
INCLUDES+=$(rt_thread_dir)/include
INCLUDES+=$(rt_thread_dir)/libcpu/risc-v
INCLUDES+=$(rt_thread_dir)/components/drivers/include
INCLUDES+=$(rt_thread_dir)/components/finsh
