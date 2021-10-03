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
