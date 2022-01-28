package user;
use strict;
use warnings;
use Exporter;


our @ISA = qw(Exporter);
our @EXPORT = qw(User);

sub new {
    my $class= shift;
    my $self={
        _title => shift,
        _content => shift,
        _created => shift,
        _slug => shift,
        _author => shift,
    }
}


sub get_title {
    my $self = shift;
    return $self->{_title};
}


sub get_content {
    my $self = shift;
    return $self->{_content};
}


sub get_created {
    my $self = shift;
    return $self->{_created};
}


sub get_slug {
    my $self = shift;
    return $self->{_slug};
}


sub get_author {
    my $self = shift;
    return $self->{_author};
}



1;