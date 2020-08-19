set(CMAKE_SYSTEM_NAME ALiX)
#set(CMAKE_SYSTEM_NAME Linux)
#set(CMAKE_SYSTEM_NAME FreeBSD)
#set(CMAKE_SYSTEM_NAME SunOS)
#set(CMAKE_SYSTEM_PROCESSOR i386)

set(ALIX_TARGET_PROCESSOR i386)
set(ALIX_TARGET_PROCESSOR_SUBVERSION "")
set(ALIX_TARGET_PLATFORM unknown)
set(ALIX_TARGET_OS alix)
set(ALIX_TARGET_ABI elf)

set(CMAKE_SYSTEM_PROCESSOR ${ALIX_TARGET_PROCESSOR})
set(ALIX_TARGET_TRIPLE "${ALIX_TARGET_PROCESSOR}${ALIX_TARGET_PROCESSOR_SUBVERSION}-${ALIX_TARGET_PLATFORM}-${ALIX_TARGET_OS}-${ALIX_TARGET_ABI}")

get_filename_component(PROJECT_ROOT ${CMAKE_CURRENT_LIST_DIR}/.. ABSOLUTE)
set(TOOLS ${PROJECT_ROOT}/tools)
set(CMAKE_SYSROOT ${TOOLS}/llvm)

set(CMAKE_C_COMPILER ${CMAKE_SYSROOT}/bin/clang)
set(CMAKE_C_COMPILER_TARGET ${ALIX_TARGET_TRIPLE})

set(CMAKE_CXX_COMPILER ${CMAKE_SYSROOT}/bin/clang++)
set(CMAKE_CXX_COMPILER_TARGET ${ALIX_TARGET_TRIPLE})

set(CMAKE_ASM-ATT_COMPILER ${CMAKE_SYSROOT}/bin/clang)
set(CMAKE_ASM-ATT_COMPILER_TARGET ${ALIX_TARGET_TRIPLE})
#set(CMAKE_ASM_COMPILER ${CMAKE_SYSROOT}/bin/clang)
#set(CMAKE_ASM_COMPILER_TARGET ${ALIX_TARGET_TRIPLE})

#set(CMAKE_ASM-ATT_FLAGS "${CMAKE_ASM-ATT_FLAGS} --target=${ALIX_TARGET_TRIPLE} -c")
#set(CMAKE_ASM-ATT_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_ASM-ATT_LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

#set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN ${TOOLS}/llvm/bin)
#set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN ${TOOLS}/llvm)

#if(NOT DEFINED ALIX_CMAKE_BIN_INIT)
include_directories(${PROJECT_ROOT}/include)
#	add_library(c SHARED IMPORTED GLOBAL)
#	set(ALIX_CMAKE_BIN_INIT YES)
#endif()
