use strict;
use warnings;

use MARC::Convert::Wikidata::Object::PublicationDate;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MARC::Convert::Wikidata::Object::PublicationDate::VERSION, 0.14, 'Version.');
