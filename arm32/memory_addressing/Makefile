# Makefile
all: memory_addressing

memory_addressing: memory_addressing.o
	gcc -o $@ $+

memory_addressing.o: memory_addressing.s
	as -o $@ $<

clean:
	rm -rf memory_addressing *.o
