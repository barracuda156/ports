COMMENT =		simple distributed software configuration management

DISTNAME =		fossil-2.23
EPOCH =			0
CATEGORIES =		devel www

MAINTAINER =		James Turner <james@calminferno.net>

HOMEPAGE =		https://fossil-scm.org/
SITES =			https://fossil-scm.org/home/tarball/
DISTFILES =		{47362306a7dd7c6fc3cab77cebe5d25469b0a9448479d9718eb5c49c8337b29/}${DISTNAME}${EXTRACT_SUFX}


# BSD
PERMIT_PACKAGE =	Yes

FLAVORS=		static
FLAVOR?=

# uses pledge()
WANTLIB =		c crypto fuse m ssl z

MODULES =		lang/tcl
MODTCL_VERSION =	8.6

BUILD_DEPENDS =		${MODTCL_BUILD_DEPENDS}

CONFIGURE_STYLE =	simple
CONFLICT_MARKER =	fossil-*-!static

.if ${FLAVOR} == "static"
CONFIGURE_ARGS +=	--static
PREFIX =		${VARBASE}/www
CONFLICT_MARKER =	fossil-*-static
.endif

SUBST_VARS +=		CONFLICT_MARKER STATIC

TEST_DEPENDS =		${MODTCL_RUN_DEPENDS}

pre-configure:
	${SUBST_CMD} ${WRKSRC}/auto.def

do-test:
	@cd ${WRKSRC} && ${MODTCL_BIN} test/tester.tcl fossil

do-install:
	${INSTALL_PROGRAM_DIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/fossil ${PREFIX}/bin

.include <bsd.port.mk>
