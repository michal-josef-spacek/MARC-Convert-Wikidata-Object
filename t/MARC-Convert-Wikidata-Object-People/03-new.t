use strict;
use warnings;

use MARC::Convert::Wikidata::Object::People;
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = MARC::Convert::Wikidata::Object::People->new;
isa_ok($obj, 'MARC::Convert::Wikidata::Object::People');

# Test.
$obj = MARC::Convert::Wikidata::Object::People->new(
	date_of_birth => '1814',
	date_of_death => '1883',
	name => decode_utf8('Antonín'),
	nkcr_aut => 'jk01033252',
	surname => 'Halouzka',
);
isa_ok($obj, 'MARC::Convert::Wikidata::Object::People', 'Full object.');
