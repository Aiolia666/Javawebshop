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

Date: 2019-05-10 08:51:01
*/


-- ----------------------------
-- Table structure for S_DINGDAN
-- ----------------------------
DROP TABLE "SCOTT"."S_DINGDAN";
CREATE TABLE "SCOTT"."S_DINGDAN" (
"DINGDANNUM" VARCHAR2(20 BYTE) NULL ,
"USERNAME" VARCHAR2(20 BYTE) NULL ,
"PNUM" VARCHAR2(20 BYTE) NULL ,
"NUM" NUMBER NULL ,
"TYPE" NUMBER NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
