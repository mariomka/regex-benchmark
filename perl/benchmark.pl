use Time::HiRes qw(gettimeofday);

sub measure {
    my ($data, $pattern) = @_;

    my $start = Time::HiRes::gettimeofday();

    my $count = () = $data =~ /$pattern/g;

    my $elapsed = (Time::HiRes::gettimeofday() - $start) * 1000;

    printf("%f - %d\n", $elapsed, $count);
}

my ($filename) = @ARGV;

if (not defined $filename) {
  die "Usage: ./benchmark.pl <filename>\n";
}

open my $fh, '<:encoding(UTF-8)', $filename or die 'Could not open file.';
my $text;
read $fh, $data, -s $filename;
close $fh;

# Email
measure $data, '[\w\.+-]+@[\w\.-]+\.[\w\.-]+';

# URI
measure $data, '[\w]+:\/\/[^\/\s?#]+[^\s?#]+(?:\?[^\s#]*)?(?:#[^\s]*)?';

# IP
measure $data, '(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9])';



