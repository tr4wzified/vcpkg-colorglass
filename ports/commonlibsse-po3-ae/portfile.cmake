vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO color-glass/CommonLibSSE
        REF 7c4b38dd21e59f0f39f3abe110a42ddb8c7c47d7
        SHA512 3d6d949f33f03d84a274cc10566ab5b8ac33f0cbbf7fba255dcb3991a2550ba85e790648a5dc3b3dfb09a8bcd3fe5b5ae2b83d38d24198cc1723733b5ed23c5b
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
