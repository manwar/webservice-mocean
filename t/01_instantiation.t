use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Mocean;

my $mocean;
my $api_key = 'foobar';
my $api_secret = 'barfoo';

$mocean = WebService::Ocean->new(
    api_key => $api_key,
    api_secret => $api_secret
);

done_testing;
