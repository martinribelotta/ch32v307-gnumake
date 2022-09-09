file(GLOB FINSH_SRC ${CMAKE_CURRENT_SOURCE_DIR}/components/finsh/*.c)

target_sources(${TARGET_ELF} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/cconfig.h
    ${CMAKE_CURRENT_SOURCE_DIR}/rtconfig_preinc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/rtconfig.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clock.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/components.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/cpu.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/device.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/idle.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/ipc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/irq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/kservice.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/mem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/memheap.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/mempool.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/object.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/scheduler.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/signal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/slab.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/thread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/timer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/risc-v/context_gcc.S
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/risc-v/cpuport.c
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/risc-v/cpuport.h
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/risc-v/interrupt_gcc.S
    ${DRIVER_SRC}
    ${FINSH_SRC}
)

target_include_directories(${TARGET_ELF} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/libcpu/risc-v
    ${CMAKE_CURRENT_SOURCE_DIR}/components/drivers/include
    ${CMAKE_CURRENT_SOURCE_DIR}/components/finsh
)

target_compile_definitions(${TARGET_ELF} PUBLIC -DUSE_PLIC -DUSE_M_TIME -DNO_INIT)

add_subdirectory(components/libc)
add_subdirectory(components/CherryUSB)
add_subdirectory(components/dfs)
add_subdirectory(components/drivers)

# CSRC+=$(wildcard $(rt_thread_dir)/components/drivers/*/*.c)
# CSRC+=$(wildcard $(rt_thread_dir)/components/finsh/*.c)
