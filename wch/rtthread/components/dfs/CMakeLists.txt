option(RT_USING_DFS "Using device virtual file system" FALSE)

if (${RT_USING_DFS})
    option(RT_USING_DFS_DEVFS "Using devfs for device objects" FALSE)
    option(RT_USING_DFS_RAMFS "Enable RAM file system" FALSE)
    option(RT_USING_DFS_ROMFS "Enable ReadOnly file system on flash" FALSE)

    target_sources(${TARGET_ELF} PUBLIC 
        ${CMAKE_CURRENT_SOURCE_DIR}/src/dfs.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/dfs_file.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/dfs_fs.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/dfs_posix.c
    )
    target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_DFS)
    target_include_directories(${TARGET_ELF}  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
    if(${RT_USING_DFS_DEVFS})
        target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_DFS_DEVFS)
        target_sources(${TARGET_ELF} PUBLIC 
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/devfs/devfs.c
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/devfs/devfs.h
        )
    endif()
    if(${RT_USING_DFS_RAMFS})
        target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_DFS_RAMFS)
        target_sources(${TARGET_ELF} PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/ramfs/ramfs.c
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/ramfs/ramfs.h
        )
    endif()
    if(${RT_USING_DFS_ROMFS})
        target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_DFS_ROMFS)
        target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/romfs/)
        target_sources(${TARGET_ELF} PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/romfs/dfs_romfs.c
            ${CMAKE_CURRENT_SOURCE_DIR}/filesystems/romfs/dfs_romfs.h
            ${CMAKE_BINARY_DIR}/romfs.c
        )
    endif()
endif()
