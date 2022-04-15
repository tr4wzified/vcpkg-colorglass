if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static-md_3.0.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 fb9deed52d6264cb12002f60fd7ecb4b25067419254eae11e4f920caeeabd9955b685272f6fe949a1d73540c3a7e92cd3e958a3030c8ae646bd3e32e0b667704
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static_3.0.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 8aef60b6a78fee777662b91d64e3189016aa0c9a0b58bd40fcc05a08fc849fb9adebf887a14e291e3cccce7e0aa9589333649eaceb7265dc2569a7f4a02c8d06
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
