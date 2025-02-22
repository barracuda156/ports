COMMENT=	Python package to manage extremely large amounts of data

MODPY_EGG_VERSION=	3.7.0
DISTNAME=		tables-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME}
CATEGORIES=		math
REVISION=		2

HOMEPAGE=	https://www.pytables.org/
MAINTAINER=	Martin Reindl <martin@catai.org>

# BSD
PERMIT_PACKAGE=	Yes

COMPILER=	base-clang ports-gcc

MODULES=	lang/python
MODPY_PYBUILD =	setuptools
MODPY_PI=	Yes

WANTLIB=	pthread ${MODPY_WANTLIB} blosc bz2 hdf5 lzo2

MODPY_DISTUTILS_BUILDARGS=	--hdf5=${LOCALBASE} \
				--lzo=${LOCALBASE}

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

BUILD_DEPENDS+=	lang/cython${MODPY_FLAVOR} \
		math/py-numpy${MODPY_FLAVOR} \
		math/py-oldest-supported-numpy${MODPY_FLAVOR} \
		sysutils/py-packaging${MODPY_FLAVOR}

LIB_DEPENDS+=	archivers/lzo2 \
		archivers/bzip2 \
		archivers/blosc \
		math/hdf5

RUN_DEPENDS+=	math/netcdf \
		sysutils/py-packaging${MODPY_FLAVOR}

TEST_DEPENDS=	math/py-numexpr${MODPY_FLAVOR} \
		math/hdf5

FLAVORS =	python3
FLAVOR =	python3

do-test: fake
	cd ${WRKDIR} && ${MAKE_ENV} PYTHONPATH=${WRKINST}${MODPY_SITEPKG} \
		${MODPY_BIN} -c 'import tables ; tables.test()'

.include <bsd.port.mk>
