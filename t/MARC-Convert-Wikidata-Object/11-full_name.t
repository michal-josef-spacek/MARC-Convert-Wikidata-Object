use strict;
use warnings;

use MARC::Convert::Wikidata::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->full_name, undef, 'Get default full name.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'title' => 'Foo',
	'subtitle' => 'Bar',
);
is($obj->full_name, 'Foo: Bar', 'Get explicit full name.');
