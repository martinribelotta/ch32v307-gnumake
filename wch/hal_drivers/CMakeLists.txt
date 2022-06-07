target_sources(${TARGET_ELF} PUBLIC
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_adc.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_adc.h
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_dac.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_dac.h
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_eth.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_eth.h
    ${CMAKE_CURRENT_SOURCE_DIR}/drv_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drv_gpio.h
    ${CMAKE_CURRENT_SOURCE_DIR}/drv_log.h
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_soft_i2c.c
    # ${CMAKE_CURRENT_SOURCE_DIR}/drv_soft_i2c.h
    ${CMAKE_CURRENT_SOURCE_DIR}/drv_usart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/drv_usart.h
)

target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
