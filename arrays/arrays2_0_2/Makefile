# Makefile
all: arrays2_0_2

arrays2_0_2: arrays2_0_2.o
	gcc -g -o $@ $+

arrays2_0_2.o: arrays2_0_2.s
	as -g -o $@ $<

clean:
	rm -rf arrays2_0_2 *.o
