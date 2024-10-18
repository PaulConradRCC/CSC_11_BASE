# Makefile
all: even_odd

even_odd: even_odd.o
	gcc -g -o $@ $+

even_odd.o: even_odd.s
	as -g -o $@ $<

gdb:
	gdb ./even_odd

clean:
	rm -rf even_odd *.o
