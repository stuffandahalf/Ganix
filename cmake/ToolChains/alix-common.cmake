#set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_NAME ALiX)

set(CMAKE_C_COMPILER ${CMAKE_CURRENT_SOURCE_DIR}/tools/llvm/bin/clang)
#set(CMAKE_C_COMPILER_TARGET i386-elf)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS FALSE)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=${CMAKE_CURRENT_LIST_DIR}/../tools/llvm/bin/ld.lld")
set(CMAKE_STATIC_LINKER_FLAGS "${CMAKE_STATIC_LINKER_FLAGS} -fuse-ld=${CMAKE_CURRENT_LIST_DIR}/../tools/llvm/bin/ld.lld")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fuse-ld=${CMAKE_CURRENT_LIST_DIR}/../tools/llvm/bin/ld.lld")
#set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -fuse-ld=${CMAKE_CURRENT_LIST_DIR}/../tools/llvm/bin/ld.lld")

