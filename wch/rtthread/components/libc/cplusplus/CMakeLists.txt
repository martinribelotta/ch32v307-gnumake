option(RT_USING_CPLUSPLUS "Enable C++ support" FALSE)

get_target_property(SRCS ${TARGET_ELF} SOURCES)
foreach(src ${SRCS})
    get_filename_component(e ${src} EXT)
    if (${e} MATCHES "cpp|cc|cxx")
        set(RT_USING_CPLUSPLUS ON)
    endif()
endforeach()

if (RT_USING_CPLUSPLUS)
    message("** Using C++")
    option(RT_USING_CPLUSPLUS11 "Using C++11" FALSE)
    target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
    target_sources(${TARGET_ELF} PUBLIC
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_crt_init.c
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_crt.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_crt.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_lock.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_mail.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_Mutex.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_mutex.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_queue.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_Semaphore.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_semaphore.h
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_Thread.cpp
            ${CMAKE_CURRENT_SOURCE_DIR}/cxx_thread.h
    )
endif()
