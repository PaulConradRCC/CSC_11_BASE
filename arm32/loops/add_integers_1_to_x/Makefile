# Makefile
all: add_integers_1_to_x

add_integers_1_to_x: add_integers_1_to_x.o
	gcc -g -o $@ $+

add_integers_1_to_x.o: add_integers_1_to_x.s
	as -g -o $@ $<

clean:
	rm -rf add_integers_1_to_x *.o
