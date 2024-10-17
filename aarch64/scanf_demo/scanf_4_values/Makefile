# Makefile
all: scanf_4_values

scanf_4_values: scanf_4_values.o
	gcc -g -o $@ $+

scanf_4_values.o: scanf_4_values.s
	as -g -o $@ $<

gdb:
	gdb ./scanf_4_values

clean:
	rm -rf scanf_4_values *.o
