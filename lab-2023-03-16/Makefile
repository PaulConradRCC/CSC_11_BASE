# Makefile
all: lab-2023-03-16

lab-2023-03-16: lab-2023-03-16.o
	gcc -g -o $@ $+

lab-2023-03-16.o: lab-2023-03-16.s
	as -g -o $@ $<

clean:
	rm -rf lab-2023-03-16 *.o
