use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my ($got, $expect, $params) = ('', '', {});
my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

$params = {
    'mocean-to' => 1,
    'mocean-brand' => 1
};

$got = $mocean_api->sms->send_verification_code($params);
is($got->{status}, 1, 'expect error');

done_testing;
