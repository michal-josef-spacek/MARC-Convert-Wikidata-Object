package MARC::Convert::Wikidata::Object::Utils;

use base qw(Exporter);
use strict;
use warnings;

use DateTime;
use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_date);

our $VERSION = 0.01;

sub check_date {
	my ($self, $key) = @_;

	if (! exists $self->{$key}) {
		return;
	}

	if (! defined $self->{$key}) {
		return;
	}

	# Check year format.
	if ($self->{$key} !~ m/^\-?(\d{1,4})\-?\d{0,2}\-?\d{0,2}$/ms) {
		err "Parameter '$key' is in bad format.";
	}
	my $year = $1;

	# Check year greater than actual.
	if ($year > DateTime->now->year) {
		err "Parameter '$key' has year greater than actual year.";
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

MARC::Convert::Wikidata::Object::Utils - MARC::Convert::Wikidata::Object utilities.

=head1 SYNOPSIS

 use MARC::Convert::Wikidata::Object::Utils qw(check_date);

 check_date($self, $key);

=head1 DESCRIPTION

Utilities for checking of data values.

=head1 SUBROUTINES

=head2 C<check_date>

 check_date($self, $key);

Check parameter defined by C<$key> which is date and that date isn't greater
than actual year.

Possible dates:
 - YYYY-MM-DD
 - YYYY-M-D
 - YYYY-MM
 - YYYY-M
 - YYYY

Put error if check isn't ok.

Returns undef.

=head1 ERRORS

 check_date():
         Parameter '%s' for date is in bad format.
         Parameter '%s' has year greater than actual year.

=head1 EXAMPLE1

 use strict;
 use warnings;

 use MARC::Convert::Wikidata::Object::Utils qw(check_date);

 my $self = {
         'key' => '2022-01-15',
 };
 check_date($self, 'key');

 # Print out.
 print "ok\n";

 # Output:
 # ok

=head1 EXAMPLE2

 use strict;
 use warnings;

 use Error::Pure;
 use MARC::Convert::Wikidata::Object::Utils qw(check_date);

 $Error::Pure::TYPE = 'Error';

 my $self = {
         'key' => 'foo',
 };
 check_date($self, 'key');

 # Print out.
 print "ok\n";

 # Output like:
 # #Error [..Utils.pm:?] Parameter 'key' is in bad format.

=head1 DEPENDENCIES

L<DateTime>,
L<Exporter>,
L<Error::Pure>,
L<Readonly>.

=head1 SEE ALSO

=over

=item L<Mo::utils>

Mo utilities.

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
