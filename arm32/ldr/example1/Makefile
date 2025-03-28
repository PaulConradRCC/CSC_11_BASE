# Makefile
all: ldr_example

ldr_example: ldr_example.o
	gcc -g -o $@ $+

ldr_example.o: ldr_example.s
	as -g -o $@ $<

clean:
	rm -rf ldr_example *.o
