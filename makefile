all: ma testy
test: ma testy
	./ma
	./testy 18000
dist: cma.c ma.c testy.c
	tar -cf EScma.tar cma.c ma.c testy.c cma.h makefile
#cma: cma.o
#	gcc cma.o -o cma
testy: testy.o libcma.so
	gcc testy.o -o testy -L. -lcma
ma: ma.o libcma.so
	gcc ma.o -o ma -L. -lcma
testy.o: testy.c
	gcc -c testy.c -o testy.o
ma.o: ma.c
	gcc -c ma.c -o ma.o
cma.o: cma.c cma.h
	gcc -c cma.c -o cma.o
libcma.so: cma.o
	gcc -shared -o libcma.so cma.o
clean:
	rm -f *.o *.so
	rm ma
	rm testy
