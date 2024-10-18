# Makefile
all: even_odd_unsigned

even_odd_unsigned: even_odd_unsigned.o
	gcc -g -o $@ $+

even_odd_unsigned.o: even_odd_unsigned.s
	as -g -o $@ $<

gdb:
	gdb ./even_odd_unsigned

clean:
	rm -rf even_odd_unsigned *.o
