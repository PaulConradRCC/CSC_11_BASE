# Makefile
all: div_mod_1

div_mod_1: div_mod_1.o
	gcc -g -o $@ $+

div_mod_1.o: div_mod_1.s
	as -g -o $@ $<

clean:
	rm -rf div_mod_1 *.o
