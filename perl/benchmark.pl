use Time::HiRes qw(gettimeofday);

sub measure {
    my ($data, $pattern) = @_;

    my $start = Time::HiRes::gettimeofday();

    my $count = () = $data =~ /$pattern/g;

    my $elapsed = (Time::HiRes::gettimeofday() - $start) * 1e3;

    printf("%f - %d\n", $elapsed, $count);
}

if (@ARGV != 1) {
  die "Usage: ./benchmark.pl <filename>\n";
}

my ($filename) = @ARGV;

open my $fh, '<', $filename or die 'Could not open file.';
my $text;
read $fh, $data, -s $filename;
close $fh;

# Email
measure $data, '[\w\.+-]+@[\w\.-]+\.[\w\.-]+';

# URI
measure $data, '[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?';

# IP
measure $data, '(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])';



