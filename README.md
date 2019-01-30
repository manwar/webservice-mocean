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

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-mocean](https://github.com/kianmeng/webservice-mocean).

## Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-mocean .
    $ docker run -it -v $(pwd):/root webservice-mocean bash
    # cpanm --installdeps --notest .

## Milla

Setting up the required packages.

    $ milla authordeps --missing | cpanm
    $ milla listdeps --missing | cpanm

Check you code coverage.

    $ milla cover

Several ways to run the test.

    $ milla test
    $ milla test --author --release
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla test
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla run prove t/01_instantiation.t
    $ LOGGING=1 milla run prove t/t/02_request.t

Release the module.

    $ milla build
    $ milla release

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

## sms->send($params)

Send Mobile Terminated (MT) message, which means the message is sent from
mobile SMS provider and terminated at the to the mobile phone.

    # Send sample SMS.
    my $response = $mocean_api->sms->send({
        'mocean-to' => '0123456789',
        'mocean-from' => 'ACME Ltd.',
        'mocean-text' => 'Hello'
    });

## sms->send\_verification\_code($params)

Send a random code for verification to a mobile number.

    my $response = $mocean_api->sms->send_verification_code({
        'mocean-to' => '0123456789',
        'mocean-brand' => 'ACME Ltd.',
    });

## sms->check\_verification\_code($params)

Check the verfication code received from your user.

    my $response = $mocean_api->sms->check_verification_code({
        'mocean-reqid' => '395935',
        'mocean-code' => '234839',
    });

## account->get\_balance()

Get your Mocean account balance.

    my $response = $mocean_api->account->get_balance();

## account->get\_pricing()

Get your Mocean account pricing and supported destination.

    my $response = $mocean_api->account->get_pricing();

## report->get\_message\_status($params)

Get the outbound SMS current status.

    my $response = $mocean_api->report->get_message_status({
        'mocean-msgid' => 123456
    });

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
