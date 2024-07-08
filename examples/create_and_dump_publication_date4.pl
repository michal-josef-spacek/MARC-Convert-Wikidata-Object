#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer;
use MARC::Convert::Wikidata::Object::PublicationDate;

my $obj = MARC::Convert::Wikidata::Object::PublicationDate->new(
        'date' => '2014',
        'sourcing_circumstances' => 'circa',
);

p $obj;

# Output:
# TODO