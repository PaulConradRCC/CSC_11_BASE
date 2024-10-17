# Makefile
all: printf_demo_opt

printf_demo_opt: printf_demo_opt.o
	gcc -g -o $@ $+

printf_demo_opt.o: printf_demo_opt.s
	as -g -o $@ $<

gdb:
	gdb ./printf_demo_opt

clean:
	rm -rf printf_demo_opt *.o
