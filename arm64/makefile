BUILD   = .build

LDFLAGS = -lSystem \
	-syslibroot `xcrun -sdk macosx --show-sdk-path` \
	-e _start \
	-arch arm64

default: ${BUILD}
	as -o ${BUILD}/hello.o hello.s && \
		ld ${LDFLAGS} -o ${BUILD}/hello ${BUILD}/hello.o && \
		echo 'run ${BUILD}/hello'


${BUILD}:
	@mkdir -p ${BUILD}
