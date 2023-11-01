# Makefile
all: pass_by_reference

pass_by_reference: pass_by_reference.o
	gcc -g -o $@ $+

pass_by_reference.o: pass_by_reference.s
	as -g -o $@ $<

clean:
	rm -rf pass_by_reference *.o
