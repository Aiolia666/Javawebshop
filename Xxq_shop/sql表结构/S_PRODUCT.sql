/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : OT
Source Server Version : 110200
Source Host           : 127.0.0.1:1522
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2019-05-10 08:51:26
*/


-- ----------------------------
-- Table structure for S_PRODUCT
-- ----------------------------
DROP TABLE "SCOTT"."S_PRODUCT";
CREATE TABLE "SCOTT"."S_PRODUCT" (
"PNUM" NUMBER NOT NULL ,
"PNAME" VARCHAR2(20 BYTE) NULL ,
"PXINXI" VARCHAR2(20 BYTE) NULL ,
"PRICE" FLOAT(126) NULL ,
"PCLASS" VARCHAR2(20 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "SCOTT"."S_PRODUCT"."PCLASS" IS '类别';

-- ----------------------------
-- Indexes structure for table S_PRODUCT
-- ----------------------------

-- ----------------------------
-- Triggers structure for table S_PRODUCT
-- ----------------------------
CREATE OR REPLACE TRIGGER "SCOTT"."ADDD" BEFORE INSERT ON "SCOTT"."S_PRODUCT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW ENABLE
begin  
   if inserting then 
      if :NEW."PNUM" is null then 
         select TAB_USERINFO_SEQUENCE.nextval into :NEW."PNUM" from dual; 
      end if; 
   end if; 
end;
CREATE OR REPLACE TRIGGER "SCOTT"."ADDNUM" BEFORE INSERT ON "SCOTT"."S_PRODUCT" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW DISABLE
begin  
   if inserting then 
      if :NEW."PNUM" is null then 
         select TAB_PRODUCT_SEQUENCE.nextval into :NEW."PNUM" from dual; 
      end if; 
   end if; 
end;

-- ----------------------------
-- Checks structure for table S_PRODUCT
-- ----------------------------
ALTER TABLE "SCOTT"."S_PRODUCT" ADD CHECK ("PNUM" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_PRODUCT
-- ----------------------------
ALTER TABLE "SCOTT"."S_PRODUCT" ADD PRIMARY KEY ("PNUM");
