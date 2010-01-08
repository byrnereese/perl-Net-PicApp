package Net::PicApp::Response;

use strict;

# use 'our' on v5.6.0
use vars qw(@EXPORT_OK %EXPORT_TAGS);

use base qw(Class::Accessor);
Net::PicApp::Response->mk_accessors(qw( total_records record_count error_message images rss_link ));

# We are exporting functions
use base qw/Exporter/;

sub init {
    my $self = shift;
    my ($xml) = @_;
    $self->total_records($xml->{totalRecords});
    $self->rss_link($xml->{rssLink});
    my @images = @{$xml->{ImageInfo}};
    $self->record_count($#images + 1);
    $self->images(\@images);
    return $self;
}

sub is_success {
    return ($_[0]->error_message ? 0 : 1)
}

sub is_error {
    return ($_[0]->error_message ? 1 : 0)
}

1;
