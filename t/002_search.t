# -*- perl -*-

# t/002_search.t - check module loading

use lib './t/';
use Test::More tests => 7;
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
my $response = $pa->search('cats');
isa_ok($response,'Net::PicApp::Response');

ok( $response->rss_link eq 'http://www.picapp.com/Feed/cats.rss' );
ok( $response->record_count == 150 );
ok( $response->total_records > 1 );

my $c = 0;
my @images = $response->images();
ok( @images );
ok( $#images == 149 );
