# Makefile
all: add_4

add_4: add_4.o
	gcc -g -o $@ $+

add_4.o: add_4.s
	as -g -o $@ $<

gdb:
	gdb ./add_4

clean:
	rm -rf add_4 *.o
