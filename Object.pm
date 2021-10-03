package MARC::Convert::Wikidata::Object;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object);

our $VERSION = 0.01;

has authors => (
	default => [],
	is => 'ro',
);

has ccnb => (
	is => 'ro',
);

has edition_number => (
	is => 'ro',
);

has editors => (
	default => [],
	is => 'ro',
);

has illustrators => (
	default => [],
	is => 'ro',
);

has isbn_10 => (
	is => 'ro',
);

has isbn_13 => (
	is => 'ro',
);

has language => (
	is => 'ro',
);

has number_of_pages => (
	is => 'ro',
);

has place_of_publication => (
	is => 'ro',
);

has publication_date => (
	is => 'ro',
);

# TODO Array
has publisher => (
	is => 'ro',
);

has subtitle => (
	is => 'ro',
);

has title => (
	is => 'ro',
);

has translators => (
	default => [],
	is => 'ro',
);

sub full_name {
	my $self = shift;

	my $full_name = $self->title;
	if ($self->subtitle) {
		$full_name .= ': '.$self->subtitle;
	}

	return $full_name;
}

sub BUILD {
	my $self = shift;

	# Check authors.
	check_array_object($self, 'authors',
		'MARC::Convert::Wikidata::Object::People', 'Author');

	# Check editors.
	check_array_object($self, 'editors',
		'MARC::Convert::Wikidata::Object::People', 'Editor');

	# Check illustrators.
	check_array_object($self, 'illustrators',
		'MARC::Convert::Wikidata::Object::People', 'Illustrator');

	# Check translators.
	check_array_object($self, 'translators',
		'MARC::Convert::Wikidata::Object::People', 'Translator');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

MARC::Convert::Wikidata::Object - Bibliographic Wikidata object defined by MARC record.

=head1 SYNOPSIS

 use MARC::Convert::Wikidata::Object;

 my $obj = MARC::Convert::Wikidata::Object->new(%params);
 my $authors_ar = $obj->authors;
 my $ccnb = $obj->ccnb;
 my $edition_number = $obj->edition_number;
 my $editors_ar = $obj->editors;
 my $full_name = $obj->full_name;
 my $illustrators_ar = $obj->illustrators;
 my $isbn_10 = $obj->isbn_10;
 my $isbn_13 = $obj->isbn_13;
 my $language = $obj->language;
 my $number_of_pages = $obj->number_of_pages;
 my $place_of_publication = $obj->place_of_publication;
 my $publication_date = $obj->publication_date;
 my $publisher = $obj->publisher;
 my $subtitle = $obj->subtitle;
 my $title = $obj->title;
 my $translators_ar = $obj->translators;

=head1 METHODS

=head2 C<new>

 my $obj = MARC::Convert::Wikidata::Object->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<authors>

List of authors.
Reference to array with MARC::Convert::Wikidata::Object::People instances.

Default value is refernce to blank array.

=item * C<ccnb>

ČČNB (Česká národní bibliografie) id.

Default value is undef.

=item * C<edition_number>

Edition number.

Default value is undef.

=item * C<editors>

List of editors.
Reference to array with MARC::Convert::Wikidata::Object::People instances.

Default value is refernce to blank array.

=item * C<illustrators>

List of illustrators.
Reference to array with MARC::Convert::Wikidata::Object::People instances.

Default value is refernce to blank array.

=item * C<isbn_10>

ISBN identifier with 10 characters (old one version).

Default value is undef.

=item * C<isbn_13>

ISBN identifier with 13 characters (new one version).

Default value is undef.

=item * C<language>

Language of book edition (TODO Format)

Default value is undef.

=item * C<number_of_pages>

Number of pages.

Default value is undef.

=item * C<place_of_publication>

Place of publication.

Default value is undef.

=item * C<publication_date>

Publication date.

Default value is undef.

=item * C<publisher>

Publisher.

Default value is undef.

=item * C<subtitle>

Subtitle of book edition.

Default value is undef.

=item * C<title>

Title of book edition.

Default value is undef.

=item * C<translators>

List of translators.
Reference to array with MARC::Convert::Wikidata::Object::People instances.

Default value is refernce to blank array.

=back

=head2 C<authors>

 my $authors_ar = $obj->authors;

Get reference to array with author objects.
Create item in system.

Returns reference to array of MARC::Convert::Wikidata::Object::People instances.

=head2 C<ccnb>

 my $ccnb = $obj->ccnb;

Get ČČNB (Česká národní bibliografie) ID.

Returns string.

=head2 C<edition_number>

 my $edition_number = $obj->edition_number;

Get edition number.

Returns number.

=head2 C<editors>

 my $editors_ar = $obj->editors;

=head C<full_name>

 my $full_name = $obj->full_name;

Get full name of edition in format '__TITLE__: __SUBTITLE__'.

Returns string.

=head2 c<illustrators>

 my $illustrators_ar = $obj->illustrators;

=head2 C<isbn_10>

 my $isbn_10 = $obj->isbn_10;

=head2 C<isbn_13>

 my $isbn_13 = $obj->isbn_13;

=head2 C<language>

 my $language = $obj->language;

=head2 C<number_of_pages>

 my $number_of_pages = $obj->number_of_pages;

=head2 C<place_of_publication>

 my $place_of_publication = $obj->place_of_publication;

=head2 C<publication_date>

 my $publication_date = $obj->publication_date;

=head2 C<publisher>

 my $publisher = $obj->publisher;

=head2 C<subtitle>

 my $subtitle = $obj->subtitle;

=head2 C<title>

 my $title = $obj->title;

=head2 C<translators>

 my $translators_ar = $obj->translators;

=head1 ERRORS

 new():
         From Mo::utils::check_array_object():
                 Parameter authors' must be a array.
                 Author isn't 'MARC::Convert::Wikidata::Object::People' object.
                 Parameter 'editors' must be a array.
                 Editor isn't 'MARC::Convert::Wikidata::Object::People' object.
                 Parameter 'illustrators' must be a array.
                 Illustrator isn't 'MARC::Convert::Wikidata::Object::People' object.
                 Parameter 'translators' must be a array.
                 Translator isn't 'MARC::Convert::Wikidata::Object::People' object.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Data::Printer;
 use MARC::Convert::Wikidata::Object;
 use MARC::Convert::Wikidata::Object::People;
 use Unicode::UTF8 qw(decode_utf8);
 
 my $aut = MARC::Convert::Wikidata::Object::People->new(
 	'date_of_birth' => '1952-12-08',
 	'name' => decode_utf8('Jiří'),
 	'nkcr_aut' => 'jn20000401266',
 	'surname' => 'Jurok',
 );
 
 my $obj = MARC::Convert::Wikidata::Object->new(
 	'authors' => [$aut],
 	'ccnb' => 'cnb001188266',
 	'date_of_publication' => 2002,
 	'edition_number' => 2,
 	'isbn-10' => '80-238-9541-9',
 	'number_of_pages' => 414,
 	'place_of_publication' => decode_utf8('Příbor'),
 	'publisher' => decode_utf8('Město Příbor'),
 );
 
 p $obj;

 # Output:
 # MARC::Convert::Wikidata::Object  {
 #     Parents       Mo::Object
 #     public methods (7) : BUILD, can (UNIVERSAL), DOES (UNIVERSAL), full_name, check_array_object (Mo::utils), isa (UNIVERSAL), VERSION (UNIVERSAL)
 #     private methods (1) : __ANON__ (Mo::is)
 #     internals: {
 #         authors                [
 #             [0] MARC::Convert::Wikidata::Object::People
 #         ],
 #         ccnb                   "cnb001188266",
 #         date_of_publication    2002,
 #         edition_number         2,
 #         isbn-10                "80-238-9541-9",
 #         number_of_pages        414,
 #         place_of_publication   "Příbor",
 #         publisher              "Město Příbor"
 #     }
 # }

=head1 DEPENDENCIES

L<Mo>,
L<Mo::utils>.

=head1 SEE ALSO

=over

=item L<MARC::Convert::Wikidata>

Conversion class between MARC record and Wikidata object.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/MARC-Convert-Wikidata-Object>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2021

BSD 2-Clause License

=head1 VERSION

0.01

=cut
