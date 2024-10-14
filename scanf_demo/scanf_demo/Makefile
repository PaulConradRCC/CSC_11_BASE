# Makefile
all: scanf_demo

scanf_demo: scanf_demo.o
	gcc -g -o $@ $+

scanf_demo.o: scanf_demo.s
	as -g -o $@ $<

gdb:
	gdb ./scanf_demo

clean:
	rm -rf scanf_demo *.o
