include (CheckSymbolExists)

# check if _GNU_SOURCE is available

if (NOT _GNU_SOURCE)
	check_symbol_exists(__GNU_LIBRARY__ "features.h" _GNU_SOURCE)
	if (NOT _GNU_SOURCE)
		unset(_GNU_SOURCE CACHE)
		check_symbol_exists(_GNU_SOURCE "features.h" _GNU_SOURCE)
	endif ()
endif ()

if (_GNU_SOURCE)
	add_definitions(-D_GNU_SOURCE)
endif ()
