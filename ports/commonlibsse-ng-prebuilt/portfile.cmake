if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.1/commonlibsse-ng_x64-windows-static-md_3.2.1_0.7z"
      FILENAME commonlibsse.zip
      SHA512 f07d1ee7467e37f44cefe6d42ad41412451652508c500e9699cac512a1f68f9cd49867973e79edc9724bf3b534ade727e2adae65a9309ba57d4e68ad39ca883b
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.1/commonlibsse-ng_x64-windows-static_3.2.1_0.7z"
      FILENAME commonlibsse.zip
      SHA512 f07d1ee7467e37f44cefe6d42ad41412451652508c500e9699cac512a1f68f9cd49867973e79edc9724bf3b534ade727e2adae65a9309ba57d4e68ad39ca883b
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
