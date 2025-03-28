# Makefile
all: arrays2_0_3

arrays2_0_3: arrays2_0_3.o
	gcc -g -o $@ $+

arrays2_0_3.o: arrays2_0_3.s
	as -g -o $@ $<

clean:
	rm -rf arrays2_0_3 *.o
