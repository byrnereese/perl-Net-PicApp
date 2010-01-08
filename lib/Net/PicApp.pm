package Net::PicApp;

# use 'our' on v5.6.0
use vars qw($VERSION @EXPORT_OK %EXPORT_TAGS $DEBUG);
use XML::Simple;
use LWP::Simple;

$DEBUG = 0;
$VERSION = '0.1';

use base qw(Class::Accessor);
Net::PicApp->mk_accessors(qw(apikey url));

# We are exporting functions
use base qw/Exporter/;

# Constants:
#  Contributors
#  466   Corbis
#  16797 Entertainment Press
#  3     Getty Images
#  4     Image Source
#  5     Jupiter Images
#  7387  Newscom
#  12342 Pacific Coast News
#  4572  Splash News

#  Categories
#  2 Editorial
#  3 Creative
#  4 Entertainment
#  5 News
#  6 Sports

# Methods to support:
# * Search
# * SearchImagesWithThumbnails
# * SearchWithContributorAndSubCategory
# * getimagedetails
# * login
# * SearchImagesWithThumbnailsContributerAndSubCategory

# Export list - to allow fine tuning of export table
@EXPORT_OK = qw( search search_with_thumbnails get_image_details login );

use strict;

sub DESTROY { }

$SIG{INT} = sub { die "Interrupted\n"; };

$| = 1;  # autoflush

sub new {
    my $class = shift;
    my $params = shift;
    my $self = {};
    foreach my $prop ( qw/ apikey / ) {
        if ( exists $params->{ $prop } ) {
            $self->{ $prop } = $params->{ $prop };
        }
#        else {
#            confess "You need to provide the $prop parameter!";
#        }
    }
    bless $self, $class;
    return $self;
}

sub search {
    my $self = shift;
    my ($term, $options) = @_;
    my $url = $self->url . "/Search?ApiKey=" . $self->apikey;
    $url .= '&term=' . $term;
    $url .= '&cats=' . $options{'categories'} if $options{'categories'};
    $url .= '&clrs=' . $options{'colors'} if $options{'colors'};
    $url .= '&oris=' . $options{'orientation'} if $options{'orientation'};
    $url .= '&types=' . $options{'types'} if $options{'types'};
    $url .= '&mp=' . $options{'match_phrase'} if $options{'match_phrase'};
    $url .= '&post=' . $options{'time_period'} if $options{'time_period'};
    $url .= '&sort=' . $options{'sort'} if $options{'sort'};
    $url .= '&page=' . $options{'page'} if $options{'page'};
    $url .= '&totalRecords=' . $options{'total_records'} if $options{'total_records'};

    my $content = get($url);
}

1;
__END__

=head1 NAME

Net::PicApp - A toolkit for interacting with the PicApp service.

=head1 SYNOPSIS

   my $picapp = Net::PicApp->new({
    apikey => '4d8c591b-e2fc-42d2-c7d1-xxxabc00d000'
   });
   
=head1 DESCRIPTION

=head1 PREREQUISITES

=over

=item L<XML::Simple>

=item L<LWP::Simple>

=cut

=head1 USAGE

=cut

=head2 METHODS

=over

=item B<search($terms, %options)>

This function receives a term for searching and retrieves the results in XML.
This function allows the user to send search parameters in addition to the 
search term, corresponding to advanced search options in the www.picapp.com 
website.

Options:

    * categories - Editorial or Creative

    * colors - BW and/or Color

    * orientation - Horizontal and/or Vertical and/or Panoramic

    * types - Photography and/or Illustration

    * match_phrase - AllTheseWords or ExactPhrase or AnyTheseWords or FreeText

    * time_period - Today or Yesterday or Last3Days or LastWeek or LastMonth or Last3Months or Anytime

    * sort - 1, 2, 6

      1 = Most Relevant
      2 = Most Recent
      6 = Random

    * page - This parameter depicts the page number (1 and above) to be retrieved from the system.

    * total_records - This parameter indicates the maximal number of results requested from Picapp (1 and above).

=item B<search_with_thumbnails($terms, %options)>

This function retrieves the search results upon user definitions with extra 
rectangular cropped thumbnails on top of the regular thumbnail.

This function receives a term for searching and retrieves the results in XML.
This function allows the user to send search parameters in addition to the 
search term, corresponding to advanced search options in the www.picapp.com 
website.

=item B<get_image_details($id)>

This function receives the unique key and the image ID (the image ID received 
from the search XML results). 

=item B<does_user_exist($username, $password)>

This function receives a login name a password and retrieves an xml with the 
user details.

=item B<publish_image_with_search_term(TODO)>

This function receives an email, image ID and a key and the function retrieves 
the script in XML. Also the SearchTerm parameter should be the keyword used to 
find the image which is published.

TODO: options

=item B<search_with_contributor_and_sub_category(TODO)>

This function receives a term for searching and retrieves the results in XML.
This function allows the user to send search parameters in addition to the 
search term.

The function also enables the search results to be filtered by image 
contributor (Getty, Corbis, Splash, etc..) & by image category (news, 
creative, sports, etc..)

TODO: options

=item B<search_images_with_thumbnails_contributer_and_subcategory(TODO)>

This function receives a term for searching and retrieves the results in XML.
The image results are available with extra rectangular cropped thumbnails on 
top of the regular thumbnail.

This function allows the user to send search parameters in addition to the 
search term.

The function also enables the search results to be filtered by image 
contributor (Getty, Corbis, Splash, etc..) & by image category (news, 
creative, sports, etc..)

=cut

=head2 OPTIONS

Each of the following options are also accessors on the main
Net::PicApp object.

=over

=item B<apikey>

The API Key given to you by PicApp for accessing the service.

=item B<url>

The base URL of the PicApp service. Defaults to: 'http://api.picapp.com/API/ws.asmx'

=back

=head1 SEE ALSO

=head1 VERSION CONTROL

L<http://github.com/byrnereese/perl-Net-PicApp>

=head1 AUTHORS and CREDITS

Author: Byrne Reese <byrne@majordojo.com>

=cut
