package MARC::Convert::Wikidata::Object::People;

use strict;
use warnings;

use Mo qw(is);

our $VERSION = 0.01;

has date_of_birth => (
	is => 'ro',
);

has date_of_death => (
	is => 'ro',
);

has name => (
	is => 'ro',
);

has nkcr_aut => (
	is => 'ro',
);

has surname => (
	is => 'ro',
);

1;

__END__
