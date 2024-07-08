#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer;
use MARC::Convert::Wikidata::Object::PublicationDate;

my $obj = MARC::Convert::Wikidata::Object::PublicationDate->new(
        'earliest_date' => '2014',
        'latest_date' => '2020',
);

p $obj;

# Output:
# TODO