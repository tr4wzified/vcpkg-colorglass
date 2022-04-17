if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(STATUS "Note: Fully Dynamic Game Engine overrides static library linkage to dynamic to build its DLL; you can still statically link to Trueflame/Hopesfire.")
endif ()
set(VCPKG_LIBRARY_LINKAGE dynamic)

vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/fully-dynamic-game-engine
  REF fba85e2f1af40893678b253cfaffb5fb5ae04b3c
  SHA512 a5eedb7e52cddd0064c1646a52073648b3d6f955a36edb335eeb13eecc89ad5e939febd37d8a51dbf11983b0fdae8325415aa5bf81d312ae91c6ca11c337f428
  HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "trueflame"             BUILD_TRUEFLAME
        "trueflame-vr"          BUILD_TRUEFLAME_VR
        "black-book"            BUILD_BLACK_BOOK
        "black-book-vr"         BUILD_BLACK_BOOK_VR
        "black-book-scripts"    INSTALL_BLACK_BOOK_SCRIPTS
        "hopesfire"             BUILD_HOPESFIRE
        "hopesfire-vr"          BUILD_HOPESFIRE_VR
        "trueflame-tests"       BUILD_TRUEFLAME_TESTS
        "trueflame-tests-vr"    BUILD_TRUEFLAME_TESTS_VR
        "black-book-tests"      BUILD_BLACK_BOOK_TESTS
        "black-book-tests-vr"   BUILD_BLACK_BOOK_TESTS_VR
        "hopesfire-tests"       BUILD_HOPESFIRE_TESTS
        "hopesfire-tests-vr"    BUILD_HOPESFIRE_TESTS_VR
        )

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_install_cmake()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME FullyDynamicGameEngine CONFIG_PATH share)

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

if (INSTALL_BLACK_BOOK_SCRIPTS)
  file(GLOB FDGE_SCRIPTS
    "${SOURCE_PATH}/contrib/Distribution/Data/Source/Scripts/*.psc"
  )
  file(INSTALL ${FDGE_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fully-dynamic-game-engine"
  )

  file(GLOB FDGE_TEST_SCRIPTS
    "${SOURCE_PATH}/contrib/Distribution/Data/Source/TestScripts/*.psc"
  )
  file(INSTALL ${FDGE_TEST_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fully-dynamic-game-engine"
  )
endif ()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
