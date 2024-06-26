package MARC::Convert::Wikidata::Object::People;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils::Date 0.04 qw(check_date check_date_order);

our $VERSION = 0.05;

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

has work_period_start => (
	is => 'ro',
);

has work_period_end => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	check_date($self, 'date_of_birth');
	check_date($self, 'date_of_death');

	check_date_order($self, 'date_of_birth', 'date_of_death');

	check_date($self, 'work_period_start');
	check_date($self, 'work_period_end');

	check_date_order($self, 'work_period_start', 'work_period_end');

	return;
}

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
 my $work_period_start = $obj->work_period_start;
 my $work_period_end = $obj->work_period_end;

=head1 METHODS

=head2 C<new>

 my $obj = MARC::Convert::Wikidata::Object::People->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<date_of_birth>

Date of birth of people.

Parameter is string with date. See L<Mo::utils::Date/check_date> for more information.

Default value is undef.

=item * C<date_of_death>

Date of death of people.

Parameter is string with date. See L<Mo::utils::Date/check_date> for more information.

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

=head2 C<work_period_start>

 my $work_period_start = $obj->work_period_start;

Get start date of work period.

Returns string.

=head2 C<work_period_end>

 my $work_period_end = $obj->work_period_end;

Get end date of work period.

Returns string.

=head1 ERRORS

 new():
         From Mo::utils::Date::check_date():
                 Parameter 'date_of_birth' for date is in bad format.
                 Parameter 'date_of_birth' has year greater than actual year.
                 Parameter 'date_of_death' for date is in bad format.
                 Parameter 'date_of_death' has year greater than actual year.
         From Mo::utils::Date::check_date_order():
                 Parameter 'date_of_birth' has date greater or same as parameter 'date_of_death' date.

=head1 EXAMPLE1

=for comment filename=create_and_dump_people.pl

 use strict;
 use warnings;

 use Data::Printer;
 use MARC::Convert::Wikidata::Object::People;
 use Unicode::UTF8 qw(decode_utf8);
 
 my $obj = MARC::Convert::Wikidata::Object::People->new(
         'date_of_birth' => '1952-12-08',
         'name' => decode_utf8('Jiří'),
         'nkcr_aut' => 'jn20000401266',
         'surname' => 'Jurok',
 );
 
 p $obj;

 # Output:
 # MARC::Convert::Wikidata::Object::People  {
 #     Parents       Mo::Object
 #     public methods (7) : BUILD, can (UNIVERSAL), DOES (UNIVERSAL), err (Error::Pure), check_date (Mo::utils::Date), isa (UNIVERSAL), VERSION (UNIVERSAL)
 #     private methods (1) : __ANON__ (Mo::build)
 #     internals: {
 #         date_of_birth   "1952-12-08",
 #         name            "Jiří",
 #         nkcr_aut        "jn20000401266",
 #         surname         "Jurok"
 #     }
 # }

=head1 DEPENDENCIES

L<Mo>,
L<Mo::utils::Date>.

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

© Michal Josef Špaček 2021-2024

BSD 2-Clause License

=head1 VERSION

0.05

=cut
