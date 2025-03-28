# Makefile
all: conditional_branches

conditional_branches: conditional_branches.o
	gcc -g -o $@ $+

conditional_branches.o: conditional_branches.s
	as -g -o $@ $<

clean:
	rm -rf conditional_branches *.o
