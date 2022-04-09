if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static-md_2.1.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 7727b28f0c77e93ada990536bb7e73b275e8756958a08b2a9f36514fa3fbb0573b85301f4b5d289921c9b3a0042b318b2d03d3ad042abf33d374858141d43027
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static_2.1.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 702744c90a1b76a3497abd22196d53fc5449cb62f002de6a941084f4aeb89f8c2263d3dd9fba47a1e8847b946d9d91093f71faf3aaa34268079c7487b20597bd
  )
endif ()

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
