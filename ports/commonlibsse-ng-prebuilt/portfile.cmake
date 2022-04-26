if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.1.0/commonlibsse-ng_x64-windows-static-md_3.1.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 a78e9a0f02ec21d6f4933659c6d4696161f7cd01437b204bb265e634f4f5c3fc4d9801901a17ae8f2e37a70686ae8cd4f6919ecbe84b5da3e8f60f13a2824700
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.1.0/commonlibsse-ng_x64-windows-static_3.1.0_0.7z"
      FILENAME commonlibsse.zip
      SHA512 7c3225184cbcc1cc40a40a2610362395fcc8e15c181e37ddb42e9656bcac5ace6c7e87fba889a62bc6e7e49ff0c64b59581abdabc782687b45dede5026905e00
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
