package WebService::Mocean;

use strict;
use warnings;
use 5.008_005;

use Method::Signatures;

our $VERSION = '0.01';

method new ($class: Str :$api_key, Str :$api_secret) {
    my $self = {};

    $self->{api_key} = $api_key;
    $self->{api_secret} = $api_secret;

    bless $self, $class;

    return $self;
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
