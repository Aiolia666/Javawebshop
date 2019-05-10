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

Date: 2019-05-10 08:51:34
*/


-- ----------------------------
-- Table structure for S_SHOPCART
-- ----------------------------
DROP TABLE "SCOTT"."S_SHOPCART";
CREATE TABLE "SCOTT"."S_SHOPCART" (
"USERNAME" VARCHAR2(20 BYTE) NULL ,
"PNUM" VARCHAR2(20 BYTE) NULL ,
"NUM" NUMBER NULL ,
"ID" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
