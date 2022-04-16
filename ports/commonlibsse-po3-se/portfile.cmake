vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO color-glass/CommonLibSSE
  REF 6cd3c18bc60112d34f1f98b15b98d6f5a1728a2c
  SHA512 7dbe9a77bf9b392e6ae14cd40a7d936d49508eebbf16c82284db9923c4475488db21a0341b36842694938f397fea7f140fc725cc9cb4167ebcf406da3f7ed1ad
  HEAD_REF dev
  PATCHES fmt_fix.patch
)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
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
