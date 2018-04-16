create sequence DEMO_CUST_SEQ start with 100;
create sequence DEMO_ORD_SEQ start with 100;
create sequence DEMO_PROD_SEQ start with 100;
create sequence DEMO_ORDER_ITEMS_SEQ start with 100;

-- Table: DEMO_TAGS
CREATE TABLE demo_tags (
    id                      number primary key,
    tag                     varchar2(255) not null,
    content_id              number,
    content_type            varchar2(30)
                            constraint demo_tags_ck check
                            (content_type in ('CUSTOMER','ORDER','PRODUCT')),
    --
    created                 timestamp with local time zone,
    created_by              varchar2(255),
    updated                 timestamp with local time zone,
    updated_by              varchar2(255)
);


create or replace trigger demo_tags_biu
   before insert or update on demo_tags
   for each row
   begin
      if inserting then
         if :NEW.ID is null then
           select to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
           into :new.id
           from dual;
         end if;
         :NEW.CREATED := localtimestamp;
         :NEW.CREATED_BY := nvl(v('APP_USER'),USER);
      end if;

      if updating then
         :NEW.UPDATED := localtimestamp;
         :NEW.UPDATED_BY := nvl(v('APP_USER'),USER);
      end if;
end;
/
    
-- Table: DEMO_TAGS_TYPE_SUM
create table demo_tags_type_sum (
    tag                             varchar2(255),
    content_type                    varchar2(30),
    tag_count                       number,
    constraint demo_tags_type_sum_pk primary key (tag,content_type)
);
    

-- Table: DEMO_TAGS_SUM
create table demo_tags_sum (
    tag                             varchar2(255),
    tag_count                       number,
    constraint demo_tags_sum_pk primary key (tag)
);

-- Table: DEMO_CUSTOMERS
CREATE TABLE  "DEMO_CUSTOMERS" (    
    "CUSTOMER_ID"          NUMBER       NOT NULL ENABLE,
    "CUST_FIRST_NAME"      VARCHAR2(20) NOT NULL ENABLE,
    "CUST_LAST_NAME"       VARCHAR2(20) NOT NULL ENABLE,
    "CUST_STREET_ADDRESS1" VARCHAR2(60),
    "CUST_STREET_ADDRESS2" VARCHAR2(60),
    "CUST_CITY"            VARCHAR2(30),
    "CUST_STATE"           VARCHAR2(2),
    "CUST_POSTAL_CODE"     VARCHAR2(10),
    "CUST_EMAIL"           VARCHAR2(30),
    "PHONE_NUMBER1"        VARCHAR2(25),
    "PHONE_NUMBER2"        VARCHAR2(25),
    "URL"                  VARCHAR2(100),
    "CREDIT_LIMIT"         NUMBER(9,2),
    "TAGS"                 VARCHAR2(4000),
    CONSTRAINT "DEMO_CUST_CREDIT_LIMIT_MAX" CHECK (credit_limit <= 5000) ENABLE,
    CONSTRAINT "DEMO_CUSTOMERS_PK" PRIMARY KEY ("CUSTOMER_ID") ENABLE,
    CONSTRAINT "DEMO_CUSTOMERS_UK" UNIQUE ("CUST_FIRST_NAME","CUST_LAST_NAME")
 );
CREATE INDEX  "DEMO_CUST_NAME_IX" ON  "DEMO_CUSTOMERS" ("CUST_LAST_NAME", "CUST_FIRST_NAME");

CREATE OR REPLACE TRIGGER  "DEMO_CUSTOMERS_BIU"
  before insert or update ON demo_customers FOR EACH ROW
DECLARE
  cust_id number;
BEGIN
  if inserting then  
    if :new.customer_id is null then
      select demo_cust_seq.nextval
        into cust_id
        from dual;
      :new.customer_id := cust_id;
    end if;
    if :new.tags is not null then
          :new.tags := sample_pkg.demo_tags_cleaner(:new.tags);
    end if;
  end if;

  sample_pkg.demo_tag_sync(
     p_new_tags      => :new.tags,
     p_old_tags      => :old.tags,
     p_content_type  => 'CUSTOMER',
     p_content_id    => :new.customer_id );
END;
/

create or replace trigger "DEMO_CUSTOMERS_BD"
    before delete on demo_customers
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'CUSTOMER',
        p_content_id    => :old.customer_id );

end;
/

-- Table: DEMO_ORDERS
CREATE TABLE  "DEMO_ORDERS" (    
    "ORDER_ID"           NUMBER NOT NULL ENABLE,
    "CUSTOMER_ID"        NUMBER NOT NULL ENABLE,
    "ORDER_TOTAL"        NUMBER(8,2),
    "ORDER_TIMESTAMP"    TIMESTAMP with local time zone,
    "USER_NAME"          VARCHAR2(100),
    "TAGS"               VARCHAR2(4000),
    CONSTRAINT "DEMO_ORDER_TOTAL_MIN" CHECK (order_total >= 0) ENABLE,
    CONSTRAINT "DEMO_ORDER_PK" PRIMARY KEY ("ORDER_ID") ENABLE,
    CONSTRAINT "DEMO_ORDERS_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
    REFERENCES  "DEMO_CUSTOMERS" ("CUSTOMER_ID") ON DELETE CASCADE ENABLE
);
CREATE INDEX  "DEMO_ORD_CUSTOMER_IX" ON  "DEMO_ORDERS" ("CUSTOMER_ID");

CREATE OR REPLACE TRIGGER  "DEMO_ORDERS_BIU"
  before insert or update ON demo_orders FOR EACH ROW
DECLARE
  order_id number;
