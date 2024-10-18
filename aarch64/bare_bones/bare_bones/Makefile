# Makefile
all: bare_bones

bare_bones: bare_bones.o
	gcc -g -o $@ $+

bare_bones.o: bare_bones.s
	as -g -o $@ $<

gdb:
	gdb ./bare_bones

clean:
	rm -rf bare_bones *.o
