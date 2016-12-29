/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     29/12/2016 01:52:55                          */
/*==============================================================*/


drop table if exists CATEGORY;

drop table if exists COMPOSED_BY_PRODUCTS;

drop table if exists CUSTOMER;

drop table if exists ORDERS;

drop table if exists PICTURES;

drop table if exists PRODUCT;

drop table if exists SHOP;

drop table if exists SHOPMAN;

drop table if exists TO_COMMENT;

drop table if exists USERS;

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   ID_CATEGORY          int not null auto_increment,
   CAT_ID_CATEGORY      int,
   NAME_CATEGORY        varchar(255),
   primary key (ID_CATEGORY)
);

/*==============================================================*/
/* Table: COMPOSED_BY_PRODUCTS                                  */
/*==============================================================*/
create table COMPOSED_BY_PRODUCTS
(
   ID_ORDER             int not null,
   ID_PRODUCT           int not null,
   QUANTITY             int,
   SIZE                 varchar(100),
   COLOR                longtext,
   primary key (ID_ORDER, ID_PRODUCT)
);

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER
(
   ID_CUSTOMER          int not null,
   primary key (ID_CUSTOMER)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   ID_ORDER             int not null auto_increment,
   ID_CUSTOMER          int not null,
   TOTAL_AMOUNT         double,
   ORDER_STATE          longtext,
   DATE_ORDER           date,
   primary key (ID_ORDER)
);

/*==============================================================*/
/* Table: PICTURES                                              */
/*==============================================================*/
create table PICTURES
(
   ID_PICTURE           int not null auto_increment,
   ID_PRODUCT           int,
   ID_SHOP              int,
   ID_CUSTOMER          int,
   PICTURE_NAME         text,
   primary key (ID_PICTURE)
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT
(
   ID_PRODUCT           int not null auto_increment,
   ID_SHOP              int not null,
   ID_CATEGORY          int not null,
   ID_SELLER            int not null,
   NAME_PRODUCT         longtext,
   PRICE_PRODUCT        double,
   DESCRIPTION          text,
   SHORT_DESCRIPTION    text,
   INITIAL_STOCK        int,
   CURRENT_STOCK        int,
   SCORE                int,
   COLORS               longtext,
   SIZES                varchar(10),
   primary key (ID_PRODUCT)
);

/*==============================================================*/
/* Table: SHOP                                                  */
/*==============================================================*/
create table SHOP
(
   ID_SHOP              int not null auto_increment,
   ID_CATEGORY          int not null,
   ID_SELLER            int not null,
   NAME_SHOP            varchar(255),
   PHONE_SHOP           bigint,
   ADDRESS_SHOP         text,
   primary key (ID_SHOP)
);

/*==============================================================*/
/* Table: SHOPMAN                                               */
/*==============================================================*/
create table SHOPMAN
(
   ID_SELLER            int not null,
   primary key (ID_SELLER)
);

/*==============================================================*/
/* Table: TO_COMMENT                                            */
/*==============================================================*/
create table TO_COMMENT
(
   ID_CUSTOMER          int not null,
   ID_PRODUCT           int not null,
   NOTE                 text,
   DATE                 datetime,
   primary key (ID_CUSTOMER, ID_PRODUCT)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   ID_USER              int not null auto_increment,
   NAME_USER            longtext,
   SURNAME_USER         longtext,
   ADDRESS_USER         text,
   PHONE_USER           bigint,
   MAIL_USER            longtext,
   PASSWORD             longtext,
   primary key (ID_USER)
);

alter table CATEGORY add constraint FK_IS_SUB_CATEGORY foreign key (CAT_ID_CATEGORY)
      references CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table COMPOSED_BY_PRODUCTS add constraint FK_COMPOSED_BY_PRODUCTS foreign key (ID_ORDER)
      references ORDERS (ID_ORDER) on delete restrict on update restrict;

alter table COMPOSED_BY_PRODUCTS add constraint FK_COMPOSED_BY_PRODUCTS2 foreign key (ID_PRODUCT)
      references PRODUCT (ID_PRODUCT) on delete restrict on update restrict;

alter table CUSTOMER add constraint FK_CLIENT_EXTENDS foreign key (ID_CUSTOMER)
      references USERS (ID_USER) on delete restrict on update restrict;

alter table ORDERS add constraint FK_COMMAND_ORDER foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table PICTURES add constraint FK_IS_PRODUCT_PICTURE foreign key (ID_PRODUCT)
      references PRODUCT (ID_PRODUCT) on delete restrict on update restrict;

alter table PICTURES add constraint FK_IS_PROFIL_PICTURE foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table PICTURES add constraint FK_IS_SHOP_PICTURE foreign key (ID_SHOP)
      references SHOP (ID_SHOP) on delete restrict on update restrict;

alter table PRODUCT add constraint FK_BELONG foreign key (ID_CATEGORY)
      references CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table PRODUCT add constraint FK_CONTAIN_PRODUCTS foreign key (ID_SHOP)
      references SHOP (ID_SHOP) on delete restrict on update restrict;

alter table PRODUCT add constraint FK_MANAGE_PRODUCTS foreign key (ID_SELLER)
      references SHOPMAN (ID_SELLER) on delete restrict on update restrict;

alter table SHOP add constraint FK_MANAGE_SHOP foreign key (ID_SELLER)
      references SHOPMAN (ID_SELLER) on delete restrict on update restrict;

alter table SHOP add constraint FK_TO_HAVE foreign key (ID_CATEGORY)
      references CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table SHOPMAN add constraint FK_SELLER_EXTENDS foreign key (ID_SELLER)
      references USERS (ID_USER) on delete restrict on update restrict;

alter table TO_COMMENT add constraint FK_TO_COMMENT foreign key (ID_CUSTOMER)
      references CUSTOMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table TO_COMMENT add constraint FK_TO_COMMENT2 foreign key (ID_PRODUCT)
      references PRODUCT (ID_PRODUCT) on delete restrict on update restrict;

