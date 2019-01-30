use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my ($got, $expect) = ('', '');
my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

$got = $mocean_api->account->get_pricing();
is($got->{status}, 1, 'expect error');

done_testing;
