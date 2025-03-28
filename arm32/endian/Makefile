# Makefile
all: endian

endian: endian.o
	gcc -g -o $@ $+

endian.o: endian.s
	as -g -o $@ $<

gdb:
	gdb ./endian

clean:
	rm -rf endian *.o
