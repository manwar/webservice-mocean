use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
my $response;

$response = $mocean_api->_request();
is($response, undef, 'expect undef response');

dies_ok {
    $mocean_api->_request(undef, undef, undef, 'gets')
} 'expect die on invalid HTTP verb';

done_testing;
