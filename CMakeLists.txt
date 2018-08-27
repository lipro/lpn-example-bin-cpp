# https://cmake.org/cmake-tutorial/

####################### CMAKE CREDENTIALS #######################

# Define minimum CMake version required.
cmake_minimum_required (VERSION 3.2 FATAL_ERROR)

# Make sure the user doesn't play dirty with symlinks.
get_filename_component (srcdir "${CMAKE_SOURCE_DIR}" REALPATH)
get_filename_component (bindir "${CMAKE_BINARY_DIR}" REALPATH)

# Disallow in-source builds.
if (${srcdir} STREQUAL ${bindir})
	message (FATAL_ERROR "In-source builds are not allowed. "
	"Please create a directory and run cmake from there, passing "
	"the path to this source directory as the last argument. This "
	"process created the file `CMakeCache.txt' and the directory "
	"`CMakeFiles' in ${srcdir}. Please remove them.")
endif (${srcdir} STREQUAL ${bindir})

# Set CMake build type explicitly to 'Debug'
# http://cmake.3232098.n2.nabble.com/Default-value-for-CMAKE-BUILD-TYPE-td7550756.html
if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
	message (STATUS "Setting build type to 'Debug' as none was specified.")
	set (
		CMAKE_BUILD_TYPE Debug
		CACHE STRING "Choose the type of build."
		FORCE
		)
	# Set the possible values of build type for cmake-gui
	set_property (
		CACHE CMAKE_BUILD_TYPE
		PROPERTY STRINGS
			"Debug" "Release" "MinSizeRel" "RelWithDebInfo"
		)
endif (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)

# Make it possible to locate CMake modules for finding libraries.
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")

# Use GNUInstallDirst to get canonical paths.
include (GNUInstallDirs)

###################### PACKAGE CREDENTIALS ######################

# Define the project name belong their language.
# This top-leve project name can be refered exactly by
# ${CMAKE_PROJECT_NAME} -- any overwritten project name can be refered by
# ${PROJECT_NAME}.
project (lpn-example-bin CXX)

# The project package version.
set (PROJECT_VERSION_MAJOR 1)
set (PROJECT_VERSION_MINOR 0)
set (PROJECT_VERSION_PATCH 0)
set (PROJECT_VERSION_TWEAK 0)

# The project package version.
set (PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

# Define a short description of the project (only a few words).
set (PACKAGE_DESCRIPTION "The Li-Pro.Net example in native C++ to evaluate different CI Services.")

# The package configuration name.
if (NOT PACKAGE_NAME)
	set (PACKAGE_NAME "${PROJECT_NAME}")
endif (NOT PACKAGE_NAME)

# The package configuration version.
if (NOT PACKAGE_VERSION)
	set (PACKAGE_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
endif (NOT PACKAGE_VERSION)

# The package full name with version.
set (PACKAGE "${PACKAGE_NAME}-${PACKAGE_VERSION}")

######################### DEPENDENCIES ##########################

# Setup CMake to run tests.
include (CTestSetup)

# Looking for GNU Source feature
include (GNUSourceAvailable)

# Setup global C build environment.
add_compile_options ("-Wall")
add_compile_options ("-Werror")
add_compile_options ("-Wextra")
add_compile_options ("-Wpedantic")
add_compile_options ("-std=c++11")

####################### INSTALL / EXPORT ########################

# Setup CMake to provide an uninstall target -- see:
# https://cmake.org/Wiki/CMake_FAQ#Can_I_do_.22make_uninstall.22_with_CMake.3F
configure_file (
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
	IMMEDIATE @ONLY)

if (NOT TARGET uninstall)
	add_custom_target (uninstall)
	add_custom_command (
		TARGET uninstall PRE_BUILD
		COMMAND ${CMAKE_COMMAND}
			-P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake
		COMMENT "Uninstall the project..."
		)
endif (NOT TARGET uninstall)

######################### SUB-PACKAGES ##########################

# Add the example source directory.
add_subdirectory (src)

include (CPackConfig.cmake)
