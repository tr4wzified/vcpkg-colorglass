vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO color-glass/CommonLibSSE
  REF 02f2d432861225190eb1d544d54d07c456a9c434
  SHA512 24c98a62df7c9be76708316cd2648831e1f9e2b65d4f187d25a73b4dc83baa88bad0b95897e53de7d8dfa303e2f5449d7bf1e7bbfd42230c9ba71d18037cb03a
  HEAD_REF fudge-support
)

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
