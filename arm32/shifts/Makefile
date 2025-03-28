# Makefile
all: shift_rotates_tester

shift_rotates_tester: shift_rotates_tester.o
		      gcc -o $@ $+
	
shift_rotates_tester.o: shift_rotates_tester.s
			as -o $@ $<
		
clean: 
	rm -rf shift_rotates_tester *.o
