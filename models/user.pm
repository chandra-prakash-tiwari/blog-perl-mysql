package user;
use strict;
use warnings;
use Exporter;


our @ISA = qw(Exporter);
our @EXPORT = qw(User);

sub new {
    my $class = shift;
    my $self = {
        _id => shift,
        _name => shift,
        _username => shift,
        _password => shift,
        _created => shift,
    };
    bless $self, $class;
    return $self;
}


sub get_id {
    my $self = shift;
    return $self->{_id};
}


sub get_name {
    my $self = shift;
    return $self->{_name};
}


sub get_username {
    my $self = shift;
    return $self->{_username};
}


sub get_password {
    my $self = shift;
    return $self->{_password};
}


sub get_created {
    my $self = shift;
    return $self->{_created};
}

1;