use strict;
use warnings;

BEGIN {
    push @INC, 'C:\Users\user\Desktop\perl\blog\models';
    push @INC, 'C:\Users\user\Desktop\perl\blog\services';
}

use userservice;
use articleservice;
use user;
use articles;
use authentication;

my %_SESSION = {};  


sub getinput{
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

sub login {
    print "Username: ";
    my $regObj = new authentication();
    $regObj->set_username(getinput());
    print "Password: ";
    $regObj->set_password(getinput());
    my $user = userservice::authenticate($regObj);
    if ($user) {
        $_SESSION{'user'} = $user;
        return 1;
    }else{
        return 0;
    }
}

sub register{
    print "\nRegister User\n";
    my $regObj=new user();
    print "Name: ";
    $regObj->set_name(getinput);
    print "Username: ";
    $regObj->set_username(getinput);
    print "Password: ";
    $regObj->set_password(getinput);
    userservice::create_user($regObj);

    return $regObj;
}

sub create_article {
    print "\nCreate Article\n";
    my $articleObj=new articles();
    print "Title: ";
    $articleObj->set_title(getinput);
    print "Content: ";
    $articleObj->set_content(getinput);
    print "slug: ";
    $articleObj->set_slug(getinput);

    my $article = articleservice::create_article($articleObj->get_title(), $articleObj->get_content(), $articleObj->get_slug(), $_SESSION{'user'}[0]);
    return $article;
}

sub view_articles {
    print "\nView Articles\n";
    my $articles = articleservice::get_all_articles();
    foreach my $article (@$articles) {
        print join("\t", @$article) . "\n";
    }
}

sub logout {
    if(defined($_SESSION{'user'})){
        $_SESSION{'user'} = undef;
    }
}

sub mainmenu{
    if (defined($_SESSION{'user'})){
        print "\nWelcome, ".$_SESSION{'user'}[1]."\n";
        print "1. Create Article\n";
        print "2. View Articles\n";
        print "3. Logout\n";
        print "4. Exit\n";
        print "Enter your choice: ";
        my $choice = getinput;
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
        my $choice = getinput;
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

END 