# Makefile
all: arrays_bss_example

arrays_bss_example: arrays_bss_example.o
	gcc -g -o $@ $+

arrays_bss_example.o: arrays_bss_example.s
	as -g -o $@ $<

clean:
	rm -rf arrays_bss_example *.o
