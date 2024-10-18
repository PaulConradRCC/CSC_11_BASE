# Makefile
all: bare_bone_input1

bare_bone_input1: bare_bone_input1.o
	gcc -g -o $@ $+

bare_bone_input1.o: bare_bone_input1.s
	as -g -o $@ $<

gdb:
	gdb ./bare_bone_input1

clean:
	rm -rf bare_bone_input1 *.o
