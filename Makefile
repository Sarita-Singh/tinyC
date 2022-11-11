test: parser.out libass6.a
	@echo "\nGenerating assembly files\n"
	./parser.out testFiles/ass6_20CS10020_20CS10053_test1.c > quadsOutput/ass6_20CS10020_20CS10053_quads1.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test2.c > quadsOutput/ass6_20CS10020_20CS10053_quads2.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test3.c > quadsOutput/ass6_20CS10020_20CS10053_quads3.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test4.c > quadsOutput/ass6_20CS10020_20CS10053_quads4.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test5.c > quadsOutput/ass6_20CS10020_20CS10053_quads5.out
	@echo "\nCompiling assembly files\n"
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test1.s -L. -lass2_19CS30031 -no-pie -o test1
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test2.s -L. -lass2_19CS30031 -no-pie -o test2
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test3.s -L. -lass2_19CS30031 -no-pie -o test3
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test4.s -L. -lass2_19CS30031 -no-pie -o test4
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test5.s -L. -lass2_19CS30031 -no-pie -o test5
	@echo "Binaries generated. Run using ./test<num>\n\n"
	@echo "Running test1:\n"
	@./test1 > outputFiles/ass6_20CS10020_20CS10053_test1.txt
	@echo "Running test2:\n"
	@./test2 > outputFiles/ass6_20CS10020_20CS10053_test2.txt
	@echo "Running test3:\n"
	@./test3 > outputFiles/ass6_20CS10020_20CS10053_test3.txt
	@echo "Running test4:\n"
	@./test4 > outputFiles/ass6_20CS10020_20CS10053_test4.txt
	@echo "Running test5:\n"
	@./test5 > outputFiles/ass6_20CS10020_20CS10053_test5.txt

parser.out: lex.yy.o y.tab.o ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o
	g++ -g lex.yy.o y.tab.o ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o -o parser.out

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

libass6.a: myl.o
	ar -rcs libass6.a myl.o

myl.o: myl.c myl.h
	gcc -c myl.c

clean:
	@echo "\nI am clearing my junk.\n\n"
	rm libass6.a myl.o parser.out ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o lex.yy.* y.tab.* y.output assemblyFiles/*.s quadsOutput/*.out
	@echo "\nYay. I made your workspace clean.\n\n"
