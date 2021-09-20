
#LIBRARY MODULE
GCC:=g++
FLAGS:=-g -O1 -c
SOURCES:=$(shell find . -name  "*.cpp" )
HEADERS:=$(shell find . -name  "*.h" )
INC:=
LIBS:=
INSTALL_DIR:=${HOME}/.local
NAME:=Tester
OUTPUT:=lib${NAME}

all : ${OUTPUT}.a
	./test

${OUTPUT}.a : ${SOURCES} ${HEADERS}
	${GCC} ${SOURCES} ${INC} ${FLAGS}
	ar rcs ${OUTPUT}.a *.o
	objdump -drCat -Mintel --no-show-raw-insn ${OUTPUT}.a > ${OUTPUT}.s
	rm -f *.o

clear :
	rm -f ${OUTPUT}.a *.o *.s

install: ${OUTPUT}.a
	cp ${OUTPUT}.a ${INSTALL_DIR}/lib/${OUTPUT}.a
	mkdir -p ${INSTALL_DIR}/include/${NAME}
	cp ${NAME}.h ${INSTALL_DIR}/include/${NAME}/${NAME}.h

uninstall:
	rm -f ${INSTALL_DIR}/lib/${OUTPUT}.a
	rm -rf ${INSTALL_DIR}/include/${NAME}