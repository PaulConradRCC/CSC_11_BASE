# Makefile
all: arrays_dynamic

arrays_dynamic: arrays_dynamic.o
	gcc -g -o $@ $+

arrays_dynamic.o: arrays_dynamic.s
	as -g -o $@ $<

clean:
	rm -rf arrays_dynamic *.o
