vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO CharmedBaryon/CommonLibSSE
  REF 3757ed2a93d40e0da0edb4847583696e52d10c04
  SHA512 f69ca041ace61e7afdd21110b3107e538d96a684b4e2da4c55d38182393f70b20efad9c395ad35281d060e01574aff56c61ec7c3ac01bd8fa80da37909a8fe44
  HEAD_REF dev-ng
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS -SKYRIM_FORCE_VR=ON
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
