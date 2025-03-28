# Makefile
all: arrays1_3

arrays1_3: arrays1_3.o
	gcc -g -o $@ $+

arrays1_3.o: arrays1_3.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_3 *.o
