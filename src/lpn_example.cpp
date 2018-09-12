#include <iostream>
#include "lpn_example_bin_cpp.h"

int main(int argc, char *argv[]){
	(void) argc;	/* unused */
	(void) argv;	/* unused */
	std::cout << "LPN example in C++!" << std::endl;
	std::cout << "BIN v" << lpn_example_bin_cpp_VERSION_MAJOR; 
	std::cout << "." << lpn_example_bin_cpp_VERSION_MINOR << std::endl; 
	return 0;
}
