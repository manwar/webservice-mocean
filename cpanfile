requires 'perl', '5.008005';

requires 'Moo';
requires 'Types::Standard';

requires 'namespace::clean';
requires 'strictures';

on test => sub {
    requires 'Test::More', '0.96';
};
