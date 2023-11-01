# Makefile
all: printf_8_arguments

printf_8_arguments: printf_8_arguments.o
	gcc -g -o $@ $+

printf_8_arguments.o: printf_8_arguments.s
	as -g -o $@ $<

clean:
	rm -rf printf_8_arguments *.o
