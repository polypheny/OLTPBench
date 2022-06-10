
DROP TABLE IF EXISTS CHECKING;
DROP TABLE IF EXISTS SAVINGS;
DROP TABLE IF EXISTS ACCOUNTS;

CREATE TABLE ACCOUNTS (
    custid      BIGINT      NOT NULL,
    name        VARCHAR(64) NOT NULL,
    PRIMARY KEY (custid)
);
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE ACCOUNTS ADD INDEX IDX_ACCOUNTS_CUSTID ON (custid);

CREATE TABLE SAVINGS (
    custid      BIGINT      NOT NULL,
    bal         DOUBLE      NOT NULL,
    PRIMARY KEY (custid)
);
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE SAVINGS ADD INDEX IDX_SAVINGS_CUSTID ON (custid);

CREATE TABLE CHECKING (
    custid      BIGINT      NOT NULL,
    bal         DOUBLE      NOT NULL,
    PRIMARY KEY (custid)
);
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE CHECKING ADD INDEX IDX_CHECKING_CUSTID ON (custid);

ALTER TABLE SAVINGS  ADD CONSTRAINT S_FKEY_A FOREIGN KEY (custid) REFERENCES ACCOUNTS (custid) ON DELETE RESTRICT;
ALTER TABLE CHECKING ADD CONSTRAINT C_FKEY_A FOREIGN KEY (custid) REFERENCES ACCOUNTS (custid) ON DELETE RESTRICT;

ALTER TABLE ACCOUNTS ADD INDEX IDX_ACCOUNTS_NAME ON (name);
