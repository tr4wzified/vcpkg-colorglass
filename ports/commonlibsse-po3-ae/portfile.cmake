vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO color-glass/CommonLibSSE
        REF 4133d5bcbd9b4dd5295e4a6b8b07a70ef2400a40
        SHA512 3a43625a610a0c9a27b712ec74061a20aa2fa8654258586bac90c6185f46444aa22c8d0e8908685799ae5583d288c3bf037ff28f6bd2af3f7c61f11721aa3390
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
