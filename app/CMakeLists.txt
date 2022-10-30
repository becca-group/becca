set(BECCA_APP_SOURCES

)

set(BECCA_APP_TYPE)

if(UNIX)
    list(APPEND BECCA_APP_SOURCES
        main.unix.cc
    )
elseif(WIN32)
    list(APPEND BECCA_APP_SOURCES
        main.win32.cc
    )

    set(BECCA_APP_TYPE "WIN32")
endif()

add_executable(becca ${BECCA_APP_TYPE}
    ${BECCA_APP_SOURCES}
)

target_link_libraries(becca becca-runtime)
