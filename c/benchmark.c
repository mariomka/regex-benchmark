#include <stdio.h>
#include <string.h>
#include <sys/time.h>

#if __has_include(<time.h>)
#include <time.h>
#endif

#define PCRE2_CODE_UNIT_WIDTH 8
#include <pcre2.h>

char *read_file(char *filename)
{
  char *data;
  long length = 0;

  FILE *fh = fopen(filename, "rb");

  fseek(fh, 0, SEEK_END);
  length = ftell(fh);
  fseek(fh, 0, SEEK_SET);

  data = malloc(length);

  size_t result = fread(data, length, 1, fh);
  if (result != 1)
  {
	fputs("err", stderr);
	exit(1);
  }
  fclose(fh);

  return data;
}

void measure(char *data, char *pattern)
{
  int count = 0;
  double elapsed;
  struct timespec start, end;
  pcre2_code *re;
  int errorcode;
  PCRE2_SIZE erroroffset;
  pcre2_match_context *match_ctx;
  pcre2_jit_stack *stack;
  pcre2_match_data *match_data;
  int length;
  PCRE2_SIZE offset = 0;
  PCRE2_SIZE *ovector;

  clock_gettime(CLOCK_MONOTONIC, &start);

  re = pcre2_compile((PCRE2_SPTR) pattern, PCRE2_ZERO_TERMINATED, 0, &errorcode, &erroroffset, NULL);

  match_ctx = pcre2_match_context_create(NULL);
  pcre2_jit_compile(re, PCRE2_JIT_COMPLETE);
  stack = pcre2_jit_stack_create(0, 16384, NULL);
  pcre2_jit_stack_assign(match_ctx, NULL, stack);

  match_data = pcre2_match_data_create(1, NULL);
  length = strlen(data);

  while (pcre2_jit_match(re, (PCRE2_SPTR8) data, length, offset, 0, match_data, match_ctx) == 1)
  {
    count++;

    ovector = pcre2_get_ovector_pointer(match_data);
    offset = ovector[1];
  }

  clock_gettime(CLOCK_MONOTONIC, &end);
  elapsed = ((end.tv_sec - start.tv_sec) * 1e9 + end.tv_nsec - start.tv_nsec) / 1e6;

  printf("%f - %d\n", elapsed, count);

  pcre2_jit_stack_free(stack);
  pcre2_match_context_free(match_ctx);
  pcre2_match_data_free(match_data);
  pcre2_code_free(re);
}

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Usage: benchmark  <filename>");
    exit(1);
  }

  char *data = read_file(argv[1]);

  // Email
  measure(data, "[\\w\\.+-]+@[\\w\\.-]+\\.[\\w\\.-]+");

  // URI
  measure(data, "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?");

  // IP
  measure(data, "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");

  free(data);

  return 0;
}
