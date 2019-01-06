while: lex.yy.cc while.cc while.tab.cc while.tab.hh implementation.hh implementation.cc type_checker_implementation.cc code_generator_implementation.cc interpreter_implementation.cc
	g++ lex.yy.cc while.cc while.tab.cc implementation.cc type_checker_implementation.cc code_generator_implementation.cc interpreter_implementation.cc -o while

lex.yy.cc: while.l
	flex while.l

while.tab.cc while.tab.hh: while.y
	bison -d while.y

.PHONY: clean
clean:
	rm -f lex.yy.cc while.tab.cc while.tab.hh location.hh position.hh stack.hh while temp.asm temp.o temp temp.out

.PHONY: test
test: test_interpreter test_compiler test_lexical_errors test_syntax_errors test_semantic_errors

.PHONY: test_interpreter
test_interpreter: while exec_write_natural exec_write_boolean exec_read exec_arithmetic exec_logic exec_assignment exec_branching exec_looping exec_divisor

.PHONY: test_compiler
test_compiler: while comp_write_natural comp_write_boolean comp_read comp_arithmetic comp_logic comp_assignment comp_branching comp_looping comp_divisor

.PHONY: test_lexical_errors
test_lexical_errors: test/01.lexical_error
	! ./while -i test/01.lexical_error 2> /dev/null

.PHONY: test_syntax_errors
test_syntax_errors: test/*.syntax_error
	! ./while -i test/01.syntax_error 2> /dev/null
	! ./while -i test/02.syntax_error 2> /dev/null
	! ./while -i test/03.syntax_error 2> /dev/null
	! ./while -i test/04.syntax_error 2> /dev/null
	! ./while -i test/05.syntax_error 2> /dev/null
	! ./while -i test/06.syntax_error 2> /dev/null
	! ./while -i test/07.syntax_error 2> /dev/null
	! ./while -i test/08.syntax_error 2> /dev/null
	! ./while -i test/09.syntax_error 2> /dev/null
	! ./while -i test/10.syntax_error 2> /dev/null

.PHONY: test_semantic_errors
test_semantic_errors: test/01.semantic_error test/02.semantic_error test/03.semantic_error test/04.semantic_error test/05.semantic_error test/06.semantic_error 
	! ./while -i test/01.semantic_error 2> /dev/null
	! ./while -i test/02.semantic_error 2> /dev/null
	! ./while -i test/03.semantic_error 2> /dev/null
	! ./while -i test/04.semantic_error 2> /dev/null
	! ./while -i test/05.semantic_error 2> /dev/null
	! ./while -i test/06.semantic_error 2> /dev/null

.PHONY: exec_write_natural
exec_write_natural: test/test_write_natural.ok test/test_write_natural.out
	./while -i test/test_write_natural.ok > temp.out
	diff temp.out test/test_write_natural.out

.PHONY: comp_write_natural
comp_write_natural: test/test_write_natural.ok test/test_write_natural.out
	./while -c test/test_write_natural.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_write_natural.out

.PHONY: exec_write_boolean
exec_write_boolean: test/test_write_boolean.ok test/test_write_boolean.out
	./while -i test/test_write_boolean.ok > temp.out
	diff temp.out test/test_write_boolean.out

.PHONY: comp_write_boolean
comp_write_boolean: test/test_write_boolean.ok test/test_write_boolean.out
	./while -c test/test_write_boolean.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_write_boolean.out

.PHONY: exec_read
exec_read: test/test_read.ok test/test_read.out
	./while -i test/test_read.ok < test/test_read.out > temp.out
	diff temp.out test/test_read.out

.PHONY: comp_read
comp_read: test/test_read.ok test/test_read.out
	./while -c test/test_read.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp < test/test_read.out > temp.out
	diff temp.out test/test_read.out

.PHONY: exec_arithmetic
exec_arithmetic: test/test_arithmetic.ok test/test_arithmetic.out
	./while -i test/test_arithmetic.ok > temp.out
	diff temp.out test/test_arithmetic.out

.PHONY: comp_arithmetic
comp_arithmetic: test/test_arithmetic.ok test/test_arithmetic.out
	./while -c test/test_arithmetic.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_arithmetic.out

.PHONY: exec_logic
exec_logic: test/test_logic.ok test/test_logic.out
	./while -i test/test_logic.ok > temp.out
	diff temp.out test/test_logic.out

.PHONY: comp_logic
comp_logic: test/test_logic.ok test/test_logic.out
	./while -c test/test_logic.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_logic.out

.PHONY: exec_assignment
exec_assignment: test/test_assignment.ok test/test_assignment.out
	./while -i test/test_assignment.ok > temp.out
	diff temp.out test/test_assignment.out

.PHONY: comp_assignment
comp_assignment: test/test_assignment.ok test/test_assignment.out
	./while -c test/test_assignment.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_assignment.out

.PHONY: exec_branching
exec_branching: test/test_branching.ok test/test_branching.out
	./while -i test/test_branching.ok > temp.out
	diff temp.out test/test_branching.out

.PHONY: comp_branching
comp_branching: test/test_branching.ok test/test_branching.out
	./while -c test/test_branching.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp > temp.out
	diff temp.out test/test_branching.out

.PHONY: exec_looping
exec_looping: test/test_looping.ok test/test_looping.out
	./while -i test/test_looping.ok < test/test_looping.in > temp.out
	diff temp.out test/test_looping.out

.PHONY: comp_looping
comp_looping: test/test_looping.ok test/test_looping.out
	./while -c test/test_looping.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp < test/test_looping.in > temp.out
	diff temp.out test/test_looping.out

.PHONY: exec_divisor
exec_divisor: test/test_divisor.ok test/test_divisor.out
	./while -i test/test_divisor.ok < test/test_divisor.in > temp.out
	diff temp.out test/test_divisor.out

.PHONY: comp_divisor
comp_divisor: test/test_divisor.ok test/test_divisor.out
	./while -c test/test_divisor.ok > temp.asm
	nasm -felf temp.asm
	gcc temp.o io.c -otemp
	./temp < test/test_divisor.in > temp.out
	diff temp.out test/test_divisor.out
