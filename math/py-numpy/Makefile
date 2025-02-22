COMMENT=		fast array and numeric programming library for Python

MODPY_EGG_VERSION=	1.25.2
DISTNAME=		numpy-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME}

CATEGORIES=		math devel

HOMEPAGE=		https://www.numpy.org/

# BSD
PERMIT_PACKAGE=		Yes

# C++
COMPILER=		base-clang ports-gcc

WANTLIB += ${MODPY_WANTLIB} m pthread

MODULES=		lang/python

FLAVORS=		python3
FLAVOR=			python3

DEBUG_PACKAGES=		${BUILD_PACKAGES}

MODPY_PI=		Yes
MODPY_SETUPTOOLS=	Yes

BUILD_DEPENDS=		devel/gas \
			lang/cython${MODPY_FLAVOR}
TEST_DEPENDS=		${FULLPKGNAME}:${FULLPKGPATH} \
			devel/py-hypothesis${MODPY_FLAVOR} \
			devel/py-test${MODPY_FLAVOR} \
			devel/py-test-cov${MODPY_FLAVOR} \
			devel/py-typing-extensions${MODPY_FLAVOR} \
			devel/py-tz${MODPY_FLAVOR} \
			devel/py-wheel${MODPY_FLAVOR}

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mgcc49}
MODULES+=		fortran
BUILD_DEPENDS+=		${MODFORTRAN_BUILD_DEPENDS}
LIB_DEPENDS+=		${MODFORTRAN_LIB_DEPENDS} \
			math/cblas \
			math/lapack
WANTLIB+=		${MODFORTRAN_WANTLIB} blas cblas lapack
MODPY_DISTUTILS_BUILDARGS+= --fcompiler=gnu95
.endif

# cpu optimizations (where supported) are runtime detected, but there's
# some problem on i386 where they trigger segfaults in numpy's regression
# tests, and in other programs using numpy (e.g. building makehuman).
# tests look good on amd64 arm64 riscv64 as-is.
# numpy's regressions tests result in segv on powerpc (and also did in
# 1.19.5) but at least some normal runtime seems ok (makehuman builds).
# https://github.com/numpy/numpy/issues/20799
.if ${MACHINE_ARCH} == i386
MODPY_DISTUTILS_BUILDARGS+= --disable-optimization
.endif

# Cython 0.28.* uses __attribute__((optimize("Os"))) which
# leads to breakage at runtime on at least macppc.
# -- see: https://marc.info/?l=openbsd-ports&m=153312266209561&w=2
#
# gcc docs also explicitly say that the optimize attribute "is not suitable in production code".
# So let's disable to be safe.
# -- see: https://gcc.gnu.org/onlinedocs/gcc-8.2.0/gcc/Common-Function-Attributes.html
#
# Some related Cython issues:
#   https://github.com/cython/cython/issues/2102
#   https://github.com/cython/cython/issues/2235
#   https://github.com/cython/cython/issues/2494
CFLAGS +=	-D CYTHON_SMALL_CODE=

pre-build:
	cp -f ${WRKSRC}/numpy/distutils/site.cfg ${WRKSRC}/site.cfg
	ln -sf ${LOCALBASE}/bin/gas ${WRKDIR}/bin/as

do-test:
	cd ${WRKDIR} && ${MAKE_ENV} ${MODPY_BIN} -c \
	    'import numpy ; numpy.test()'

.include <bsd.port.mk>
