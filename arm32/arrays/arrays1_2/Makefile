# Makefile
all: arrays1_2

arrays1_2: arrays1_2.o
	gcc -g -o $@ $+

arrays1_2.o: arrays1_2.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_2 *.o
