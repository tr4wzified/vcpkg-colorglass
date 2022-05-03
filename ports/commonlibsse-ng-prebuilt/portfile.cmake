if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.2/commonlibsse-ng_x64-windows-static-md_3.2.2_0.7z"
      FILENAME commonlibsse.zip
      SHA512 a037b4f83d2599e97ecd190f3555a946c76e439e3642f2f060d58362fe0ad53785ed4fdf66b6c7ce1bfce606f2af64f1f35d4480181eec39872d095117f0cf49
  )
else ()
  vcpkg_download_distfile(COMMONLIB_DISTRO
      URLS "https://github.com/CharmedBaryon/CommonLibSSE-NG/releases/download/v3.2.2/commonlibsse-ng_x64-windows-static_3.2.2_0.7z"
      FILENAME commonlibsse.zip
      SHA512 a5b1d676a978a831c6d1e6572e8536346bbfb0b8ca86d0c604ac770c7d1d0d834e6f5c05bb94f9c895e920ed41194e53ba3722704a2b1a3b76cc3c7f03f19d46
  )
endif ()

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_extract_source_archive(
    "${COMMONLIB_DISTRO}" "${CURRENT_PACKAGES_DIR}"
)

file(REMOVE "${CURRENT_PACKAGES_DIR}/commonlibsse.zip.extracted")
