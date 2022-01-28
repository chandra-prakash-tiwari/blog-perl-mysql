use strict;
use warnings;

BEGIN {
    push @INC, 'C:\Users\user\Desktop\perl\blog\services';
}

use userservice;


sub usermenu {
    print "1. Create user\n";
    print "2. Get all users\n";
    print "3. Get user\n";
    print "4. Exit\n";

    my $choice = <STDIN>;
    chomp $choice;
    return $choice;
}

sub useraction{
    my $choice = shift;
    switch ($choice) {
        case 1 {
            print "Enter name: ";
            my $name = <STDIN>;
            chomp $name;
            print "Enter username: ";
            my $username = <STDIN>;
            chomp $username;
            print "Enter password: ";
            my $password = <STDIN>;
            chomp $password;
            my $user = userservice::create_user($name, $username, $password);
            print "User created: " . $user->{name} . "\n";
        };
        case 2 {
            my $users = userservice::get_all_users();
            foreach my $user (@$users) {
                print $user->{name} . "\n";
            }
        };
        case 3 {
            print "Enter username: ";
            my $username = <STDIN>;
            chomp $username;
            print "Enter password: ";
            my $password = <STDIN>;
            chomp $password;
            my $user = userservice::get_user($username, $password);
            if ($user) {
                print "User found: " . $user->{name} . "\n";
            } else {
                print "User not found\n";
            }
        };
        else {
            print "Invalid choice\n";
        };
    }
}

useraction(usermenu());

# foreach my $ref(@{userservice::get_all_users()}){
#     print join(',', @$ref),"\n";
# }

# foreach my $e (%{userservice::get_user("test", "test")}) {
#     print join(',',VALUES %$e) . "\n";

# }

END 