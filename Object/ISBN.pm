package MARC::Convert::Wikidata::Object::ISBN;

use strict;
use warnings;

use Business::ISBN;
use Error::Pure qw(err);
use Mo qw(build is);
use Mo::utils qw(check_required);

our $VERSION = 0.01;

has isbn => (
	is => 'ro',
);

has publisher => (
	is => 'ro',
);

sub type {
	my $self = shift;

	if ($self->{'_isbn'}->as_isbn10->as_string eq $self->{'isbn'}) {
		return 10;
	} else {
		return 13;
	}
}

sub BUILD {
	my $self = shift;

	check_required($self, 'isbn');

	$self->{'_isbn'} = Business::ISBN->new($self->{'isbn'});
	if (! defined $self->{'_isbn'} || ! $self->{'_isbn'}->is_valid) {
		err "ISBN '$self->{'isbn'}' isn't valid.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

MARC::Convert::Wikidata::Object::ISBN - Bibliographic Wikidata object for ISBN number defined by MARC record.

=head1 SYNOPSIS

 use MARC::Convert::Wikidata::Object::ISBN;

 my $obj = MARC::Convert::Wikidata::Object::ISBN->new(%params);
 my $isbn = $obj->isbn;
 my $publisher = $obj->publisher;
 my $type = $obj->type;

=head1 METHODS

=head2 C<new>

 my $obj = MARC::Convert::Wikidata::Object::ISBN->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<isbn>

ISBN number.

Parameter is required.

Default value is undef.

=item * C<publisher>

Name of publishing house.

Default value is undef.

=back

=head2 C<isbn>

 my $isbn = $obj->isbn;

Get ISBN number.

Returns string.

=head2 C<publisher>

 my $publisher = $obj->publisher;

Get publishing house name.

Returns string.

=head2 C<type>

 my $type = $obj->type;

Get type of ISBN number (10 or 13 character length)

Returns number (10 or 13).

=head1 ERRORS

 new():
         Parameter 'isbn' is required.
         ISBN '%s' isn't valid.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Data::Printer;
 use MARC::Convert::Wikidata::Object::ISBN;
 
 my $obj = MARC::Convert::Wikidata::Object::Publisher->new(
         'isbn' => '978-80-00-05046-1'
         'publisher' => 'Albatros',
 );
 
 p $obj;

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Error::Pure>,
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

© Michal Josef Špaček 2021-2022

BSD 2-Clause License

=head1 VERSION

0.01

=cut