BEGIN
  if inserting then  
    if :new.order_id is null then
      select demo_ord_seq.nextval
        INTO order_id
        FROM dual;
      :new.order_id := order_id;
    end if;
    if :new.tags is not null then
       :new.tags := sample_pkg.demo_tags_cleaner(:new.tags);
    end if;
  end if;
  
  sample_pkg.demo_tag_sync(
    p_new_tags      => :new.tags,
    p_old_tags      => :old.tags,
    p_content_type  => 'ORDER',
    p_content_id    => :new.order_id );
END;
/

create or replace trigger "DEMO_ORDERS_BD"
    before delete on demo_orders
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'ORDER',
        p_content_id    => :old.order_id );

end;
/


-- Table: DEMO_PRODUCT_INFO
CREATE TABLE  "DEMO_PRODUCT_INFO" (    
    "PRODUCT_ID"          NUMBER NOT NULL ENABLE,
    "PRODUCT_NAME"        VARCHAR2(50),
    "PRODUCT_DESCRIPTION" VARCHAR2(2000),
    "CATEGORY"            VARCHAR2(30),
    "PRODUCT_AVAIL"       VARCHAR2(1),
    "LIST_PRICE"          NUMBER(8,2),
    "PRODUCT_IMAGE"       BLOB,
    "MIMETYPE"            VARCHAR2(255),
    "FILENAME"            VARCHAR2(400),
    "IMAGE_LAST_UPDATE"   TIMESTAMP with local time zone,
    "TAGS"                VARCHAR2(4000),
    CONSTRAINT "DEMO_PRODUCT_INFO_PK" primary key ("PRODUCT_ID") ENABLE,
    CONSTRAINT "DEMO_PRODUCT_INFO_UK" unique ("PRODUCT_NAME") ENABLE
);

CREATE OR REPLACE TRIGGER  "DEMO_PRODUCT_INFO_BIU"
  before insert or update ON demo_product_info FOR EACH ROW
DECLARE
  prod_id number;
BEGIN
  if inserting then  
    if :new.product_id is null then
      select demo_prod_seq.nextval
        into prod_id
        from dual;
      :new.product_id := prod_id;
    end if;
    if :new.tags is not null then
          :new.tags := sample_pkg.demo_tags_cleaner(:new.tags);
    end if;
  end if;

  sample_pkg.demo_tag_sync(
    p_new_tags      => :new.tags,
    p_old_tags      => :old.tags,
    p_content_type  => 'PRODUCT',
    p_content_id    => :new.product_id );
END;
/

create or replace trigger "DEMO_PRODUCT_INFO_BD"
    before delete on demo_product_info
    for each row
begin
    sample_pkg.demo_tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'PRODUCT',
        p_content_id    => :old.product_id );

end;
/


-- Table:  DEMO_ORDER_ITEMS
CREATE TABLE  "DEMO_ORDER_ITEMS" (
    "ORDER_ITEM_ID" NUMBER(3,0) NOT NULL ENABLE,
    "ORDER_ID" NUMBER NOT NULL ENABLE,
    "PRODUCT_ID" NUMBER NOT NULL ENABLE,
    "UNIT_PRICE" NUMBER(8,2) NOT NULL ENABLE,
    "QUANTITY" NUMBER(8,0) NOT NULL ENABLE,
    CONSTRAINT "DEMO_ORDER_ITEMS_PK" PRIMARY KEY ("ORDER_ITEM_ID") ENABLE,
    CONSTRAINT "DEMO_ORDER_ITEMS_UK" UNIQUE ("ORDER_ID","PRODUCT_ID") ENABLE,
    CONSTRAINT "DEMO_ORDER_ITEMS_FK" FOREIGN KEY ("ORDER_ID")
     REFERENCES  "DEMO_ORDERS" ("ORDER_ID") ON DELETE CASCADE ENABLE,
    CONSTRAINT "DEMO_ORDER_ITEMS_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
     REFERENCES  "DEMO_PRODUCT_INFO" ("PRODUCT_ID") ON DELETE CASCADE ENABLE
);

CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_BI"
  BEFORE insert on "DEMO_ORDER_ITEMS" for each row
declare
  order_item_id number;
begin
  if :new.order_item_id is null then
    select demo_order_items_seq.nextval 
      into order_item_id 
      from dual;
    :new.order_item_id := order_item_id;
  end if;
end;
/

CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_AIUD_TOTAL"
  after insert or update or delete on demo_order_items
begin
  -- Update the Order Total when any order item is changed
  update demo_orders set order_total =
  (select sum(unit_price*quantity) from demo_order_items
    where demo_order_items.order_id = demo_orders.order_id);
end;
/

CREATE OR REPLACE TRIGGER  "DEMO_ORDER_ITEMS_BIU_GET_PRICE"
  before insert or update on demo_order_items for each row
declare
  l_list_price number;
begin
  if :new.unit_price is null then
    -- First, we need to get the current list price of the order line item
    select list_price
    into l_list_price
    from demo_product_info
    where product_id = :new.product_id;
    -- Once we have the correct price, we will update the order line with the correct price
    :new.unit_price := l_list_price;
  end if;
end;
/


-- Table: DEMO_STATES
CREATE TABLE  "DEMO_STATES" (
    "ST" VARCHAR2(30),
    "STATE_NAME" VARCHAR2(30)
 );

-- Table: DEMO_CONSTRAINT_LOOKUP
create table DEMO_CONSTRAINT_LOOKUP
(
  CONSTRAINT_NAME VARCHAR2(30)   primary key,
  MESSAGE         VARCHAR2(4000) not null
);
