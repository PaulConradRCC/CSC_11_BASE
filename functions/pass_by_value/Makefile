# Makefile
all: pass_by_value

pass_by_value: pass_by_value.o
	gcc -g -o $@ $+

pass_by_value.o: pass_by_value.s
	as -g -o $@ $<

clean:
	rm -rf pass_by_value *.o
