package userservice;
use strict;
use warnings;

BEGIN {
    push @INC, 'C:\Users\user\Desktop\perl\blog\models';
    push @INC, 'C:\Users\user\Desktop\perl\blog\services';
}

use user;
use connectdatabase;

our @ISA = qw(Exporter);
our @EXPORT = qw(create_user get_all_users);

my $db=connectdatabase::connectDB();

sub create_user {
    my $name = shift;
    my $username = shift;
    my $password = shift;
    my $created = localtime();
    my $sql = qq(INSERT INTO users (name, username, password, created) VALUES (?, ?, ?, ?));
    my $sth = $db->prepare($sql);
    $sth->execute($name, $username, $password, $created);
    my $user = get_user($username, $password);
    return $user;
}


sub get_user {
    my $username = shift;
    my $password = shift;
    my $sql = qq(SELECT * FROM users WHERE username = ? AND password = ?);
    my $sth = $db->prepare($sql);
    $sth->execute($username, $password);
    return $sth->fetchrow_hashref();
}


sub get_all_users{
    my $sql = qq(SELECT * FROM users);
    my $sth = $db->prepare($sql);
    $sth->execute();
    return $sth->fetchall_arrayref([]);
}


sub create_user_table{
    my $sql = qq(CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        created DATETIME NOT NULL,
    ));
    my $sth = $db->prepare($sql);
    $sth->execute();
}

1;