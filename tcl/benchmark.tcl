namespace path {::tcl::mathop ::tcl::mathfunc}

proc measure {data pat} {
	set start [clock microseconds]
	set match_count [regexp -all $pat $data]
	set elapsed [/ [- [clock microseconds] $start] 1e3]
	puts [format {%.3f - %u} $elapsed $match_count]
}

set data [read [open [lindex $argv 0]]]

measure $data {[\w\.+-]+@[\w\.-]+\.[\w\.-]+}
measure $data {[\w]+://[^/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?}
measure $data {(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])}
