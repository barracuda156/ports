COMMENT =		c client library for the Riemann monitoring system

V =			1.9.1
GH_ACCOUNT =		algernon
GH_PROJECT =		riemann-c-client
GH_TAGNAME =		riemann-c-client-${V}
DISTNAME =		${GH_PROJECT}-${V}
REVISION =		4

SHARED_LIBS +=		riemann-client 0.0 # 0.0

CATEGORIES =		sysutils

HOMEPAGE =		https://github.com/algernon/riemann-c-client

# LGPLv3
PERMIT_PACKAGE =	Yes

WANTLIB =  brotlidec brotlienc c gmp gnutls hogweed iconv idn2 intl
WANTLIB += json-c m nettle p11-kit protobuf-c pthread tasn1 unistring z
WANTLIB += zstd

LIB_DEPENDS =		devel/protobuf-c \
			security/gnutls \
			devel/json-c

AUTOCONF_VERSION =	2.67
AUTOMAKE_VERSION =	1.11

CONFIGURE_STYLE =	autoreconf

USE_GMAKE =		Yes

# needs riemann running
NO_TEST=		Yes

.include <bsd.port.mk>
