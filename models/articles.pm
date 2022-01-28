package articles;
use strict;
use warnings;
use Exporter;
use Scalar::Util qw(blessed);


our @ISA = qw(Exporter);
our @EXPORT = qw(get_title);


sub new{
    my $class = shift;
    my $self = {
        _title => undef,
        _content => undef,
        _slug => undef,
        _created => localtime(),
    };
    bless $self, $class;
    return $self;
}

sub get_title{
    my $self = shift;
    return $self->{_title};
}

sub set_title{
    my $self = shift;
    $self->{_title} = shift;
}

sub get_content{
    my $self = shift;
    return $self->{_content};
}

sub set_content{
    my $self = shift;
    $self->{_content} = shift;
}

sub get_slug{
    my $self = shift;
    return $self->{_slug};
}

sub set_slug{
    my $self = shift;
    $self->{_slug} = shift;
}

sub get_created{
    my $self = shift;
    return $self->{_created};
}


1;