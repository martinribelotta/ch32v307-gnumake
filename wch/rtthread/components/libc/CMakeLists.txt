target_include_directories(${TARGET_ELF} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/common/include
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/newlib
)

file(GLOB_RECURSE LIBC_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/common/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/common/include/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/newlib/*.c
    ${CMAKE_CURRENT_SOURCE_DIR}/compilers/newlib/*.h
)

target_compile_definitions(${TARGET_ELF} PUBLIC
-DRT_USING_NEWLIB
-DRT_USING_LIBC
-D_POSIX_C_SOURCE=1)

target_sources(${TARGET_ELF} PUBLIC ${LIBC_SRC})
