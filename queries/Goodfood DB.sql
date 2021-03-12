CREATE TABLE CUSTOMER
(
    CUSTOMER_ID VARCHAR2(50),
    CUSTOMER_NAME VARCHAR2(50),
    CUSTOMER_CONTACT NUMBER(10),
    CUSTOMER_EMAIL VARCHAR2(255),
    TOTAL_POINTS NUMBER(10),
    CONSTRAINT customer_pk PRIMARY KEY(CUSTOMER_ID),
    CONSTRAINT contact_pk UNIQUE (CUSTOMER_CONTACT),
    CONSTRAINT email_pk UNIQUE (CUSTOMER_EMAIL)
);


CREATE TABLE RESTAURANT
(
    RESTAURANT_ID VARCHAR2(50),
    RESTAURANT_NAME VARCHAR2(255),
    RESTAURANT_ADDRESS VARCHAR2(255),
    RESTAURANT_CONTACT NUMBER(10),
    CONSTRAINT restaurant_pk PRIMARY KEY(RESTAURANT_ID),
    CONSTRAINT contact_unq UNIQUE (RESTAURANT_CONTACT)
);


CREATE TABLE DISH
(
    DISH_CODE VARCHAR2(50),
    DISH_NAME VARCHAR2(255),
    LOCAL_NAME VARCHAR2(255),
    CONSTRAINT dish_pk PRIMARY KEY(DISH_CODE)
);


CREATE TABLE ORDER_REGISTER
(
    SN VARCHAR2(50),
    ORDER_NUMBER VARCHAR2(50),
    DATE_TIME DATE,
    ORDER_AMOUNT NUMBER,
    STATUS VARCHAR2(255),
    CONSTRAINT order_pk PRIMARY KEY (SN),
    CONSTRAINT order_no_unq UNIQUE (ORDER_NUMBER)
);


CREATE TABLE DELIVERY_ADDRESS
(
    DELIVERY_ADDRESS_ID VARCHAR2(50),
    LOCATION_NAME VARCHAR2(50),
    LATITUDE VARCHAR2(50),
    LONGITUDE VARCHAR2(50),
    CONSTRAINT DELIVERY_ADDRESS_ID PRIMARY KEY (DELIVERY_ADDRESS_ID)
);


CREATE TABLE LOYALTY_POINT
(
    LOYALTY_POINT_ID VARCHAR2(50),
    POINTS VARCHAR2(50),
    LATITUDE VARCHAR2(50),
    CONSTRAINT loyalty_pk PRIMARY KEY (LOYALTY_POINT_ID)
);


CREATE TABLE RESTAURANT_DISH
(
    RESTAURANT_ID VARCHAR2(50),
    DISH_CODE VARCHAR(50),
    DISH_RATE NUMBER,
    FOREIGN KEY (RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID),
    FOREIGN KEY (DISH_CODE) REFERENCES DISH(DISH_CODE)
);


CREATE TABLE RESTAURANT_DISH_LOYALTY
(
    RESTAURANT_ID VARCHAR2(50),
    DISH_CODE VARCHAR2(50),
    LOYALTY_POINT_ID VARCHAR2(50),
    FOREIGN KEY (RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID),
    FOREIGN KEY (DISH_CODE) REFERENCES DISH(DISH_CODE),
    FOREIGN KEY (LOYALTY_POINT_ID) REFERENCES LOYALTY_POINT(LOYALTY_POINT_ID)
);


CREATE TABLE ORDER_LINE
(
    SN VARCHAR2(50),
    RESTAURANT_ID VARCHAR2(50),
    DISH_CODE VARCHAR2(50),
    ORDER_UNIT NUMBER(20),
    LINE_TOTAL NUMBER,
    POINTS_TOTAL NUMBER,
    FOREIGN KEY (SN) REFERENCES ORDER_REGISTER(SN),
    FOREIGN KEY (RESTAURANT_ID) REFERENCES RESTAURANT(RESTAURANT_ID),
    FOREIGN KEY (DISH_CODE) REFERENCES DISH(DISH_CODE)
);


CREATE TABLE CUSTOMER_ORDER
(
    CUSTOMER_ID VARCHAR2(50),
    SN VARCHAR2(50),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (SN) REFERENCES ORDER_REGISTER(SN)
);


CREATE TABLE ORDER_DELIVERY
(
    SN VARCHAR2(50), 
    DELIVERY_ADDRESS_ID VARCHAR2(50),
    FOREIGN KEY (SN) REFERENCES ORDER_REGISTER(SN),
    FOREIGN KEY (DELIVERY_ADDRESS_ID) REFERENCES DELIVERY_ADDRESS(DELIVERY_ADDRESS_ID)
);















