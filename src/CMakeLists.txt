
aux_source_directory(. SRCS)
aux_source_directory(./internal INTERNAL_SRCS)

#list(REMOVE_ITEM SRCS ./mmap.c)
message(STATUS ${SRCS})

# shared library
add_library(unixem
    SHARED
    ${SRCS}
    ${INTERNAL_SRCS}
    )

#target_link_libraries(unixem)

#set_target_properties(unixem PROPERTIES VERSION ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR} SOVERSION ${CPACK_PACKAGE_VERSION_MAJOR})

# static library
add_library(unixem_lib
    STATIC
    ${SRCS}
    ${INTERNAL_SRCS}
    )
# target_link_libraries(unixem_lib)
set_target_properties(unixem_lib PROPERTIES OUTPUT_NAME unixem)
#==================================================================

# 安装
install(TARGETS 
    unixem unixem_lib
    COMPONENT unixem
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
    )

