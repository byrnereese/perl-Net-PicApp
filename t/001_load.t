# -*- perl -*-

# t/001_load.t - check module loading

use Test::More tests => 2;

BEGIN {
    use_ok( 'Net::PicApp' );
}

my $pa = XML::Sig->new(
    {
        apikey     => 'xxxx',
    }
);
isa_ok( $pa, 'Net::PicApp' );
