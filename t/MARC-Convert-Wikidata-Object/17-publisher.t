use strict;
use warnings;

use MARC::Convert::Wikidata::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->publisher, undef, 'Get default publisher.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'publisher' => decode_utf8('Vyšehrad'),
);
is($obj->publisher, decode_utf8('Vyšehrad'), 'Get explicit publisher.');
