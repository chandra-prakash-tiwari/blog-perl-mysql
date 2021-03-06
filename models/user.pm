package user;
use strict;
use warnings;
use Exporter;
use Scalar::Util qw(blessed);


our @ISA = qw(Exporter);
our @EXPORT = qw(get_name get_username get_password get_created);


sub new {
    my $class = shift;
    my $current_time = localtime();
    my $self = {
        _name => undef,
        _username => undef,
        _password => undef,
        _created => $current_time,
    };
    bless $self, $class;
    return $self;
}


sub get_name {
    my $self = shift;
    return $self->{_name};
}


sub set_name {
    my $self = shift;
    $self->{_name} = shift;
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


sub get_created {
    my $self = shift;
    return $self->{_created};
}

1;