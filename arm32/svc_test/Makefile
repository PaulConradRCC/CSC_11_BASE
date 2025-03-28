# Makefile
all: svc_test

svc_test: svc_test.o
	gcc -o $@ $+

svc_test.o: svc_test.s
	as -o $@ $<

clean:
	rm -rf svc_test *.o
