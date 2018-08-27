# Setup CMake to run tests -- see:
# Version 0.1
# Public Domain, written by Stephan Linz <rexut>

include (CTest)
include (CMakeParseArguments)

# https://cmake.org/Wiki/CMake/Testing_With_CTest
if (BUILD_TESTING)
	# Setup CMake to provide a customized CTest -- see:
	# https://cmake.org/Wiki/CMake/Testing_With_CTest#Customizing_CTest
	enable_testing ()
	if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/CTestCustom.cmake")
		configure_file (
			"${CMAKE_CURRENT_SOURCE_DIR}/CTestCustom.cmake"
			"${CMAKE_CURRENT_BINARY_DIR}/CTestCustom.cmake"
			IMMEDIATE @ONLY
			)
	endif (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/CTestCustom.cmake")
endif (BUILD_TESTING)
