# Makefile
all: arrays_data_example

arrays_data_example: arrays_data_example.o
	gcc -g -o $@ $+

arrays_data_example.o: arrays_data_example.s
	as -g -o $@ $<

clean:
	rm -rf arrays_data_example *.o
