#!/usr/bin/perl -w

use strict;
use warnings;

$| = 1;

use Test::More;

eval {
	require Pod::Checker;
	my $checker = Pod::Checker->new();
	$checker->parse_from_file('lib/Class/Proxy/Lite.pm', \*STDOUT);
	plan tests => 2;
	is( $checker->num_errors(),      0        , 'POD validity' );
	is( $checker->name(), 'Class::Proxy::Lite', 'POD name'     );
};

plan skip_all => "Couldn't test POD docs (this is not a problem)"
	if $@;

