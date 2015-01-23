package JRG::Cprogs;

# Cprogs.pm
# Version : v 0.1 created 01-23-2015

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(createDir writeFile);

use File::Path qw(make_path);

my $dir;

## Create dir subroutine
sub createDir
{
    $dir = $_[0];
    make_path($dir) || die "Cannot create $ARGV[0] directory\n";
}

## File write subroutine
sub writeFile
{
    my $fname = $dir.$_[0];
    splice(@_, 0, 1);
    open(FILE, ">> $fname") || die "Cannot open file: $fname\n";
    print(FILE @_);
}

1;
