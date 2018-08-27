# For help take a look at:
# https://gitlab.kitware.com/cmake/community/wikis/doc/cpack/Configuration
# http://www.cmake.org/Wiki/CMake:CPackConfiguration

# Setup CMake to create packages
if (EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")

	### general settings
	set (CPACK_PACKAGE_VENDOR "Li-Pro.Net")
	set (CPACK_PACKAGE_NAME ${PACKAGE_NAME})
	set (CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PACKAGE_DESCRIPTION})
	set (CPACK_PACKAGE_DESCRIPTION_FILE
		"${CMAKE_CURRENT_SOURCE_DIR}/README.md"
		)
	set (CPACK_RESOURCE_FILE_LICENSE
		"${CMAKE_CURRENT_SOURCE_DIR}/LICENSE"
		)

	### versions
	set (CPACK_PACKAGE_VERSION "${PACKAGE_VERSION}")
	set (CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
	set (CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
	set (CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

	### specifics
	if (${CMAKE_SYSTEM_NAME} MATCHES Linux)
		if (${CMAKE_SYSTEM_PROCESSOR} MATCHES x86_64)
			set (CPACK_SYSTEM_NAME lin64)
		else ()
			set (CPACK_SYSTEM_NAME lin32)
		endif ()
	endif ()
	set (CPACK_SET_DESTDIR true)

	### source generator
	set (CPACK_GENERATOR "TGZ;ZIP")
	set (CPACK_SOURCE_GENERATOR "TGZ;ZIP")
	set (CPACK_SOURCE_IGNORE_FILES
		"${CMAKE_CURRENT_BINARY_DIR}/"
		"/CVS/"
		"/[.]svn.*"
		"/[.]bzr.*"
		"/[.]hg.*"
		"/[.]git.*"
		"[.]swp$"
		"[.]#$"
		"~$"
		"/#"
		"obj*"
		"tags"
		"cscope.*"
		".ycm_extra_conf.pyc"
		)
	set (CPACK_SOURCE_TOPLEVEL_TAG "${CPACK_SYSTEM_NAME}-src")
	set (CPACK_SOURCE_PACKAGE_FILE_NAME
		"${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-src"
		)

	### binary generator
	if (WIN32)
		set(CPACK_GENERATOR "ZIP")

		### nsis generator
		find_package(NSIS)
		if (NSIS_MAKE)
			set (CPACK_GENERATOR "${CPACK_GENERATOR};NSIS")
			set (CPACK_NSIS_DISPLAY_NAME "LPN-EB-C++")
			set (CPACK_NSIS_COMPRESSOR "/SOLID zlib")
			set (CPACK_NSIS_MENU_LINKS
				"http://www.li-pro.net/"
				"Li-Pro.Net homepage"
				)
		endif (NSIS_MAKE)
	endif (WIN32)

	set (CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
	set (CPACK_PACKAGE_FILE_NAME
		"${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CPACK_SYSTEM_NAME}"
		)

	set (CPACK_COMPONENT_LIBRARIES_GROUP "Development")
	set (CPACK_COMPONENT_LIBRARIES_DISPLAY_NAME "Libraries")
	set (CPACK_COMPONENT_LIBRARIES_DESCRIPTION
		"Libraries used to build programs which use LPN-EB-C++"
		)

	set (CPACK_COMPONENT_HEADERS_DEPENDS libraries)
	set (CPACK_COMPONENT_HEADERS_GROUP "Development")
	set (CPACK_COMPONENT_HEADERS_DISPLAY_NAME "C/C++ Headers")
	set (CPACK_COMPONENT_HEADERS_DESCRIPTION
		"C/C++ header files for use with LPN-EB-C++"
		)

	set (CPACK_COMPONENT_APPLICATIONS_DEPENDS libraries)
	set (CPACK_COMPONENT_APPLICATIONS_GROUP "Runtime")
	set (CPACK_COMPONENT_APPLICATIONS_DISPLAY_NAME "CLI Tools")
	set (CPACK_COMPONENT_APPLICATIONS_DESCRIPTION
		"CLI Tools for use with LPN-EB-C++"
		)

	include (CPack)

endif (EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
