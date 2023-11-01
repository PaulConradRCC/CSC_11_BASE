# Makefile
all: two_xplusy

two_xplusy: two_xplusy.o
	gcc -g -o $@ $+

two_xplusy.o: two_xplusy.s
	as -g -o $@ $<

clean:
	rm -rf two_xplusy *.o
