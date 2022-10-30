cmake_minimum_required(VERSION 3.23)
project(becca)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

set(BECCA_OUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/out")
function(becca_set_output TARGET REL_PATH)
    set_target_properties(${TARGET} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${BECCA_OUT_DIR}/${REL_PATH}"
        LIBRARY_OUTPUT_DIRECTORY "${BECCA_OUT_DIR}/${REL_PATH}"
    )
endfunction()

add_subdirectory(runtime)
add_subdirectory(app)

becca_set_output(becca "")
becca_set_output(becca-runtime "")
