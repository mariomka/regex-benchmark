import std.stdio;
import std.file;
import std.regex;
import std.datetime;
import std.datetime.stopwatch : StopWatch, AutoStart;
import core.stdc.stdlib;

void measure(string pattern)(string data) {
    int count = 0;

    auto sw = StopWatch(AutoStart.yes);

    foreach (m; data.matchAll(ctRegex!(pattern))) {
        count++;
    }

    sw.stop();
    double end = sw.peek().total!"nsecs" / 1e6;

    printf("%f - %d\n", end, count);
}

void main(string [] args) {
    if(args.length != 2) {
        writeln("Usage: benchmark <filename>");
        exit(1);
    }

    string data = readText(args[1]);

    // Email
    measure!(r"[\w\.+-]+@[\w\\.-]+\.[\w\.-]+")(data);

    // URI
    measure!(r"[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?")(data);

    // IP
    measure!(r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])")(data);
}
