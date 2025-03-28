# Makefile
all: add_3

add_3: add_3.o
	gcc -g -o $@ $+

add_3.o: add_3.s
	as -g -o $@ $<

clean:
	rm -rf add_3 *.o
