package user;
use strict;
use warnings;
use Exporter;


our @ISA = qw(Exporter);
our @EXPORT = qw(user);


sub new {
    my ($class)=@_;
    my $self={
        _name => "",
        _username => "",
        _password => "",
        _created => localtime(),
    }

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