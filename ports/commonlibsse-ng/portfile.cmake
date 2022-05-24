vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO CharmedBaryon/CommonLibSSE
        REF abab81132d47e9688a203e3253718a3c694d5a86
        SHA512 0263f5725e82498f5f8bd8465e895bcab4fcb01bbd1e8194671b4c9444aa0ed34d2fa2980cad631b0c6ccd4f65f2e58936af4dc36c09b4fbece9a56a5a258848
        HEAD_REF main
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS -DBUILD_TESTS=off
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(PACKAGE_NAME CommonLibSSE CONFIG_PATH lib/cmake)
vcpkg_copy_pdbs()

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/CommonLibSSE/CommonLibSSE/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/CommonLibSSE/CommonLibSSE")

file(
        INSTALL "${SOURCE_PATH}/LICENSE"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)
