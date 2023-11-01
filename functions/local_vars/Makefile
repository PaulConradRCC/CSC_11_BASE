# Makefile
all: local_vars

local_vars: local_vars.o
	gcc -g -o $@ $+

local_vars.o: local_vars.s
	as -g -o $@ $<

clean:
	rm -rf local_vars *.o
