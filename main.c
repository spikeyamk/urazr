#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>

#include "urazr.h"

int main(const int argc, const char *const argv[]) {
	if(validate_argv_count(argc) == false) {
		usage(argv);
		return EXIT_FAILURE;
	}

	const size_t len = get_request_len_from_command_line(argv);
	if(len == 0) {
		usage(argv);
		return EXIT_FAILURE;
	}

	uint8_t buffer[len]; // Initialize buffer to zeros
	memset(buffer, 0, len);
	const size_t loaded_len = load_random_data_to_buffer_return_loaded_len(buffer, len);

	if(loaded_len != len) {
		fprintf(stderr, "Error: Loaded data length (%zu) does not match "
			"requested length (%zu)\n", loaded_len, len);
		return EXIT_FAILURE;
	}

	if(use_c_style_array(argc, argv) == true) {
		print_c_style_array(buffer, len);
	} else {
		print_in_binary(buffer, len);
	}

	return EXIT_SUCCESS;
}
