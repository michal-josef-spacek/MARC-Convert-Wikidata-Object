use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Bibliographic Wikidata object defined by MARC record.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'MARC-Convert-Wikidata-Object';
perl_version 5.006002;
readme_from 'Object.pm';
recursive_author_tests('xt');
requires 'Mo' => 0;
requires 'Mo::Utils' => 0.06;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/MARC-Convert-Wikidata-Object/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/MARC-Convert-Wikidata-Object';
resources 'repository' => 'git://github.com/michal-josef-spacek/MARC-Convert-Wikidata-Object';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Unicode::UTF8' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
