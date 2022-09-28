option(RT_USING_RTC "Using RTC Driver" FALSE)

if (RT_USING_RTC)
    target_sources(${TARGET_ELF} PUBLIC rtc.c)
    target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_RTC)

    option(RT_USING_ALARM "Usin RTC Alarm" FALSE)
    option(RT_USING_SOFT_RTC "Using RTC in sotfware" TRUE)

    if (RT_USING_ALARM)
        target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_ALARM)
        target_sources(${TARGET_ELF} PUBLIC alarm.c)
    endif()
    if (RT_USING_SOFT_RTC)
        target_compile_definitions(${TARGET_ELF} PUBLIC RT_USING_SOFT_RTC)
        target_sources(${TARGET_ELF} PUBLIC soft_rtc.c)
    endif()
endif()
