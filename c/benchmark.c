#define PCRE2_CODE_UNIT_WIDTH 8

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/types.h>
#include <pcre2.h>

char *read_file(char *filename)
{
  char *data;
  long length = 0;

  FILE *fh = fopen(filename, "rb");

  fseek(fh, 0L, SEEK_END);
  length = ftell(fh);
  rewind(fh);
  data = malloc(length);

  fread(data, length, 1, fh);
  fclose(fh);

  return data;
}

void measure(char *data, char *pattern)
{
  int count = 0;
  double elapsed;
  struct timeval start, end;

  pcre2_code *re;
  int rc;
  int length = 0;
  int errornumber;
  PCRE2_SIZE erroroffset;
  PCRE2_SIZE offset = 0;
  pcre2_match_data *match_data;
  PCRE2_SPTR subject;
  size_t subject_length;
  PCRE2_SIZE *ovector;

  gettimeofday(&start, NULL);

  length = strlen(data);
  re = pcre2_compile((PCRE2_SPTR)pattern, PCRE2_ZERO_TERMINATED, 0, &errornumber, &erroroffset, NULL);
  match_data = pcre2_match_data_create_from_pattern(re, NULL);

  while (pcre2_match(re, (PCRE2_SPTR8)data, strlen(data), offset, PCRE2_NOTBOL | PCRE2_NOTEMPTY, match_data, NULL) == 1)
  {
    count++;

    ovector = pcre2_get_ovector_pointer(match_data);
    offset = ovector[1];
  }

  gettimeofday(&end, NULL);
  elapsed = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_usec - start.tv_usec) / 1000.0;

  printf("%f - %d\n", elapsed, count);
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
