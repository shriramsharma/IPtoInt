package App::IPtoInt;

use strict;
use warnings;

use Scalar::Util::Numeric qw/isnum/;

use Exporter qw/import/;

our @EXPORT_OK = qw/convert/;

sub validate {
    my ($ip_address) = @_;

    my @ip_breakup = split( '\.', $ip_address ) if ($ip_address);

    return 0 unless ( scalar(@ip_breakup) ~~ 4 );

    foreach (@ip_breakup) {
        return 0 unless ( isnum($_) && $_ >= 0 && $_ <= 255 );
    }

    return 1;
}

sub convert {
    my ($ip_address) = @_;

    die "Invalid IP address $ip_address" unless &validate($ip_address);

    my @ip_breakup = split( '\.', $ip_address );

    return ( ( $ip_breakup[0] * ( 256 ** 3 ) ) +
          ( $ip_breakup[1] * ( 256 ** 2 ) ) +
          ( $ip_breakup[2] * 256 ) +
          $ip_breakup[3] );
}
1;
