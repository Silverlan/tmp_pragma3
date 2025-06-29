set(INSTALL_PATH "${BINARY_OUTPUT_DIR}")
pr_install_binary(compressonator WIN "CMP_Compressonator.dll" LIN "libCMP_Compressonator.so" BIN_DIR "${DEPENDENCY_COMPRESSONATOR_BINARY_DIR}" INSTALL_DIR "${INSTALL_PATH}")
pr_install_binary(compressonator WIN "CMP_Framework.dll" LIN "libCMP_Framework.so" BIN_DIR "${DEPENDENCY_COMPRESSONATOR_BINARY_DIR}" INSTALL_DIR "${INSTALL_PATH}")

if(WIN32)
    # We need to copy dxcompiler.dll and dxil.dll to bin directory. Otherwise pragma with compressonator will fail.
    pr_install_binary(compressonator WIN "dxcompiler.dll" BIN_DIR "${DEPENDENCY_COMPRESSONATOR_COMMON_DIR}/lib/ext/dxc/bin/x64" INSTALL_DIR "${INSTALL_PATH}")
    pr_install_binary(compressonator WIN "dxil.dll" BIN_DIR "${DEPENDENCY_COMPRESSONATOR_COMMON_DIR}/lib/ext/dxc/bin/x64" INSTALL_DIR "${INSTALL_PATH}")
else()
    pr_install_binary(ispctc LIN "libispc_texcomp.so" INSTALL_DIR "${INSTALL_PATH}")

    # libdecor
    pr_install_files("${LIBDECOR_BUILD_DIR}/src/libdecor-0.so" INSTALL_DIR "${INSTALL_PATH}")
    pr_install_directory("${LIBDECOR_BUILD_DIR}/src/plugins/" INSTALL_DIR "modules/graphics/vulkan/libdecor/")
endif()
