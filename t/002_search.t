# -*- perl -*-

# t/002_search.t - check module loading

use lib './t/';
use Test::More tests => 2;
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

print STDERR "RSS: " . $response->rss_link . "\n";
print STDERR "Results: " . $response->record_count . "\n";
print STDERR "Total: " . $response->total_records . "\n";

my $c = 0;
foreach my $i (@{$response->images}) {
    print STDERR ++$c . ". Image: " . $i->{imageTitle} . "\n";
}
