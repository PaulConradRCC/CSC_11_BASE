# Makefile
all: arr_demo_102919_2

arr_demo_102919_2: arr_demo_102919_2.o
	gcc -g -o $@ $+

arr_demo_102919_2.o: arr_demo_102919_2.s
	as -g -o $@ $<

clean:
	rm -rf arr_demo_102919_2 *.o
