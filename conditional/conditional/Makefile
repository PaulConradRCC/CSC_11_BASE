# Makefile
all: conditional

conditional: conditional.o
	gcc -g -o $@ $+

conditional.o: conditional.s
	as -g -o $@ $<

clean:
	rm -rf conditional *.o
