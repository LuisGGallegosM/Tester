cmake_minimum_required( VERSION 3.16 )

project( JXTesting VERSION 1.0.0 )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set( SRC 
    "src/Tester.cpp")

set( HEADERS 
    "src/Tester.h")

add_library( Tester "${SRC}" )

install(DIRECTORY "${CMAKE_SOURCE_DIR}/src/" DESTINATION "include/Tester"
          FILES_MATCHING PATTERN "*.h")