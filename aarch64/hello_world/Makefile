# Makefile
all: hello_world

hello_world: hello_world.o
	gcc -g -o $@ $+

hello_world.o: hello_world.s
	as -g -o $@ $<

clean:
	rm -rf hello_world *.o
