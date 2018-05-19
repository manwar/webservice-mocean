use strict;
use warnings;
use utf8;

use Test::More;

use WebService::Mocean;

my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
my $response;

$response = $mocean_api->_request();
is($response, undef, 'expect undef response');

done_testing;
