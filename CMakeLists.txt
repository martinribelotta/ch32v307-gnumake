cmake_minimum_required(VERSION 3.16)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/toolchain-ch32v30x.cmake)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(firmware)
set(TARGET_ELF ${PROJECT_NAME}.elf)
add_executable(${TARGET_ELF} src/main.c src/donut.c src/cdc_acm_template.c)
enable_language(C CXX ASM)

set(PKG_CHERRYUSB_DEVICE_CDC ON)
set(PKG_CHERRYUSB_DEVICE_CH32VXXX ON)
set(PKG_CHERRYUSB_RTTHREAD ON)

set(RT_USING_DFS ON)
set(RT_USING_DFS_DEVFS ON)
set(RT_USING_DFS_ROMFS ON)
set(RT_USING_PIN ON)
set(RT_USING_ADC ON)
set(RT_USING_DAC ON)
set(RT_USING_I2C ON)
set(RT_USING_I2C_BITOPS ON)
set(RT_DFS_ROMFS_PATH ${CMAKE_CURRENT_SOURCE_DIR}/rootfs)

add_subdirectory(wch)

target_link_libraries(${TARGET_ELF} m)
add_custom_target(generate_romfs
    COMMAND python ${CMAKE_CURRENT_SOURCE_DIR}/wch/rtthread/tools/mkromfs.py ${RT_DFS_ROMFS_PATH} ${CMAKE_CURRENT_BINARY_DIR}/romfs.c
    SOURCES ${CMAKE_CURRENT_BINARY_DIR}/romfs.c
    COMMENT "Generate romfs file")

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/romfs.c
    COMMAND python ${CMAKE_CURRENT_SOURCE_DIR}/wch/rtthread/tools/mkromfs.py ${RT_DFS_ROMFS_PATH} ${CMAKE_CURRENT_BINARY_DIR}/romfs.c)
add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJDUMP} "-dSx" $<TARGET_FILE:${TARGET_ELF}> > $<TARGET_FILE:${TARGET_ELF}>.lst
    COMMENT "Generating disassembler file")
add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Obinary" $<TARGET_FILE:${TARGET_ELF}> $<TARGET_FILE:${TARGET_ELF}>.bin
    COMMENT "Generating bin file")
add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" $<TARGET_FILE:${TARGET_ELF}> $<TARGET_FILE:${TARGET_ELF}>.hex
    COMMENT "Generating hex file")

add_custom_target(flash
        COMMAND openocd -f ${CMAKE_CURRENT_SOURCE_DIR}/wch/wch-riscv.cfg
            -c init
            -c halt
            -c "flash erase_sector wch_riscv 0 last"
            -c "program ${TARGET_ELF} verify"
            -c wlink_reset_resume
            -c exit
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${tgt}
        COMMENT "Running openocd ${tgt_name}"
        USES_TERMINAL)
