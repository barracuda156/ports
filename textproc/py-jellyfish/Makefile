COMMENT=	Python library for approximate and phonetic string matching

MODPY_EGG_VERSION=	0.10.0
DISTNAME=	jellyfish-${MODPY_EGG_VERSION}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	textproc

HOMEPAGE=	https://jamesturk.github.io/jellyfish/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += ${MODPY_WANTLIB} pthread

MODULES=	lang/python
MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools
MODPY_PYTEST_ARGS=	jellyfish/test.py

FLAVORS=	python3
FLAVOR=		python3

pre-test:
	@${MODPY_CMD} build_ext --inplace

.include <bsd.port.mk>
