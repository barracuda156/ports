MODPY_EGG_VERSION =	5.2.2
TRYTON_MODULE =		account_fr_chorus
REVISION =		3

TRYTON_DEPENDS +=	account \
			account_invoice \
			company \
			party \
			party_siret

RUN_DEPENDS +=		www/py-requests${MODPY_FLAVOR}

TRYTON_TEST_DEPENDS +=	edocument_uncefact

.include <bsd.port.mk>
