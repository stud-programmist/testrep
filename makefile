PURPOS=proj
PUP= ${PURPOS}
LIBONE=libpr1.a
LIBTWO=libpr2.so
MAINF=file
MAI=${MAINF}.c
MN=maxnum
MNX=${MN}.c
ND=sum
NDG=${ND}.c

all: ${PURPOS}
${PURPOS}: ${MAINF}.o ${LIBONE} ${LIBTWO}
	gcc -o ${PURPOS} *.o libpr*
	export LD_LIBRARY_PATH='./'
	./${PURPOS}
${MAINF}.o: ${MAI}
	gcc -c -ggdb ${MAI}

${LIBONE}: ${MN}.o
	gcc -c ${MNX}
	ar r ${LIBONE}

${LIBTWO}: ${ND}.o
	gcc -c -fPIC ${NDG}
	gcc -shared -o ${LIBTWO} ${ND}.o

clean:
	rm -f *.o
