# Makefile
all: printf_demo

printf_demo: printf_demo.o
	gcc -o $@ $+

printf_demo.o: printf_demo.s
	as -o $@ $<

clean:
	rm -rf printf_demo *.o
