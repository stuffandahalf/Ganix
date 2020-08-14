cmake_minimum_required(VERSION 2.8)
project(ALiX/sys/kern C)

file(GLOB SOURCES *.c)

add_executable(alix ${SOURCES})

install(TARGETS alix DESTINATION ${CMAKE_INSTALL_PREFIX})
