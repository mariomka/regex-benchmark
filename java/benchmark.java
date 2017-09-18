import java.io.*;
import java.util.regex.*;
import java.nio.file.*;

class Benchmark
{
    public static void main(String args[])
    {
        if (args.length != 1) {
            System.out.println("Usage: java Benchmark.class <filename>");
            System.exit(1);
        }

        String data = "";

        try {
            data = new String(Files.readAllBytes(Paths.get(args[0])), "UTF-8");
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            System.exit(3);
        }

        // Email
        Benchmark.measure(data, "[\\w\\.+-]+@[\\w\\.-]+\\.[\\w\\.-]+");

        // URI
        Benchmark.measure(data, "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?");

        // IP
        Benchmark.measure(data, "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");
    }

    public static void measure(String data, String pattern) {
        int count = 0;
        long startTime = System.nanoTime();

        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(data);
        
        while (matcher.find()) {
            count++;
        }

        long elapsed = System.nanoTime() - startTime;

        System.out.println(elapsed / 1e6 + " - " + count);
    }
}
