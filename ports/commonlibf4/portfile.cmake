vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Ryan-rsm-McKenzie/CommonLibF4
  REF e2392b88d23f48491c7fd61d0b501e9347d7211d
  SHA512 7169d374e41de959fec26ef00e4738d33c4879ead63ec0deedc7a7164c6c1480c0fbabdd0d0f3c377ec051fa01d058279b994812b967daffa5b26b6ce096c8e6
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
