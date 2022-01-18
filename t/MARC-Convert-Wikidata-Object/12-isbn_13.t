use strict;
use warnings;

use MARC::Convert::Wikidata::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MARC::Convert::Wikidata::Object->new;
is($obj->isbn_13, undef, 'Get default ISBN 13.');

# Test.
$obj = MARC::Convert::Wikidata::Object->new(
	'isbn_13' => '978-80-85812-08-4',
);
is($obj->isbn_13, '978-80-85812-08-4', 'Get explicit ISBN 13.');
