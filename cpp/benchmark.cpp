#include <chrono>
#include <fstream>
#include <iostream>
#include <regex>
#include <boost/regex.hpp>
#include <srell.hpp>

void measure(const std::string& data, const std::string& pattern) {
  using clock = std::chrono::high_resolution_clock;
  const auto start = clock::now();

  const REGEX_NAMESPACE::regex re{pattern};
  unsigned count = 0;

  for (REGEX_NAMESPACE::sregex_token_iterator it{data.cbegin(), data.cend(), re}, end{}; it != end; ++it)
    count++;

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

  // Email
  measure(data, "[\\w.+-]+@[\\w.-]+\\.[\\w.-]+");

  // URI
  measure(data, "[\\w]+:\\/\\/[^\\/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?");

  // IP
  measure(data, "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");

  return 0;
}
