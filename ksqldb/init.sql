CREATE TABLE CUSTOMERS (customerId VARCHAR PRIMARY KEY, name VARCHAR)
    WITH (kafka_topic='customers', value_format='json');
INSERT INTO CUSTOMERS (customerId, name) VALUES ('C1', 'Joe Black');
INSERT INTO CUSTOMERS (customerId, name) VALUES ('C2', 'Bill Smith');
INSERT INTO CUSTOMERS (customerId, name) VALUES ('C3', 'Mary Cane');

CREATE TABLE ITEMS (itemId VARCHAR PRIMARY KEY, item VARCHAR)
    WITH (kafka_topic='items', value_format='json');

INSERT INTO ITEMS (itemId, item) VALUES ('A1', 'ball');
INSERT INTO ITEMS (itemId, item) VALUES ('A2', 'shoes');
INSERT INTO ITEMS (itemId, item) VALUES ('A3', 'racket');
INSERT INTO ITEMS (itemId, item) VALUES ('A4', 'redhat');

CREATE STREAM ORDERS (itemId VARCHAR, customerId VARCHAR, price DOUBLE)
  WITH (kafka_topic='orders', value_format='json');

INSERT INTO ORDERS (itemId, customerId, price) VALUES ('A1', 'C1', 5.8);
INSERT INTO ORDERS (itemId, customerId, price) VALUES ('A1', 'C2', 6.0);
INSERT INTO ORDERS (itemId, customerId, price) VALUES ('A1', 'C3', 5.0);
INSERT INTO ORDERS (itemId, customerId, price) VALUES ('A2', 'C1', 123.3);
INSERT INTO ORDERS (itemId, customerId, price) VALUES ('A2', 'C1', 120.3);
