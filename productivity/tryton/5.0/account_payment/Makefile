MODPY_EGG_VERSION =	5.0.8
TRYTON_MODULE =		account_payment
REVISION =		1

TRYTON_DEPENDS +=	account \
			company \
			currency \
			party

RUN_DEPENDS +=		databases/py-sql${MODPY_FLAVOR}

TRYTON_TEST_DEPENDS +=	account_invoice

.include <bsd.port.mk>
