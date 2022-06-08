cmake_minimum_required(VERSION 3.21)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/toolchain-ch32v30x.cmake)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(firmware)
set(TARGET_ELF ${PROJECT_NAME}.elf)
add_executable(${TARGET_ELF} src/main.c src/donut.c)
enable_language(C CXX ASM)

add_subdirectory(wch)
target_link_libraries(${TARGET_ELF} m)
