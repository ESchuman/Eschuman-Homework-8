all: ma testy
debug: ma.c testy.c cma.c cma.h debug.h
	gcc -c cma.c -o debugcma.o -D DODEBUG
	gcc -shared debugcma.o -o libdebugcma.so
	gcc -c ma.c -o debugma.o
	gcc -c testy.c -o debugtesty.o
	gcc debugma.o -o debugma -L. -ldebugcma
	gcc debugtesty.o -o debugtesty -L. -ldebugcma
test: ma testy
	./ma
	./testy 18000
dist: cma.c ma.c testy.c
	tar -cf EScma.tar cma.c ma.c testy.c debug.h cma.h makefile
testy: testy.o libcma.so
	gcc testy.o -o testy -L. -lcma
ma: ma.o libcma.so
	gcc ma.o -o ma -L. -lcma
testy.o: testy.c
	gcc -c testy.c -o testy.o
ma.o: ma.c debug.h
	gcc -c ma.c -o ma.o
cma.o: cma.c cma.h debug.h
	gcc -c cma.c -o cma.o
libcma.so: cma.o
	gcc -shared -o libcma.so cma.o
clean:
	rm -f *.o *.so
	rm ma
	rm testy
	rm debugma
	rm debugtesty
