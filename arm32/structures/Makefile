# Makefile
all: another_struc

another_struc: another_struc.o
	gcc -g -o $@ $+

another_struc.o: another_struc.s
	as -g -o $@ $<

clean:
	rm -rf another_struc *.o
