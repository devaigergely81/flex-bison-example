# Flex & Bison example
A compiler and interpreter of a toy language. Using *C++*, *Flex* and *Bison*.

## The toy language
The language is called the *While language*. Its different variants often serve educational purposes. It has two types (*boolean* and *natural*), expressions of these two types, assignment instruction, reading from standard input, writing to standard output, branching and looping.

See the *test/\*.ok* files to learn the syntax and semantics of the language.

## Building the project
Make sure you have *g++*, *flex*, *bison* and *nasm* installed. The project was tested with the following versions: g++ 6.3.0, flex 2.6.1, bison 3.0.4, nasm 2.12.01. It might work with other versions as well.

Use the following command to build the project:
```
make
```
Use the following command to run tests:
```
make test
```
Use the following command to cleanup all generated files:
```
make clean
```

## Using the interpreter
The following command executes a While program immediately:
```
./while -i path/to/your/while.program
```

## Using the compiler
The following command compiles a While language program to NASM assembly:
```
./while -c path/to/your/while.program > output.asm
```
To further compile the assembly program to an executable:
```
nasm -felf output.asm
gcc output.o io.c -o output
```
Note: Under 64 bit operating systems, pass the `-m32` option to gcc.
To run the executable output:
```
./output
```

## License
This software is licensed under the MIT license. See the *LICENSE* file for details.
