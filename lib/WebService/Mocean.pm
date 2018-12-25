package WebService::Mocean;

use utf8;

use Moo;
use Types::Standard qw(Str Ref);

use strictures 2;
use namespace::clean;

use WebService::Mocean::Client;

our $VERSION = '0.04';

has api_key => (
    isa => Str,
    is => 'rw',
    required => 1
);

has api_secret => (
    isa => Str,
    is => 'rw',
    required => 1
);

has api_url => (
    isa => Str,
    is => 'rw',
    default => sub { 'https://rest.moceanapi.com/rest/1' },
);

has client => (
    is => 'lazy'
);

sub _build_client {
    my $self = shift;

    my $client = WebService::Mocean::Client->new(
        api_key => $self->api_key,
        api_secret => $self->api_secret,
        api_url => $self->api_url,
    );

    return $client;
}

sub send_sms {
    my ($self, $params) = @_;

    return $self->client->request('sms', $params, 'post');
}

sub send_verification_code {
    my ($self, $params) = @_;

    return $self->client->request('verify/req', $params, 'post');
}

sub check_verification_code {
    my ($self, $params) = @_;

    return $self->client->request('verify/check', $params, 'post');
}

sub get_account_balance {
    my ($self) = @_;

    return $self->client->_request('account/balance', undef, 'get');
}

sub get_account_pricing {
    my ($self) = @_;

    return $self->client->request('account/pricing', undef, 'get');
}

sub get_message_status {
    my ($self, $params) = @_;

    return $self->client->request('report/message', $params, 'get');
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Mocean - Perl library for integration with MoceanSMS gateway,
https://moceanapi.com.

=head1 SYNOPSIS

  use WebService::Mocean;
  my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

=head1 DESCRIPTION

WebService::Mocean is Perl library for integration with MoceanSMS gateway,
https://moceanapi.com.

=head1 DEVELOPMENT

Source repo at L<https://github.com/kianmeng/webservice-mocean|https://github.com/kianmeng/webservice-mocean>.

=head2 Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-mocean .
    $ docker run -it -v $(pwd):/root webservice-mocean bash
    # cpanm --installdeps --notest .

=head2 Milla

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

=head1 METHODS

=head2 new($api_key, $api_secret, [%$args])

Construct a new WebService::Mocean instance. The api_key and api_secret is
compulsory fields. Optionally takes additional hash or hash reference.

    # Instantiate the class.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');

    # Alternative way.
    my $mocean_api = WebService::Mocean->new({api_key => 'foo', api_secret => 'bar'});

=head3 api_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $mocean_api = WebService::Mocean->new({api_url => 'http://example.com/api/'});

    # Alternative way.
    my $mocean_api = WebService::Mocean->new(api_key => 'foo', api_secret => 'bar');
    $mocean_api->api_url('http://example.com/api/');

=head2 send_sms($params)

Send Mobile Terminated (MT) message, which means the message is sent from
mobile SMS provider and terminated at the to the mobile phone.

    # Send sample SMS.
    my $response = $mocean_api->send_sms({
        'mocean-to' => '0123456789',
        'mocean-from' => 'ACME Ltd.',
        'mocean-text' => 'Hello'
    });

=head2 send_verification_code($params)

Send a random code for verification to a mobile number.

    my $response = $mocean_api->send_verification_code({
        'mocean-to' => '0123456789',
        'mocean-brand' => 'ACME Ltd.',
    });

=head2 check_verification_code($params)

Check the verfication code received from your user.

    my $response = $mocean_api->check_verification_code({
        'mocean-reqid' => '395935',
        'mocean-code' => '234839',
    });

=head2 get_account_balance()

Get your Mocean account balance.

    my $response = $mocean_api->get_account_balance();

=head2 get_account_pricing()

Get your Mocean account pricing and supported destination.

    my $response = $mocean_api->get_account_pricing();

=head2 get_message_status($params)

Get the outbound SMS current status.

    my $response = $mocean_api->get_message_status({
        'mocean-msgid' => 123456
    });

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>
