# Makefile
all: arrays1_7

arrays1_7: arrays1_7.o
	gcc -g -o $@ $+

arrays1_7.o: arrays1_7.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_7 *.o
