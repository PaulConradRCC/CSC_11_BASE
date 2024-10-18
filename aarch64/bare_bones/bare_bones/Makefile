# Makefile
all: bare_bones

bare_bones: bare_bones.o
	gcc -g -o $@ $+

bare_bones.o: bare_bones.s
	as -g -o $@ $<

clean:
	rm -rf bare_bones *.o
