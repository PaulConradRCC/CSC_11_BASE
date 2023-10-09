# Makefile
all: shifts

shifts: shifts.o
	gcc -g -o $@ $+

shifts.o: shifts.s
	as -g -o $@ $<

clean:
	rm -rf shifts *.o
