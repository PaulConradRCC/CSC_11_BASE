# Makefile
all: arrays_2d

arrays_2d: arrays_2d.o
	gcc -g -o $@ $+

arrays_2d.o: arrays_2d.s
	as -g -o $@ $<

clean:
	rm -rf arrays_2d *.o
