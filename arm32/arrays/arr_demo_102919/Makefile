# Makefile
all: arr_demo_102919

arr_demo_102919: arr_demo_102919.o
	gcc -g -o $@ $+

arr_demo_102919.o: arr_demo_102919.s
	as -g -o $@ $<

clean:
	rm -rf arr_demo_102919 *.o
