# Makefile
all: digitalWriteByteForLoop

digitalWriteByteForLoop: digitalWriteByteForLoop.o
	gcc -lwiringPi -o $@ $+

digitalWriteByteForLoop.o: digitalWriteByteForLoop.s
	as -o $@ $<

clean:
	rm -rf digitalWriteByteForLoop *.o
