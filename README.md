# NAME

WebService::Mocean - Perl library for integration with MoceanSMS gateway,
https://dev.moceansms.com.

# SYNOPSIS

    use WebService::Mocean;
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

# DESCRIPTION

WebService::Mocean is Perl library for integration with MoceanSMS gateway,
https://dev.moceansms.com.

# METHODS

## new(api\_key, api\_secret, \[%$args\])

Construct a new WebService::Mocean instance. The api\_key and api\_secret is
compulsory fields. Optionally takes additional hash or hash reference.

    # Instantiate the class.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

    # Alternative way.
    my $mocean_api = WebService::Mocean->new({api_key => 'foo', api_secret => 'bar'});

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $pokemon_api = WebService::Pokemon->new({api_url => 'http://example.com/api/'});

    # Alternative way.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
    $mocean_api->api_url('http://example.com/api/');

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian Meng, Ang <kianmeng@users.noreply.github.com>
