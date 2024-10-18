# Makefile
all: arrays1_5

arrays1_5: arrays1_5.o
	gcc -g -o $@ $+

arrays1_5.o: arrays1_5.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_5 *.o
