file(GLOB_RECURSE DRVS ${CMAKE_CURRENT_SOURCE_DIR}/*/CMakeLists.txt)
foreach(d ${DRVS})
    get_filename_component(DIR ${d} DIRECTORY)
    add_subdirectory(${DIR})
endforeach()
target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

file(GLOB DRV_IPC_SRC ${CMAKE_CURRENT_SOURCE_DIR}/ipc/*.c)
target_sources(${TARGET_ELF} PUBLIC ${DRV_IPC_SRC})
