# Makefile
all: conditional_branches_2

conditional_branches_2: conditional_branches_2.o
	gcc -g -o $@ $+

conditional_branches_2.o: conditional_branches_2.s
	as -g -o $@ $<

gdb:
	gdb ./conditional_branches_2

clean:
	rm -rf conditional_branches_2 *.o
