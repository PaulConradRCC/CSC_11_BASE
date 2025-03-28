# Makefile
all: scanf_2_values

scanf_2_values: scanf_2_values.o
	gcc -g -o $@ $+

scanf_2_values.o: scanf_2_values.s
	as -g -o $@ $<

gdb:
	gdb ./scanf_2_values

clean:
	rm -rf scanf_2_values *.o
