use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use MARC::Convert::Wikidata::Object;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->isbn_10, undef, 'Get default ISBN 10.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'isbn_10' => '80-85812-08-8',
);
is($obj->isbn_10, '80-85812-08-8', 'Get explicit ISBN 10.');
