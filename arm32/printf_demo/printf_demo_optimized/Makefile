# Makefile
all: printf_demo

printf_demo: printf_demo.o
	gcc -g -o $@ $+

printf_demo.o: printf_demo.s
	as -g -o $@ $<

gdb:
	gdb ./printf_demo

clean:
	rm -rf printf_demo *.o
