# Makefile
all: post_index_updating

post_index_updating: post_index_updating.o
	gcc -g -o $@ $+

post_index_updating.o: post_index_updating.s
	as -g -o $@ $<

clean:
	rm -rf post_index_updating *.o

run: ./post_index_updating
