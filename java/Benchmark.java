import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class Benchmark {
    public static void main(String... args) throws IOException {
        if (args.length != 1) {
            System.out.println("Usage: java Benchmark <filename>");
            System.exit(1);
        }

        final String data = Files.readString(Paths.get(args[0]));

        measure(data, "[\\w.+-]+@[\\w.-]+\\.[\\w.-]+");
        measure(data, "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?");
        measure(data, "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])");
    }

    private static void measure(String data, String pattern) {
        long startTime = System.nanoTime();

        final Matcher matcher = Pattern.compile(pattern).matcher(data);
        int count = 0;
        while (matcher.find()) {
            ++count;
        }

        long elapsed = System.nanoTime() - startTime;

        System.out.println(elapsed / 1e6 + " - " + count);
    }
}
