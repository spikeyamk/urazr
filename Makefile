CC=cc
LIBS=
WARNINGS=-Wall -Wextra -Wpedantic
DEBUG_FLAGS=
CC_OPTS=${WARNINGS} ${DEBUG_FLAGS} -O2

main: main.o
	${CC} ${CC_OPTS} main.o -o main ${LIBS} 
              
main.o: main.c
	${CC} ${CC_OPTS} -c main.c -o main.o 

clean: 
	rm main.o 
	rm main
