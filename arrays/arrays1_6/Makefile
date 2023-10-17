# Makefile
all: arrays1_6

arrays1_6: arrays1_6.o
	gcc -g -o $@ $+

arrays1_6.o: arrays1_6.s
	as -g -o $@ $<

clean:
	rm -rf arrays1_6 *.o
