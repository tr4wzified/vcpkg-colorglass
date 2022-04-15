vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO CharmedBaryon/CommonLibSSE
  REF 61383c799cf5b408af2e3bb4e93d2eb74d65b6dd
  SHA512 7fbca9ac0d55c5d771ef3ec94edef0441edbd0c42b635117572d9ffd7c6688b4eb52ed2c3f4018676cd16645415a5d8c525b77b95e6164a378f5d16c7eff3277
  HEAD_REF dev-ng
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS -DENABLE_SKYRIM_VR=off
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
