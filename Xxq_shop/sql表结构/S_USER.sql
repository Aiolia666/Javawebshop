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

Date: 2019-05-10 08:51:39
*/


-- ----------------------------
-- Table structure for S_USER
-- ----------------------------
DROP TABLE "SCOTT"."S_USER";
CREATE TABLE "SCOTT"."S_USER" (
"USERNAME" VARCHAR2(20 BYTE) NOT NULL ,
"PASSWORD" VARCHAR2(20 BYTE) NULL ,
"MONEY" FLOAT(126) DEFAULT 0  NULL ,
"PHONE" VARCHAR2(20 BYTE) NULL ,
"PLACE" VARCHAR2(20 BYTE) NULL ,
"ADDRESS" VARCHAR2(20 BYTE) NULL ,
"TYPE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "SCOTT"."S_USER"."PLACE" IS '所在地';
COMMENT ON COLUMN "SCOTT"."S_USER"."ADDRESS" IS '详细收货地址';

-- ----------------------------
-- Indexes structure for table S_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table S_USER
-- ----------------------------
ALTER TABLE "SCOTT"."S_USER" ADD CHECK ("USERNAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table S_USER
-- ----------------------------
ALTER TABLE "SCOTT"."S_USER" ADD PRIMARY KEY ("USERNAME");
