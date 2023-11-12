#pragma once

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#define TENTH_POWER_OF_TWO ( 1 << 10 )
#define ONE_KIBIBYTE TENTH_POWER_OF_TWO
#define ONE_MEBIBYTE 1024 * ONE_KIBIBYTE
#define ONE_GIBIBYTE 1024 * ONE_MEBIBYTE
#define MAX_LEN 4 * ONE_MEBIBYTE

void usage(const char *const argv[]);
bool validate_argv_count(const int argc);
bool validate_request_len_against_MAX_LEN(const size_t request_len);
size_t get_request_len_from_command_line(const char *const argv[]);
void perror_errno_message(const char *const error_message);
FILE *open_dev_urandom(void);
size_t load_random_data_to_buffer_return_loaded_len(uint8_t *const buffer, const size_t len);
void print_in_binary(const uint8_t *const buffer, const size_t len);
bool use_c_style_array(const int argc, const char *const argv[]);
void print_c_style_array(const uint8_t *const buffer, const size_t len);
