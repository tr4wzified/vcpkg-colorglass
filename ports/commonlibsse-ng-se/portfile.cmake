vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO CharmedBaryon/CommonLibSSE
  REF 1bf4bbd3f90cb0ae99175c5e9b8a3114c656992b
  SHA512 26355660d0952ff29457cb2568a03c072ef24640d3fd72d0cb9aded35adb591aad04f6fab1a97c573d88abde4ea61610bf366c434aef0528f82ee675f3835306
  HEAD_REF dev-ng
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS -SKYRIM_FORCE_SE=ON
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
