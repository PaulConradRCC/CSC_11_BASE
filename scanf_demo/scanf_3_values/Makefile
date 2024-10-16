# Makefile
all: scanf_3_values

scanf_3_values: scanf_3_values.o
	gcc -g -o $@ $+

scanf_3_values.o: scanf_3_values.s
	as -g -o $@ $<

gdb:
	gdb ./scanf_3_values

clean:
	rm -rf scanf_3_values *.o
