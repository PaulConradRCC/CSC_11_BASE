# Makefile
all: arrays_bss_110419

arrays_bss_110419: arrays_bss_110419.o
	gcc -g -o $@ $+

arrays_bss_110419.o: arrays_bss_110419.s
	as -g -o $@ $<

clean:
	rm -rf arrays_bss_110419 *.o
