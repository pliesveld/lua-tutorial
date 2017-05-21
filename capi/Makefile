
.PHONY:clean

mylib.so:mylib.o
	clang -shared -llua mylib.o -o mylib.so

mylib.o:mylib.c mylib.h
	clang -c mylib.c -fpic

clean:
	rm -f mylib.o mylib.so
