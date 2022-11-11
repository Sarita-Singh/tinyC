test: parser.out libassgn6.a
	@echo "\n\nGenerating assembly files\n"
	./parser.out testFiles/ass6_20CS10020_20CS10053_test1.c assemblyFiles/ass6_20CS10020_20CS10053_test1.s > quadsOutput/ass6_20CS10020_20CS10053_quads1.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test2.c assemblyFiles/ass6_20CS10020_20CS10053_test2.s > quadsOutput/ass6_20CS10020_20CS10053_quads2.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test3.c assemblyFiles/ass6_20CS10020_20CS10053_test3.s > quadsOutput/ass6_20CS10020_20CS10053_quads3.out
	./parser.out testFiles/ass6_20CS10020_20CS10053_test4.c assemblyFiles/ass6_20CS10020_20CS10053_test4.s > quadsOutput/ass6_20CS10020_20CS10053_quads4.out

	@echo "\n\nCompiling assembly files\n"
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test1.s -L. -lassgn6 -no-pie -o test1
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test2.s -L. -lassgn6 -no-pie -o test2
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test3.s -L. -lassgn6 -no-pie -o test3
	gcc assemblyFiles/ass6_20CS10020_20CS10053_test4.s -L. -lassgn6 -no-pie -o test4

	@echo "\n\nBinaries files generated. Run individual files using ./test<num>\n\n"
	

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
	@echo "\n\n\t\t\t\t++++++++++++++++ TINYC ++++++++++++++++\n\n\n"
	bison -dty --report=all ass6_20CS10020_20CS10053.y

libassgn6.a: myl.o
	ar -rcs libassgn6.a myl.o

myl.o: myl.c myl.h
	gcc -c myl.c

clean:
	@echo "\nI am clearing my junk.\n\n"
	rm libassgn6.a myl.o parser.out ass6_20CS10020_20CS10053_translator.o ass6_20CS10020_20CS10053_target_translator.o lex.yy.* y.tab.* y.output assemblyFiles/*.s test? quadsOutput/*.out 
	@echo "\nYay. I made your workspace clean.\n\n"
