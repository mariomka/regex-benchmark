import java.io.File
import java.io.InputStream
import kotlin.text.Regex
import kotlin.system.exitProcess

fun main(args: Array<String>) {
    if (args.count() != 2) {
        println("Usage: kotlin benchmark.jar <filename> <regex-name>");
        exitProcess(1);
    }

    val pattern = when (args[1]) {
        "email" -> "[\\w\\.+-]+@[\\w\\.-]+\\.[\\w\\.-]+"
        "uri" -> "[\\w]+://[^/\\s?#]+[^\\s?#]+(?:\\?[^\\s#]*)?(?:#[^\\s]*)?"
        "ip" -> "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])"
        else -> {
            println("Regex name must be: email, uri or ip.")
            exitProcess(1)
        }
    }

    val inputStream: InputStream = File(args[0]).inputStream()
    val data = inputStream.bufferedReader().use { it.readText() }
    val regex = Regex(pattern)
    val results = regex.findAll(data)

    println(results.count())
}

