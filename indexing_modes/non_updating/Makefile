# Makefile
all: non_updating

non_updating: non_updating.o
	gcc -g -o $@ $+

non_updating.o: non_updating.s
	as -g -o $@ $<

clean:
	rm -rf non_updating *.o
