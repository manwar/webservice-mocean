[![Build Status](https://travis-ci.org/kianmeng/webservice-mocean.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-mocean)
[![codecov](https://codecov.io/gh/kianmeng/webservice-mocean/branch/master/graph/badge.svg)](https://codecov.io/gh/kianmeng/webservice-mocean)
[![Coverage Status](https://coveralls.io/repos/kianmeng/webservice-mocean/badge.svg?branch=master)](https://coveralls.io/r/kianmeng/webservice-mocean?branch=master)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/WebService-Mocean.png)](http://cpants.charsbar.org/dist/overview/WebService-Mocean)
[![Cpan license](https://img.shields.io/cpan/l/WebService-Mocean.svg)](https://metacpan.org/release/WebService-Mocean)
[![Cpan version](https://img.shields.io/cpan/v/WebService-Mocean.svg)](https://metacpan.org/release/WebService-Mocean)

# NAME

WebService::Mocean - Perl library for integration with MoceanSMS gateway,
https://moceanapi.com.

# SYNOPSIS

    use WebService::Mocean;
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

# DESCRIPTION

WebService::Mocean is Perl library for integration with MoceanSMS gateway,
https://moceanapi.com.

# METHODS

## new($api\_key, $api\_secret, \[%$args\])

Construct a new WebService::Mocean instance. The api\_key and api\_secret is
compulsory fields. Optionally takes additional hash or hash reference.

    # Instantiate the class.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

    # Alternative way.
    my $mocean_api = WebService::Mocean->new({api_key => 'foo', api_secret => 'bar'});

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $mocean_api = WebService::Mocean->new({api_url => 'http://example.com/api/'});

    # Alternative way.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
    $mocean_api->api_url('http://example.com/api/');

## send\_mt\_sms($to, $from, $text)

Send Mobile Terminated (MT) message, which means the message is sent from
mobile SMS provider and terminated at the to the mobile phone.

    # Send sample SMS.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
    $mocean_api->send_mt_sms('0123456789', 'ACME Ltd.', 'Hello');

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
