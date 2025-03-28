# Makefile
all: error_example

error_example: error_example.o
	gcc -g -o $@ $+

error_example.o: error_example.s
	as -g -o $@ $<

clean:
	rm -rf error_example *.o
