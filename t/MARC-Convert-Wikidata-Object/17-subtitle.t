use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use MARC::Convert::Wikidata::Object;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->subtitle, undef, 'Get default subtitle.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'subtitle' => 'Subtitle',
);
is($obj->subtitle, 'Subtitle', 'Get explicit subtitle.');
