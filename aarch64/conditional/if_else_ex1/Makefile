# Makefile
all: conditional_if_else_ex1

conditional_if_else_ex1: conditional_if_else_ex1.o
	gcc -g -o $@ $+

conditional_if_else_ex1.o: conditional_if_else_ex1.s
	as -g -o $@ $<

gdb:
	gdb ./conditional_if_else_ex1

clean:
	rm -rf conditional_if_else_ex1 *.o
