# Makefile
all: arrays_bss_1

arrays_bss_1: arrays_bss_1.o
	gcc -g -o $@ $+

arrays_bss_1.o: arrays_bss_1.s
	as -g -o $@ $<

clean:
	rm -rf arrays_bss_1 *.o
