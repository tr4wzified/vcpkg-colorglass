if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.0/commonlibsse-ng_x64-windows-static-md_3.2.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 f07d1ee7467e37f44cefe6d42ad41412451652508c500e9699cac512a1f68f9cd49867973e79edc9724bf3b534ade727e2adae65a9309ba57d4e68ad39ca883b
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.0/commonlibsse-ng_x64-windows-static_3.2.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 665c95d156080309f69eac3d38cfbb45fe54b0eb144e2456a8c65b1b2f4941bf077d3c1ccbbb0c70e3089c093222e62ac7f35f62a676a22394e5ab756cbec054
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
