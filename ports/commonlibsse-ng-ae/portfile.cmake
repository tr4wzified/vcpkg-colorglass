vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO CharmedBaryon/CommonLibSSE
  REF 30c7f6975a66deaa817d4a87e286dcd6094cff1b
  SHA512 2e11f5d92279ef6969650516a52ce651faec5fdbddb73d7657a8ed6a664f4635746728d7066eff27dea3cabf6f2492db3d59af2effaf657066eb35d96e5aaffc
  HEAD_REF dev-ng
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS -SKYRIM_FORCE_AE=ON
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
