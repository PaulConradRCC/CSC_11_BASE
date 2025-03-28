# Makefile
all: cmp2values

cmp2values: cmp2values.o
	gcc -g -o $@ $+

cmp2values.o: cmp2values.s
	as -g -o $@ $<

clean:
	rm -rf cmp2values *.o
