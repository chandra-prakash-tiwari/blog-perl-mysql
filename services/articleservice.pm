package articleservice;
use strict;
use warnings;

BEGIN {
    push @INC, 'C:\Users\user\Desktop\perl\blog\models';
    push @INC, 'C:\Users\user\Desktop\perl\blog\services';
}

use articles;
use connectdatabase;

our @ISA = qw(Exporter);
our @EXPORT = qw();

my $db=connectdatabase::connectDB();


sub create_article_table{
    my $sql = qq(CREATE TABLE articles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        slug TEXT NOT NULL,
        content VARCHAR(500) NOT NULL,
        authorid INTEGER NOT NULL,
        created DATETIME NOT NULL,

        FOREIGN KEY (authorid) REFERENCES users(id)
    ));
    my $sth = $db->prepare($sql);
    $sth->execute();
}


sub create_article {
    my $title = shift;
    my $slug = shift;
    my $content = shift;
    my $authorid = shift;
    my $created = localtime();
    my $sql = qq(INSERT INTO articles (title, slug, content, authorid, created) VALUES (?, ?, ?, ?, ?));
    my $sth = $db->prepare($sql);
    $sth->execute($title, $slug, $content, $authorid, $created);
    my $article = get_article($slug);
    return $article;
}


sub get_article {
    my $slug = shift;
    my $sql = qq(SELECT * FROM articles WHERE slug = ?);
    my $sth = $db->prepare($sql);
    $sth->execute($slug);
    return $sth->fetchrow_hashref();
}


sub get_all_articles{
    my $sql = qq(SELECT * FROM articles);
    my $sth = $db->prepare($sql);
    $sth->execute();
    return $sth->fetchall_arrayref([]);
}



