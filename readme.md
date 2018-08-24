# IBAN Account Validator
## A pure Firebird PLSQL procedure without dependencies.

This procedure validates an IBAN account number and returns a cleaned account number (no simbols, no spaces, just uppercase letters an numbers).

You can use it like this:

```
set term ^;

CREATE TABLE ACCOUNTS (
    IBAN  VARCHAR(34)
)
^
commit work^

/* This are invalid accounts */
INSERT INTO ACCOUNTS (IBAN) VALUES ('')^
INSERT INTO ACCOUNTS (IBAN) VALUES ('ES0012345678901234567890')^
INSERT INTO ACCOUNTS (IBAN) VALUES ('DE0112121212121221212121')^

/* This is a valid account */
INSERT INTO ACCOUNTS (IBAN) VALUES ('ES0220900258220040082812')^

commit work^

SELECT A.IBAN,
       (SELECT VALID
        FROM VALIDATE_IBAN(A.IBAN))
FROM ACCOUNTS A
ORDER BY A.IBAN
```
