import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class Benchmark {

    private static final String PATTERN_EMAIL = "[\\w.+-]+@[\\w.-]+\\.[\\w.-]+";
    private static final String PATTERN_URI = "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?";
    private static final String PATTERN_IP = "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}" +
                                             "(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])";

    public static void main(String... args) throws IOException {
        if (args.length != 1) {
            System.out.println("Usage: java Benchmark <filename>");
            System.exit(1);
        }

        final String data = Files.readString(Paths.get(args[0]));

        measure(data, PATTERN_EMAIL);
        measure(data, PATTERN_URI);
        measure(data, PATTERN_IP);
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
