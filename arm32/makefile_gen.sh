#
# make sure to do the following:  sudp chmod u+x makefile_gen.sh
#!/bin/bash
if  [ $1 != "" ]; then
	echo "# Makefile"
	echo "all: $1"
	echo ""
	echo "$1: $1.o"
	echo -e "\tgcc -g -o \$@ \$+"
	echo ""
	echo "$1.o: $1.s"
	echo -e "\tas -g -o \$@ \$<"
	echo ""
	echo "gdb:"
	echo -e "\tgdb ./$1"
	echo ""
	echo "clean:"
	echo -e "\trm -rf $1 *.o"
else
	echo "Usage: $0 your_filename_without_extension"
fi

