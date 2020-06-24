#include <chrono>
#include <fstream>
#include <iostream>

#define U_DISABLE_RENAMING 1
#include <unicode/uconfig.h>
#include <unicode/platform.h>
#include <unicode/unistr.h>
#include <unicode/regex.h>
#include <unicode/ustring.h>


void measure(const icu::UnicodeString& data_uc, const std::string& pattern) {
  using clock = std::chrono::high_resolution_clock;
  const auto start = clock::now();

  UErrorCode status = U_ZERO_ERROR;
  icu::RegexMatcher matcher(icu::UnicodeString(pattern.c_str()), 0, status);
  if (U_FAILURE(status)) {
    throw std::runtime_error("something went wrong :(");
  }
  unsigned count = 0;
  matcher.reset(data_uc);
  while (matcher.find(status) && U_SUCCESS(status)) {
    count++;
  }
  
  const auto end = clock::now();
  const double elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() * 1e-6;
  std::cout << elapsed << " - " << count << "\n";
}

int main(int argc, char** argv) {
  if (argc != 2) {
    std::cerr << "Usage: benchmark <filename>\n";
    return 1;
  }

  std::ifstream file{argv[1]};
  if (!file) {
    std::cerr << "unable to open " << argv[1] << "\n";
    return 1;
  }

  const std::string data{std::istreambuf_iterator<char>{file}, std::istreambuf_iterator<char>{}};
  icu::UnicodeString data_uc(data.c_str());

  // Email
  measure(data_uc, "[\\w.+-]+@[\\w.-]+\\.[\\w.-]+");

  // URI
  measure(data_uc, "[\\w]+:\\/\\/[^\\/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?");

  // IP
  measure(data_uc, "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");

  return 0;
}
