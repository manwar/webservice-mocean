use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my ($got, $expect, $params, $required_fields) = ('', '', {}, []);

my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

$params = {
    'mocean-from' => 1,
    'mocean-to' => 1,
    'mocean-text' => 1
};

#
$required_fields = [keys %$params];
$got = $mocean_api->_check_required_params($params, $required_fields);
is($got, 0, 'except no error throw');

#
$required_fields = [qw(mocean-from mocean-foo mocean-bar)];
dies_ok {
    $got = $mocean_api->_check_required_params($params, $required_fields);
} 'expect die on missing required params';

done_testing;
