# The version number.
set (lpn_example_bin_cpp_VERSION_MAJOR 1)
set (lpn_example_bin_cpp_VERSION_MINOR 0)

# Configure a header file to pass some of the CMake settings into the
# source code.
configure_file (
  "${CMAKE_CURRENT_SOURCE_DIR}/lpn_example_bin_cpp.h.in"
  "${CMAKE_CURRENT_BINARY_DIR}/lpn_example_bin_cpp.h"
  )
 
# add the executable
add_executable (
	lpn_example_cpp
	lpn_example.cpp
)

# add the binary tree to the search path for include files
# so that we will find lpn_example_bin_cpp.h
target_include_directories (
	lpn_example_cpp
	PUBLIC	"$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
		"$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
	PRIVATE	"${CMAKE_CURRENT_BINARY_DIR}"
)

# add the install targets
install (
	TARGETS		lpn_example_cpp
	DESTINATION	${CMAKE_INSTALL_BINDIR}
)

# add the simple execution test
add_test (
	NAME execute_lpn_example_cpp
	COMMAND lpn_example_cpp
)
