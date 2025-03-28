# Makefile
all: arrays3d

arrays3d: arrays3d.o
	gcc -g -o $@ $+

arrays3d.o: arrays3d.s
	as -g -o $@ $<

clean:
	rm -rf arrays3d *.o
