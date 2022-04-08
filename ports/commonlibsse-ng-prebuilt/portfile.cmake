if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static-md_2.0.0.7z"
      FILENAME commonlibsse.zip
      SHA512 7a032c42e95db7eaa5af06bc2e06d7179bb69b0b0bcf794074681e17127d29b4c9f6a3620e9223487d84c55eeda05df7b06491ab520f3cd610cef3ecbad4cc17
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://vcpkg-colorglass-artifacts.s3.us-west-2.amazonaws.com/prebuilt/commonlibsse-ng_x64-windows-static_2.0.0.7z"
      FILENAME commonlibsse.zip
      SHA512 b6e8328debad75a01697c7f5fb410b5e97ced6f82dc1ac838c479706855290a9d5512023299002d4e9efb907268fec41b25a85de768e211b6976f27b9fb5071d
  )
endif ()

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
