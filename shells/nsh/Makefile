COMMENT =	network switch style shell

CATEGORIES =	shells net
HOMEPAGE =	https://www.nmedia.net/nsh/
V =		1.2
DISTNAME =	nsh-${V}
SITES =		https://github.com/yellowman/nsh/releases/download/v${V}/

MAINTAINER =	Tom Smyth <tom.smyth@wirelessconnect.eu>

# BSD
PERMIT_PACKAGE =	Yes

# uses pledge()
WANTLIB += c curses edit sqlite3 util

FLAVORS =	static
FLAVOR ?=

CPPFLAGS =	-I${LOCALBASE}/include \
		-DNSH_REXEC_PATH=${LOCALBASE}/bin/nsh

MAKE_ENV =	CC="${CC}" \
		CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib"
LIB_DEPENDS =	databases/sqlite3

FAKE_FLAGS =	PREFIX=${TRUEPREFIX}

.if ${FLAVOR:Mstatic}
MAKE_FLAGS +=	LDFLAGS="-L${LOCALBASE}/lib -ledit -ltermcap -lsqlite3 -lm -lpthread -static"
.endif

NO_TEST=	Yes

MAKE_FLAGS += BSDSRCDIR=${WRKDIST} BSDOBJDIR=${WRKDIST}/obj

post-gen:
	mkdir -p ${WKRDIST}/obj

post-configure:
	${MAKE} ${MAKE_FLAGS} -C ${WRKDIST} obj


post-install:
.for i in save-ro.sh save-rw.sh
	${INSTALL_SCRIPT} ${WRKDIST}/${i} ${PREFIX}/bin
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/nsh
.for i in README.md COPYRIGHT
	${INSTALL_DATA} ${WRKDIST}/${i} ${PREFIX}/share/doc/nsh/
.endfor

.include <bsd.port.mk>
