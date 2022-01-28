package authentication;
use strict;
use warnings;
use Exporter;
use Scalar::Util qw(blessed);


our @ISA = qw(Exporter);
our @EXPORT = qw();


sub new {
    my $class = shift;
    my $self = {
        _username => undef,
        _password => undef,
    };
    bless $self, $class;
    return $self;
}


sub get_username {
    my $self = shift;
    return $self->{_username};
}


sub set_username {
    my $self = shift;
    $self->{_username} = shift;
}


sub get_password {
    my $self = shift;
    return $self->{_password};
}


sub set_password {
    my $self = shift;
    $self->{_password} = shift;
}

1;