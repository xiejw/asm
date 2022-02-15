BUILD   = .build

LDFLAGS = -lSystem \
	-syslibroot `xcrun -sdk macosx --show-sdk-path` \
	-e _start \
	-arch arm64

default: ${BUILD}/hello
	${BUILD}/hello

${BUILD}/hello: ${BUILD}/hello.o
	ld ${LDFLAGS} -o ${BUILD}/hello ${BUILD}/hello.o

${BUILD}/hello.o: ${BUILD} hello.s
	as -o ${BUILD}/hello.o hello.s

${BUILD}:
	@mkdir -p ${BUILD}

clean:
	rm -rf ${BUILD}
