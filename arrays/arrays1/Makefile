# Makefile
all: arrays1

arrays1: arrays1.o
	gcc -g -o $@ $+

arrays1.o: arrays1.s
	as -g -o $@ $<

clean:
	rm -rf arrays1 *.o
