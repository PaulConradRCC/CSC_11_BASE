# Makefile
all: add_2

add_2: add_2.o
	gcc -g -o $@ $+

add_2.o: add_2.s
	as -g -o $@ $<

clean:
	rm -rf add_2 *.o
