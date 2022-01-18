use strict;
use warnings;

use MARC::Convert::Wikidata::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->language, undef, 'Get default language.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'language' => 'cze',
);
is($obj->language, 'cze', 'Get explicit language.');