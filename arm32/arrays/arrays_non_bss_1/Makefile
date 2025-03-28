# Makefile
all: arrays_non_bss_1

arrays_non_bss_1: arrays_non_bss_1.o
	gcc -g -o $@ $+

arrays_non_bss_1.o: arrays_non_bss_1.s
	as -g -o $@ $<

clean:
	rm -rf arrays_non_bss_1 *.o
