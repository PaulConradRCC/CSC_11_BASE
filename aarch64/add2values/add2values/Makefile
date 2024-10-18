# Makefile
all: add2values

add2values: add2values.o
	gcc -g -o $@ $+

add2values.o: add2values.s
	as -g -o $@ $<

gdb:
	gdb ./add2values

clean:
	rm -rf add2values *.o
