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

=pod

=encoding utf8

=head1 NAME

MARC::Convert::Wikidata::Object::People - Bibliographic Wikidata object for people defined by MARC record.

=head1 SYNOPSIS

 use MARC::Convert::Wikidata::Object::People;

 my $obj = MARC::Convert::Wikidata::Object::People->new(%params);
 my $date_of_birth = $obj->date_of_birth;
 my $date_of_death = $obj->date_of_death;
 my $name = $obj->name;
 my $nkcr_aut = $obj->nkcr_aut;
 my $surname = $obj->surname;

=head1 METHODS

=head2 C<new>

 my $obj = MARC::Convert::Wikidata::Object::People->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<date_of_birth>

Date of birth of people.

Default value is undef.

=item * C<date_of_death>

Date of death of people.

Default value is undef.

=item * C<name>

Given name of people.

Default value is undef.

=item * C<nkcr_aut>

ID in National library of the Czech Republic authority database.

Default value is undef.

=item * C<surname>

Surname of people.

Default value is undef.

=back

=head2 C<date_of_birth>

 my $date_of_birth = $obj->date_of_birth;

Get date of birth.

Returns string.

=head2 C<date_of_death>

 my $date_of_death = $obj->date_of_death;

Get date of death.

Returns string.

=head2 C<name>

 my $name = $obj->name;

Get given name.

Returns string.

=head2 C<nkcr_aut>

 my $nkcr_aut = $obj->nkcr_aut;

Get ID from National Library of the Czech Republic authority database.

Returns string.

=head2 C<surname>

 my $surname = $obj->surname;

Get surname.

Returns string.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use Data::Printer;
 use MARC::Convert::Wikidata::Object::People;
 use Unicode::UTF8 qw(decode_utf8);
 
 my $aut = MARC::Convert::Wikidata::Object::People->new(
         'date_of_birth' => '1952-12-08',
         'name' => decode_utf8('Jiří'),
         'nkcr_aut' => 'jn20000401266',
         'surname' => 'Jurok',
 );
 
 p $obj;

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Mo>.

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
