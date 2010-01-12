# -*- perl -*-

# t/003_image-details.t - check get image details

use lib './t/';
use Test::More tests => 5;
use TestUtil qw(apikey);

my $key = apikey();

BEGIN {
    use_ok( 'Net::PicApp' );
}

my $pa = Net::PicApp->new(
    {
        apikey     => $key,
    }
);
my $response = $pa->get_image_details(6166715);
isa_ok($response,'Net::PicApp::Response');

my $i = $response->images();
ok( $i->{imageTitle} eq 'Furloughs' );

my @keywords = $i->keywords();
ok(@keywords);
ok( $#keywords == 57 );
