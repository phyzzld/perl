#!/home/jeff/perl5/perlbrew/perls/perl-5.20.1/bin/perl

# cprogs.pl
# Version : v 0.2 created 01-23-2015

use strict;
use warnings;

use lib "/home/jeff/scripts/perl/lib";
use JRG::Cprogs qw(createDir writeFile);

###################################################################
##                                                               ##
##                      File Templates                           ##
##                                                               ##
###################################################################

## File: Makefile
my @makefile = (" \n",
                "# Makefile\n",
                "# Created : ".localtime()."\n",
                " \n",
                "CC     =  g++\n",
                "CFLAGS = -Wall\n",
                "DEBUG  = -g\n",
                "EXE    =  ".$ARGV[0]."\n",
                " \n",
                "all: \$(EXE)\n",
                " \n",
                "clean:\n",
                "\trm -f \$(EXE)\n",
                " \n",
                $ARGV[0].": main.cpp ".$ARGV[0].".cpp ".$ARGV[0].".h\n",
                "\t\$(CC) \$(CFLAGS) \$(DEBUG) -o\$(EXE) main.cpp ".$ARGV[0].".cpp ".$ARGV[0].".h\n");

## File: main.cpp
my @main = (" \n",
            "// main.cpp\n",
            "// Created : ".localtime()."\n",
            " \n",
            "#include \"".$ARGV[0].".h\"\n",
            "#include <stdlib.h>\n",
            " \n",
            "int main(int argc, char** argv)\n",
            "{\n",
            "    int ret = 0;\n",
            "    int cnt = 0;\n",
            "    if (argc >= 2)\n",
            "        cnt = atoi(argv[1]);\n",
            "    do {\n",
            "        ret = ".$ARGV[0]."(cnt);\n",
            "    } while(cnt > 0);\n",
            "    return(ret);\n",
            "}\n");

## File: src_file.h
my @header = (" \n",
            "// ".$ARGV[0].".h\n",
            "// Created : ".localtime()."\n",
            " \n",
            "#ifndef ".uc($ARGV[0])."_H\n",
            " \n",
            "#include <iostream>\n",
            " \n",
            "using std::cin;\n",
            "using std::cout;\n",
            "using std::endl;\n",
            "using std::string;\n",
            " \n",
            "int ".$ARGV[0]."(int& cnt);\n",
            " \n",
            "#endif\n");

## File: src_file.cpp
my @cpp = (" \n",
            "// ".$ARGV[0].".cpp\n",
            "// Created : ".localtime()."\n",
            " \n",
            "#include \"".$ARGV[0].".h\"\n",
            " \n",
            "int ".$ARGV[0]."(int& cnt)\n",
            "{\n",
            "    int ret = 0;\n",
            "    --cnt;\n",
            " \n",
            "    return(ret);\n",
            "}\n");

###################################################################
###################################################################

## Create base directory
createDir("/home/jeff/cprogs/".$ARGV[0]."/");

## Create files
writeFile("Makefile",      @makefile);
writeFile("main.cpp",          @main);
writeFile($ARGV[0].".h",     @header);
writeFile($ARGV[0].".cpp",      @cpp);




