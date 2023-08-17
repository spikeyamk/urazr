#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <stdbool.h>

#define TENTH_POWER_OF_TWO ( 1 << 10)
#define ONE_KIBIBYTE TENTH_POWER_OF_TWO
#define ONE_MEBIBYTE 1024 * ONE_KIBIBYTE
#define ONE_GIBIBYTE 1024 * ONE_MEBIBYTE
#define MAX_LEN 4 * ONE_MEBIBYTE

static inline void usage(const char *const argv[]) {
	fprintf(stderr, "Usage: %s <length up to %d> [--c-style]\n", argv[0], MAX_LEN);
}

static inline bool validate_argv_count(const int argc) {
	if(argc < 2) {
		return false;
	} else {
		return true;
	}
}

static inline bool validate_request_len_against_MAX_LEN(const size_t request_len) {
	if(request_len > MAX_LEN) {
		return false;
	} else {
		return true;
	}
}

static inline size_t get_request_len_from_command_line(const char *const argv[]) {
	char *endptr;
	const size_t ret_len = strtoul(argv[1], &endptr, 10);
	if(ret_len == 0 || *endptr != '\0') {
		fprintf(stderr, "Error: Invalid length. Please provide a valid positive integer.\n");
		return 0;
	}

	if(validate_request_len_against_MAX_LEN(ret_len) == false) {
		fprintf(stderr, "Error: Invalid length exceeds MAX_LEN: '%u'\n",
			MAX_LEN);
		return 0;
	}

	return ret_len;
}

void perror_errno_message(const char *const error_message) {
	if(errno == ENOENT) {
		perror(error_message);
	} else {
		perror("Error");
	}
}

static inline FILE *open_dev_urandom(void) {
	return fopen("/dev/urandom", "rb");
}

static inline size_t load_random_data_to_buffer_return_loaded_len(uint8_t *const buffer, const size_t len) {
	FILE *const urandom = open_dev_urandom();
	if(urandom == NULL) {
		perror_errno_message("Error: Cannot open /dev/urandom");
		return 0;
	}

	size_t bytes_read;
	for(bytes_read = 0; bytes_read < len; bytes_read++) {
		uint8_t byte;
		if(fread(&byte, sizeof(uint8_t), 1, urandom) != 1) {
			perror_errno_message("Error: Cannot read from /dev/urandom");
			break;  // Exit the loop on error
		}
		buffer[bytes_read] = byte;
	}
	
	if(fclose(urandom) != 0) {
		perror_errno_message("Error: Cannot close /dev/urandom");
	}
	return bytes_read;
}

static inline void print_in_binary(const uint8_t *const buffer, const size_t len) {
	for(size_t i = 0; i < len; i++) {
		if(putchar(buffer[i]) == EOF) {
			perror_errno_message("Error: Cannot write to stdout");
			break;  // Exit the loop on error
		}
	}
}

static inline bool use_c_style_array(const int argc, const char *const argv[]) {
	if(argc == 3 && strcmp(argv[2], "--c-style") == 0) {
		return true;
	} else {
		return false;
	}
}

static inline void print_c_style_array(const uint8_t *const buffer, const size_t len) {
	printf("const uint8_t data[%zu] = {", len);
	for(size_t i = 0; i < len; i++) {
		if(i % 8 == 0) {
			printf("\n\t");
		}
		printf("0x%02x, ", buffer[i]);
	}
	printf("\n};\n");
}

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
