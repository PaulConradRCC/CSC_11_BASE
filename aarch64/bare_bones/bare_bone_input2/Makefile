# Makefile
all: bare_bone_input2

bare_bone_input2: bare_bone_input2.o
	gcc -g -o $@ $+

bare_bone_input2.o: bare_bone_input2.s
	as -g -o $@ $<

gdb:
	gdb ./bare_bone_input2

clean:
	rm -rf bare_bone_input2 *.o
