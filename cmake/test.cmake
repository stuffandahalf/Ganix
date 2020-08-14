set(CMAKE_SYSTEM_NAME ALiX)
#set(CMAKE_SYSTEM_NAME Linux)
#set(CMAKE_SYSTEM_NAME FreeBSD)
#set(CMAKE_SYSTEM_NAME SunOS)
#set(CMAKE_SYSTEM_PROCESSOR i386)

set(ALIX_TARGET_PROCESSOR powerpc)
set(ALIX_TARGET_PROCESSOR_SUBVERSION "")
set(ALIX_TARGET_PLATFORM unknown)
set(ALIX_TARGET_OS none)
set(ALIX_TARGET_ABI elf)

set(CMAKE_SYSTEM_PROCESSOR ${ALIX_TARGET_PROCESSOR})
set(TRIPLE "${ALIX_TARGET_PROCESSOR}${ALIX_TARGET_PROCESSOR_SUBVERSION}-${ALIX_TARGET_PLATFORM}-${ALIX_TARGET_OS}-${ALIX_TARGET_ABI}")

get_filename_component(PROJECT_ROOT ${CMAKE_CURRENT_LIST_DIR}/.. ABSOLUTE)
set(TOOLS ${PROJECT_ROOT}/tools)

message(STATUS ${TOOLS})

set(CMAKE_SYSROOT ${TOOLS}/llvm)

set(CMAKE_C_COMPILER ${TOOLS}/llvm/bin/clang)
if(NOT DEFINED ALIX_CMAKE_C_FLAGS)
	set(ALIX_CMAKE_C_FLAGS "-fno-builtin -nostdinc")
	if("${CMAKE_C_FLAGS}" STREQUAL "")
		set(CMAKE_C_FLAGS "${ALIX_CMAKE_C_FLAGS}")
	else()
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${ALIX_CMAKE_C_FLAGS}")
	endif()
endif()
set(CMAKE_C_COMPILER_TARGET ${TRIPLE})
if(NOT DEFINED ALIX_CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS)
	set(ALIX_CMAKE_SHARED_LINKER_CREATE_C_FLAGS -shared)
	if("${CMAKE_SHARED_LINKER_CREATE_C_FLAGS}" STREQUAL "")
		set(CMAKE_SHARED_LINKER_CREATE_C_FLAGS ${ALIX_CMAKE_SHARED_LINKER_CREATE_C_FLAGS})
	else()
		set(CMAKE_SHARED_LINKER_CREATE_C_FLAGS "${CMAKE_SHARED_LINKER_CRATE_C_FLAGS} ${ALIX_CMAKE_SHARED_LINKER_CREATE_C_FLAGS}")
	endif()
endif()

set(CMAKE_CXX_COMPILER ${TOOLS}/llvm/bin/clang++)
if(NOT DEFINED ALIX_CMAKE_CXX_FLAGS)
	set(ALIX_CMAKE_CXX_FLAGS "-fno-builtin -nostdinc++")
	if("${CMAKE_CXX_FLAGS}" STREQUAL "")
		set(CMAKE_CXX_FLAGS "${ALIX_CMAKE_CXX_FLAGS}")
	else()
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${ALIX_CMAKE_CXX_FLAGS}")
	endif()
endif()
set(CMAKE_CXX_COMPILER_TARGET ${TRIPLE})

set(CMAKE_ASM_COMPILER ${TOOLS}/llvm/bin/clang)

set(CMAKE_LINKER ${TOOLS}/llvm/bin/ld.lld)

#set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_C_LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_C_CREATE_SHARED_LIBRARY "<CMAKE_LINKER> <CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
set(CMAKE_CXX_LINK_EXECUTABLE "${CMAKE_LINKER}")
#if(NOT DEFINED ALIX_CMAKE_EXE_LINKER_FLAGS)
	#set(ALIX_CMAKE_EXE_LINKER_FLAGS "-fuse-ld=${TOOLS}/llvm/bin/ld.lld -nostdlib")
	#if("${CMAKE_EXE_LINKER_FLAGS}" STREQUAL "")
		#set(CMAKE_EXE_LINKER_FLAGS "${ALIX_CMAKE_EXE_LINKER_FLAGS}")
	#else()
		#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${ALIX_CMAKE_EXE_LINKER_FLAGS}")
	#endif()
#endif()

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

#set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN ${TOOLS}/llvm/bin)
#set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN ${TOOLS}/llvm)

#if(NOT DEFINED ALIX_CMAKE_BIN_INIT)
include_directories(${PROJECT_ROOT}/include)
#	add_library(c SHARED IMPORTED GLOBAL)
#	set(ALIX_CMAKE_BIN_INIT YES)
#endif()

