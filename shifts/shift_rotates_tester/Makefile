# Makefile
all: shift_rotates_tester

shift_rotates_tester: shift_rotates_tester.o
	gcc -g -o $@ $+

shift_rotates_tester.o: shift_rotates_tester.s
	as -g -o $@ $<

gdb:
	gdb ./shift_rotates_tester

clean:
	rm -rf shift_rotates_tester *.o
