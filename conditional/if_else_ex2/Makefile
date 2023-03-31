# Makefile
all: if_else_ex2

if_else_ex2: if_else_ex2.o
	gcc -g -o $@ $+

if_else_ex2.o: if_else_ex2.s
	as -g -o $@ $<

clean:
	rm -rf if_else_ex2 *.o
