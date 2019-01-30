use strict;
use warnings;
use utf8;

use Test::More;
use Test::Exception;

use WebService::Mocean;

my ($got, $expect, $params) = ('', '', {});
my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

$params = {
    'mocean-msgid' => 1,
};

$got = $mocean_api->report->get_message_status($params);
is($got->{status}, 1, 'expect error');

done_testing;
