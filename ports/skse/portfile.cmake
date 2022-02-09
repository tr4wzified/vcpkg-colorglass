vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "plugin"       BUILD_PLUGIN
        "scripts"      INSTALL_SCRIPTS
        )

if (BUILD_PLUGIN)
  if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(WARNING "Warning: SKSE only supports static linkage, overriding setting.")
  endif ()
  set(VCPKG_LIBRARY_LINKAGE static)
  set(VCPKG_CRT_LINKAGE static)

  vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ianpatt/skse64
    REF v2.1.5
    SHA512 a084c1990b7c79ed674cae59cad02ecc72ebd5f8c75c6ad14a3c229e411f81d9aa21e6617fb1b7851d5467857acfaf22bdcce24bdf3b68af4a1fd353028eda51
    HEAD_REF master
  )

  vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
  )

  vcpkg_build_cmake()
  vcpkg_copy_pdbs()

  file(
    INSTALL "${SOURCE_PATH}/skse64/skse64-config.cmake"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64"
  )

  file(GLOB SKSE_CMAKE_FILES
    "${SOURCE_PATH}/skse64/CMakeFiles/Export/lib/cmake/skse64/*.cmake"
  )
  file(
    INSTALL ${SKSE_CMAKE_FILES}
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/skse64"
  )

  file(
    INSTALL "${SOURCE_PATH}/skse64_license.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
  )
endif()

if (INSTALL_SCRIPTS)
  vcpkg_download_distfile(SKSE_DISTRO
    URLS "https://skse.silverlock.org/beta/skse64_2_01_05.7z"
    FILENAME skse64_2_1_5.zip
    SHA512 24950f5759432e1119e028b2f3972dbb983376f19856309759378c788d6794ef4d5055686dd4606c10da5cc814d6fb4812dbbc0755aadb825b8bca142b379e61
  )

  vcpkg_extract_source_archive(
      "${SKSE_DISTRO}"
  )

  file(GLOB SKSE_SCRIPTS
    "${CURRENT_BUILDTREES_DIR}/src/skse64_2_01_05/Data/Scripts/Source/*.psc"
  )

  file(INSTALL ${SKSE_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/skse"
  )

  if (NOT BUILD_PLUGIN)
    file(
      INSTALL "${CURRENT_BUILDTREES_DIR}/src/skse64_2_01_05/src/skse64/skse64_license.txt"
      DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
      RENAME copyright
    )
  endif()
endif()
