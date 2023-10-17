# Makefile
all: arrays2_0_1

arrays2_0_1: arrays2_0_1.o
	gcc -g -o $@ $+

arrays2_0_1.o: arrays2_0_1.s
	as -g -o $@ $<

clean:
	rm -rf arrays2_0_1 *.o
