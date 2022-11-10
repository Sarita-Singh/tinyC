parser.out: lex.yy.o y.tab.o ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o
	g++ lex.yy.o y.tab.o ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o -lfl -o parser.out

ass6_20CS10020_20CS10053_target_translator.o: ass6_20CS10020_20CS10053_target_translator.cxx ass6_20CS10020_20CS10053_translator.h
	g++ -c ass6_20CS10020_20CS10053_target_translator.cxx

ass6_20CS10020_20CS10053_translator.o: ass6_20CS10020_20CS10053_translator.cxx ass6_20CS10020_20CS10053_translator.h
	g++ -c ass6_20CS10020_20CS10053_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: ass6_20CS10020_20CS10053.l y.tab.h ass6_20CS10020_20CS10053_translator.h
	flex ass6_20CS10020_20CS10053.l

y.tab.c y.tab.h: ass6_20CS10020_20CS10053.y
	bison -dty --report=all ass6_20CS10020_20CS10053.y

libass2_20CS10053.a: ass2_20CS10053.o
	ar -rcs libass2_20CS10053.a ass2_20CS10053.o

ass2_20CS10053.o: ass2_20CS10053.c myl.h
	gcc -c ass2_20CS10053.c

clean:
	rm libass2_20CS10053.a ass2_20CS10053.o parser.out ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o lex.yy.* y.tab.* y.output test*

