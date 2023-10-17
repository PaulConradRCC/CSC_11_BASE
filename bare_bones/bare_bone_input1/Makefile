# Makefile
all: bare_bone_input1

bare_bone_input1: bare_bone_input1.o
	gcc -g -o $@ $+

bare_bone_input1.o: bare_bone_input1.s
	as -g -o $@ $<

clean:
	rm -rf bare_bone_input1 *.o
