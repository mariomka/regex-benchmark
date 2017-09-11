import java.io.*;
import java.util.regex.*;
import java.nio.file.*;

class Benchmark
{
    public static void main(String args[])
    {
        if (args.length != 2) {
            System.out.println("Usage: java Benchmark.class <filename> <regex-name>");
            System.exit(1);
        }

        String pattern = "";

        switch (args[1]) {
            case "email":
                pattern = "[\\w\\.+-]+@[\\w\\.-]+\\.[\\w\\.-]+";
                break;
            case "uri":
                pattern = "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?";
                break;
            case "ip":
                pattern = "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])";
                break;
            default:
                System.out.println("Regex name must be: email, uri or ip.");
                System.exit(2); 
        }

        Pattern regex = Pattern.compile(pattern);

        try {
            String data = new String(Files.readAllBytes(Paths.get(args[0])), "UTF-8");
            Matcher matcher = regex.matcher(data);
            int count = 0;

            while (matcher.find()) {
                count++;
            }

            System.out.println(count + " found.");
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
