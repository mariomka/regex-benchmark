using System;
using System.IO;
using System.Text.RegularExpressions;

class Benchmark {
  static void Main(string[] args) {
    if(args.Length != 2) {
        Console.WriteLine("Usage: benchmark <filename> <regex-name>");
        Environment.Exit(1);
    }

    StreamReader reader = new System.IO.StreamReader(args[0]);
    string data = reader.ReadToEnd();
    string pattern = null;

    switch (args[1])
    {
      case "email":
        pattern = @"[\w\.+-]+@[\w\.-]+\.[\w\.-]+";
        break;
      case "uri":
        pattern = @"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?";
        break;
      case "ip":
        pattern = @"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])";
        break;
      default:
        Console.WriteLine("Regex name must be: email, uri or ip.");
        Environment.Exit(2);
        break;
    }

    MatchCollection matches = Regex.Matches(data, pattern);
    int count = matches.Count;

    Console.WriteLine(count + " found.");
  }
}
