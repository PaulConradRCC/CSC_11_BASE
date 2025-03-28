# Makefile
all: gcd

gcd: gcd.o
	gcc -o $@ $+

gcd.o: gcd.s
	as -o $@ $<

git-clean:
	rm -rf gcd *.o
	rm -rf gcd
	git add gcd.s

clean:
	rm -rf gcd *.o
