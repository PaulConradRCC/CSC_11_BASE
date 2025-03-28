# Makefile
all: pre_index_updating

pre_index_updating: pre_index_updating.o
	gcc -g -o $@ $+

pre_index_updating.o: pre_index_updating.s
	as -g -o $@ $<

clean:
	rm -rf pre_index_updating *.o
