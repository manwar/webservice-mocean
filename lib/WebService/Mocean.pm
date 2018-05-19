package WebService::Mocean;

use utf8;

use Moo;
use Types::Standard qw(Str);

use strictures 2;
use namespace::clean;

with 'Role::REST::Client';

our $VERSION = '0.01';

has api_url => (
    isa => Str,
    is => 'rw',
    default => sub { 'https://rest-api.moceansms.com/rest/1' },
);

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

sub BUILD {
    my ($self, $args) = @_;

    $self->set_persistent_header('User-Agent' => __PACKAGE__ . q| |
          . ($WebService::Mocean::VERSION || q||));

    $self->server($self->api_url);
    $self->api_key($args->{api_key});
    $self->api_secret($args->{api_secret});

    return $self;
}

sub _request {
    my ($self, $command, $queries, $format, $method) = @_;

    $command ||= q||;
    $queries ||= {};
    $format ||= 'json';
    $method ||= 'get';

    # In case the api_url was updated.
    $self->server($self->api_url);
    $self->type(qq|application/$format|);

    my $path = $command . "/";

    my $response;
    if ($self->can($method)) {
        $response = $self->$method($path, $queries);
    }
    else {
        die "No such HTTP method: $method";
    }

    return $response->data if ($response->code eq '200');

    return;
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Mocean - Perl library for integration with MoceanSMS gateway,
https://dev.moceansms.com.

=head1 SYNOPSIS

  use WebService::Mocean;

=head1 DESCRIPTION

WebService::Mocean is Perl library for integration with MoceanSMS gateway,
https://dev.moceansms.com.

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2018 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>
