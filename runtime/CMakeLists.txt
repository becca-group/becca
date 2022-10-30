add_library(becca-runtime SHARED
    runtime.cc
)

target_include_directories(becca-runtime PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
