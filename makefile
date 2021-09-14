
#LIBRARY MODULE
GCC:=g++
FLAGS:=-g -O1 -c
SOURCES:=$(shell find . -name  "*.cpp" )
HEADERS:=$(shell find . -name  "*.h" )
INC:=
LIBS:=
OUTPUT:=libTester

all : ${OUTPUT}.a test
	./test

${OUTPUT}.a : ${SOURCES} ${HEADERS}
	${GCC} ${SOURCES} ${INC} ${FLAGS}
	ar rcs ${OUTPUT}.a *.o
	objdump -drCat -Mintel --no-show-raw-insn ${OUTPUT}.a > ${OUTPUT}.s
	rm -f *.o

clear :
	rm -f ${OUTPUT}.a *.o *.s