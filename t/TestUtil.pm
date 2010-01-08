package TestUtil;

use vars qw(@EXPORT_OK %EXPORT_TAGS);
use base qw/Exporter/;
use strict;
@EXPORT_OK = qw( apikey );

sub apikey {
    open FILE,'./api.key';
    my @lines = <FILE>;
    close FILE;
    return $lines[0];
}

1;
