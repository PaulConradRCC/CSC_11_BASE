# Makefile
all: arrays1_4

arrays1_4: arrays1_4.o
	gcc -g -o $@ $+

arrays1_4.o: arrays1_4.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_4 *.o
