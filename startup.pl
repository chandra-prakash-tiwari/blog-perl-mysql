use strict;
use warnings;

BEGIN {
    push @INC, 'C:\Users\user\Desktop\perl\blog\models';
    push @INC, 'C:\Users\user\Desktop\perl\blog\services';
}

use userservice;
use articleservice;
use user;

our $_SESSION;


sub login {
    my $username = shift;
    my $password = shift;
    my $user = userservice::get_user($username, $password);
    #login success
    if ($user) {
        $_SESSION{'user'} = $user;
        return 1;
    }else{
        #login fail
        return 0;
    }
}

sub register{
    print "register";
    $regObj=user::new();
    print "Name: ";
    $regObj->setName(<STDIN>);
    print "Username: ";
    $regObj->setUsername(<STDIN>);
    print "Password: ";
    $regObj->setPassword(<STDIN>);
    $_SESSION{'user'} = userservice::create_user($regObj->getName(), $regObj->getUsername(), $regObj->getPassword(), $regObj->getCreated());

    return $regObj;
}

sub create_article {
    my $title = shift;
    my $slug = shift;
    my $content = shift;
    my $authorid = shift;
    my $created = localtime();
    my $article = articleservice::create_article($title, $slug, $content, $authorid, $created);
    return $article;
}

sub view_articles {

}

sub logout {
    if(defined($_SESSION{'user'})){
        delete $_SESSION{'user'};
    }
}

sub mainmenu{
    if (defined($_SESSION{'user'})){
        print "Welcome, ".$_SESSION{'user'}->get_name()."!<br>";
        print "1. Create Article\n";
        print "2. View Articles\n";
        print "3. Logout\n";
        print "4. Exit\n";
        print "Enter your choice: ";
        my $choice = <STDIN>;
        chomp $choice;
        if ($choice == 1){
            create_article();
        }
        elsif ($choice == 2){
            view_articles();
        }
        elsif ($choice == 3){
            logout();
        }
        elsif ($choice == 4){
            exit();
        }
        else{
            print "Invalid choice\n";
            mainmenu();
        }
    }
    else{
        print "1. Login\n";
        print "2. Register\n";
        print "3. Exit\n";
        print "Enter your choice: ";
        my $choice = <STDIN>;
        chomp $choice;
        if ($choice == 1){
            if (login()){
                mainmenu();
            }
            else{
                print "Login failed\n";
                mainmenu();
            }
        }
        elsif ($choice == 2){
            if (register()){
                mainmenu();
            }
            else{
                print "Registration failed\n";
                mainmenu();
            }
        }
        elsif ($choice == 3){
            exit();
        }
        else{
            print "Invalid choice\n";
            mainmenu();
        }
    }
}

sub intiate{
    do{
        mainmenu();
    }while(1);
}

intiate();

# foreach my $ref(@{userservice::get_all_users()}){
#     print join(',', @$ref),"\n";
# }

# foreach my $e (%{userservice::get_user("test", "test")}) {
#     print join(',',VALUES %$e) . "\n";

# }

END 