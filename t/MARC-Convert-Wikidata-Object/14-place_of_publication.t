use strict;
use warnings;

use MARC::Convert::Wikidata::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->place_of_publication, undef, 'Get default place of publication.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'place_of_publication' => 'Praha',
);
is($obj->place_of_publication, 'Praha', 'Get explicit place of publication.');
