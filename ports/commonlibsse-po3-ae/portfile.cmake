vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO color-glass/CommonLibSSE
        REF dcf7aab5f3cd559e3153ef5d402f004db06473a7
        SHA512 a8b80101cec384c6618fb8d242f311765103619d2ba017b1763191e23a18c06cef8bb62e29e7412c924ed6130c7998155c61c17a9ae638470af288adb91a3ff3
        HEAD_REF dev
)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
        OPTIONS "-DSKYRIM_SUPPORT_AE=on"
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
