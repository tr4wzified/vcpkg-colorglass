if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static-md_3.0.1_0.7z"
      FILENAME commonlibsse.zip
      SHA512 fd69301171bbdfc921610d289a399626aef08f711da3aa82f91dae5bf49e7e690d57783cdf7ca7043ba6f595d9029eca0ce40edec368f4f544f3959e64ffa535
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static_3.0.1_0.7z"
      FILENAME commonlibsse.zip
      SHA512 c4cf44553ec4ff265886791c1faf142c69535b89de1a68c8da34e1087b976eddb2ed0bc5eccfcdc0dfe3920778b53c26bdae3f549745baa1be46fa3a39ce0ab8
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${COMMONLIB_DISTRO}")
file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
