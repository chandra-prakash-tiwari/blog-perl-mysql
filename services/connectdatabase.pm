package connectdatabase;
use strict;
use warnings;
use DBI;
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw(connectDB);


sub connectDB{
    return DBI->connect("DBI:SQLite:database=test.db", "", "", {'RaiseError' => 1});
}

1;