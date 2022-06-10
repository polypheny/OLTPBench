DROP TABLE IF EXISTS nation;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS partsupp;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS lineitem;

-- Sccsid:     @(#)dss.ddl  2.1.8.1
CREATE TABLE nation  ( n_nationkey  INTEGER NOT NULL,
                       n_name       VARCHAR(25) NOT NULL,
                       n_regionkey  INTEGER NOT NULL,
                       n_comment    VARCHAR(152),
                       PRIMARY KEY (n_nationkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE nation ADD INDEX IDX_NATION_PK ON (n_nationkey);

CREATE TABLE region  ( r_regionkey  INTEGER NOT NULL,
                       r_name       VARCHAR(25) NOT NULL,
                       r_comment    VARCHAR(152),
                       PRIMARY KEY (r_regionkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE region ADD INDEX IDX_REGION_PK ON (r_regionkey);

CREATE TABLE part  ( p_partkey     INTEGER NOT NULL,
                     p_name        VARCHAR(55) NOT NULL,
                     p_mfgr        VARCHAR(25) NOT NULL,
                     p_brand       VARCHAR(10) NOT NULL,
                     p_type        VARCHAR(25) NOT NULL,
                     p_size        INTEGER NOT NULL,
                     p_container   VARCHAR(10) NOT NULL,
                     p_retailprice DECIMAL(15,2) NOT NULL,
                     p_comment     VARCHAR(23) NOT NULL,
                     PRIMARY KEY (p_partkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE part ADD INDEX IDX_PART_PK ON (p_partkey);

CREATE TABLE supplier ( s_suppkey     INTEGER NOT NULL,
                        s_name        VARCHAR(25) NOT NULL,
                        s_address     VARCHAR(40) NOT NULL,
                        s_nationkey   INTEGER NOT NULL,
                        s_phone       VARCHAR(15) NOT NULL,
                        s_acctbal     DECIMAL(15,2) NOT NULL,
                        s_comment     VARCHAR(101) NOT NULL,
                        PRIMARY KEY (s_suppkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE supplier ADD INDEX IDX_SUPPLIER_PK ON (s_suppkey);

CREATE TABLE partsupp ( ps_partkey     INTEGER NOT NULL,
                        ps_suppkey     INTEGER NOT NULL,
                        ps_availqty    INTEGER NOT NULL,
                        ps_supplycost  DECIMAL(15,2)  NOT NULL,
                        ps_comment     VARCHAR(199) NOT NULL,
                        PRIMARY KEY (ps_partkey, ps_suppkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE partsupp ADD INDEX IDX_PARTSUPP_PK ON (ps_partkey, ps_suppkey);

CREATE TABLE customer ( c_custkey     INTEGER NOT NULL,
                        c_name        VARCHAR(25) NOT NULL,
                        c_address     VARCHAR(40) NOT NULL,
                        c_nationkey   INTEGER NOT NULL,
                        c_phone       VARCHAR(15) NOT NULL,
                        c_acctbal     DECIMAL(15,2)   NOT NULL,
                        c_mktsegment  VARCHAR(10) NOT NULL,
                        c_comment     VARCHAR(117) NOT NULL,
                        PRIMARY KEY (c_custkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE customer ADD INDEX IDX_CUSTOMER_PK ON (c_custkey);

CREATE TABLE orders  ( o_orderkey       INTEGER NOT NULL,
                       o_custkey        INTEGER NOT NULL,
                       o_orderstatus    VARCHAR(1) NOT NULL,
                       o_totalprice     DECIMAL(15,2) NOT NULL,
                       o_orderdate      DATE NOT NULL,
                       o_orderpriority  VARCHAR(15) NOT NULL,
                       o_clerk          VARCHAR(15) NOT NULL,
                       o_shippriority   INTEGER NOT NULL,
                       o_comment        VARCHAR(79) NOT NULL,
                       PRIMARY KEY (o_orderkey) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE orders ADD INDEX IDX_ORDERS_PK ON (o_orderkey);

CREATE TABLE lineitem ( l_orderkey    INTEGER NOT NULL,
                        l_partkey     INTEGER NOT NULL,
                        l_suppkey     INTEGER NOT NULL,
                        l_linenumber  INTEGER NOT NULL,
                        l_quantity    DECIMAL(15,2) NOT NULL,
                        l_extendedprice  DECIMAL(15,2) NOT NULL,
                        l_discount    DECIMAL(15,2) NOT NULL,
                        l_tax         DECIMAL(15,2) NOT NULL,
                        l_returnflag  VARCHAR(1) NOT NULL,
                        l_linestatus  VARCHAR(1) NOT NULL,
                        l_shipdate    DATE NOT NULL,
                        l_commitdate  DATE NOT NULL,
                        l_receiptdate DATE NOT NULL,
                        l_shipinstruct VARCHAR(25) NOT NULL,
                        l_shipmode     VARCHAR(10) NOT NULL,
                        l_comment      VARCHAR(44) NOT NULL,
                        PRIMARY KEY (l_orderkey, l_linenumber) );
-- Polypheny does not (yet) automatically create an index for the primary key (like for instance PostgreSQL)
ALTER TABLE lineitem ADD INDEX IDX_LINEITEM_PK ON (l_orderkey, l_linenumber);
