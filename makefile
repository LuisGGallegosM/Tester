
#LIBRARY MODULE
GCC:=g++
FLAGS:=-g -O1 -c
SOURCES:=$(shell find ./src -name  "*.cpp" )
HEADERS:=$(shell find ./src -name  "*.h" )
INC:=
LIBS:=
INSTALL_DIR:=${HOME}/.local
NAME:=Tester
OUTPUT:=lib${NAME}

all : build/${OUTPUT}.a

build/${OUTPUT}.a : ${SOURCES} ${HEADERS}
	${GCC} ${SOURCES} ${INC} ${FLAGS}
	ar rcs build/${OUTPUT}.a *.o
	objdump -drCat -Mintel --no-show-raw-insn build/${OUTPUT}.a > build/${OUTPUT}.s
	rm -f *.o

clear :
	rm -f build/*

install: build/${OUTPUT}.a uninstall
	cp build/${OUTPUT}.a ${INSTALL_DIR}/lib/${OUTPUT}.a
	mkdir -p ${INSTALL_DIR}/include/${NAME}
	cp src/${NAME}.h ${INSTALL_DIR}/include/${NAME}/${NAME}.h

uninstall:
	rm -f ${INSTALL_DIR}/lib/${OUTPUT}.a
	rm -rf ${INSTALL_DIR}/include/${NAME}