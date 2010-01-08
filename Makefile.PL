use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Net::PicApp',
    'VERSION_FROM'	=> 'lib/Net/PicApp.pm',
    'ABSTRACT'  => "A library for interfacing with the PicApp service.",
    'AUTHOR'    => 'Byrne Reese <byrne@majordojo.com>',
    'DISTNAME'  => 'Net-PicApp',
    'LICENSE'   => 'perl',
    'LIBS'	=> [''],   # e.g., '-lm' 
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '',     # e.g., '-I/usr/include/other' 
    'PREREQ_PM' => {
#        'Test::Exception' => 0,
#        'File::Which' => 0,
#        'Class::Accessor' => 0,
#        'XML::XPath' => 0,
#        'Digest::SHA1' => 0,
#        'MIME::Base64' => 0,
#        'Crypt::OpenSSL::Bignum' => 0,
#        'Crypt::OpenSSL::X509' => 0,
#        'Crypt::OpenSSL::RSA' => 0,
#        'Crypt::OpenSSL::DSA' => 0,
#        'XML::CanonicalizeXML' => 0,
    },
);
__END__
