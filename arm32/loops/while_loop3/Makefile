# Makefile
all: while_loop3

while_loop3: while_loop3.o
	gcc -g -o $@ $+

while_loop3.o: while_loop3.s
	as -g -o $@ $<

clean:
	rm -rf while_loop3 *.o
