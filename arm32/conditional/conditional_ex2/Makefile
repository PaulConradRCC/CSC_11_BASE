# Makefile
all: conditional_ex2

conditional_ex2: conditional_ex2.o
	gcc -g -o $@ $+

conditional_ex2.o: conditional_ex2.s
	as -g -o $@ $<

clean:
	rm -rf conditional_ex2 *.o
