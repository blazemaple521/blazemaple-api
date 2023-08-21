/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : blazemaple_api

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 20/08/2023 22:53:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址',
  `host` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名',
  `requestParams` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `requestParamsRemark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数说明',
  `responseParamsRemark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应参数说明',
  `requestHeader` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求头',
  `responseHeader` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应头',
  `status` int NOT NULL DEFAULT 0 COMMENT '接口状态（0-关闭，1-开启）',
  `method` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `userId` bigint NOT NULL COMMENT '创建人',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO `interface_info` VALUES (1, '获取当前用户名称', '获取用户名称', '/api/name/user', 'http://47.113.192.56:8090', '{\n    \"username\": \"nero\"\n}', NULL, NULL, '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'POST', 1693180811174727681, '2023-06-14 21:18:10', '2023-08-20 22:46:19', 0);
INSERT INTO `interface_info` VALUES (24, '随机头像', '随机获取一个头像地址', '/api/rand.avatar', 'http://47.113.192.56:8090', 'sort=男&format=json', '[{\"id\":1688957070977,\"name\":\"sort\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[男|女|动漫男|动漫女]，为空随机输出\"},{\"id\":1688957075391,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|images]\"}]', '[{\"id\":1688957088125,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688957090261,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1688957090855,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 1693180811174727681, '2023-07-08 12:07:23', '2023-08-20 22:46:47', 0);
INSERT INTO `interface_info` VALUES (26, '网易云音乐随机歌曲', '网易云音乐，随机歌曲输出。', '/api/rand.music', 'http://47.113.192.56:8090', 'sort=热歌榜&format=json', '[{\"id\":1,\"name\":\"sort\",\"isRequired\":\"否\",\"type\":\"string\",\"remark\":\"选择输出分类[热歌榜|新歌榜|飙升榜|抖音榜|电音榜]，为空输出热歌榜\"},{\"id\":2,\"name\":\"mid\",\"isRequired\":\"否\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688815371547,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]', '[{\"id\":1688815422793,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688815424624,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回歌曲数据\"},{\"id\":1688815425060,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]', '{\"Content-Type\": \"application/json\"}', '{\"Content-Type\": \"application/json\"}', 1, 'GET', 1693180811174727681, '2023-07-08 16:30:06', '2023-08-20 22:46:47', 0);
INSERT INTO `interface_info` VALUES (27, '网易云音乐热门评论', '网易云音乐热门评论随机API接口', '/api/comments.163', 'http://47.113.192.56:8090', 'format=json', '[{\"id\":1688816624700,\"name\":\"mid\",\"isRequired\":\"no\",\"type\":\"int\",\"remark\":\"网易云歌单ID\"},{\"id\":1688816632619,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出格式[json|mp3]\"}]', '[{\"id\":1688816648171,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1688816649732,\"name\":\"data\",\"type\":\"string\",\"remark\":\"返回评论数据\"},{\"id\":1688816650394,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息\"}]', NULL, NULL, 1, 'GET', 1693180811174727681, '2023-07-08 17:05:42', '2023-08-20 22:46:47', 0);
INSERT INTO `interface_info` VALUES (29, '随机壁纸', '随机获取一个壁纸地址', '/sjbz/api.php', 'http://47.113.192.56:8090', 'lx=dongman&format=json', '[{\"id\":1689002138135,\"name\":\"method\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸端[mobile|pc|zsy]默认为pc\"},{\"id\":1689002153560,\"name\":\"lx\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择输出分类[meizi|dongman|fengjing|suiji]，为空随机输出\"},{\"id\":1689002153860,\"name\":\"format\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"输出壁纸格式[json|images]默认为images\"}]', '[{\"id\":1689002171759,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689002173057,\"name\":\"imgurl\\t\",\"type\":\"string\",\"remark\":\"返回图片地址\"},{\"id\":1689002173621,\"name\":\"width\",\"type\":\"string\",\"remark\":\"返回图片宽度\"},{\"id\":1689002184505,\"name\":\"height\\t\",\"type\":\"string\",\"remark\":\"返回图片高度\"}]', NULL, NULL, 1, 'GET', 1693180811174727681, '2023-07-09 20:28:31', '2023-08-20 22:46:47', 0);
INSERT INTO `interface_info` VALUES (30, '毒鸡汤', '随机生成一句毒鸡汤语录', '/yan/api.php', 'http://47.113.192.56:8090', 'charset=utf-8&encode=json', '[{\"id\":1689002041985,\"name\":\"charset\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回编码类型[gbk|utf-8]默认utf-8\"},{\"id\":1689002080311,\"name\":\"encode\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"返回格式类型[text|js|json]默认text\"}]', '[{\"id\":1689002092752,\"name\":\"code\",\"type\":\"string\",\"remark\":\"code\"}]', NULL, NULL, 1, 'GET', 1693180811174727681, '2023-07-09 21:17:10', '2023-08-20 22:46:47', 0);
INSERT INTO `interface_info` VALUES (31, '抖音解析', '解析抖音链接，获取无水印链接', '/dyjx/api.php', 'http://47.113.192.56:8090', 'url=https://v.douyin.com/J8TVGVn/', '[{\"id\":1689003649028,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要解析的抖音地址\"}]', '[{\"id\":1689003654626,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003659703,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"状态码说明\"},{\"id\":1689003660215,\"name\":\"data\",\"type\":\"string\",\"remark\":\"链接解析信息\"}]', NULL, NULL, 1, 'GET/POST', 1693180811174727681, '2023-07-10 23:29:28', '2023-08-20 22:46:47', 1);
INSERT INTO `interface_info` VALUES (32, 'Qrcode二维码', '生成在线二维码', '/qrcode/api.php', 'http://47.113.192.56:8090', 'text=https://api.btstu.cn&size=300', '[{\"id\":1689003685138,\"name\":\"text\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"二维码内容\"},{\"id\":1689003723361,\"name\":\"size\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"二维码大小，单位为px\"}]', '[{\"id\":1689003739093,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689003740418,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"}]', NULL, NULL, 1, 'GET', 1693180811174727681, '2023-07-10 23:36:22', '2023-08-20 22:46:47', 1);
INSERT INTO `interface_info` VALUES (33, '获取QQ昵称和头像', '获取QQ昵称和头像', '/qqxt/api.php', 'http://47.113.192.56:8090', 'qq=10001', '[{\"id\":1689004243483,\"name\":\"qq\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"查询的QQ号码\"}]', '[{\"id\":1689004308636,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004319045,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示！\"},{\"id\":1689004319618,\"name\":\"imgurl\",\"type\":\"string\",\"remark\":\"QQ头像图片地址\"},{\"id\":1689004320086,\"name\":\"name\",\"type\":\"string\",\"remark\":\"QQ昵称\"}]', NULL, NULL, 1, 'GET', 1693180811174727681, '2023-07-10 23:52:19', '2023-08-20 22:46:47', 1);
INSERT INTO `interface_info` VALUES (34, '短网址生成', '将长网址进行缩短，支持百度、新浪、腾讯短网址等等。', '/api/long2dwz', 'http://47.113.192.56:8090', 'dwzapi=urlcn&url=http://qrpay.uomg.com', '[{\"id\":1689004480035,\"name\":\"url\",\"isRequired\":\"yes\",\"type\":\"string\",\"remark\":\"需要进行缩短的长网址\"},{\"id\":1689004514429,\"name\":\"dwzapi\",\"isRequired\":\"no\",\"type\":\"string\",\"remark\":\"选择缩短接口[tcn|dwzcn|urlcn|suoim|mrwso|]\"}]', '[{\"id\":1689004538420,\"name\":\"code\",\"type\":\"string\",\"remark\":\"返回的状态码\"},{\"id\":1689004564886,\"name\":\"ae_url\",\"type\":\"string\",\"remark\":\"返回缩短后的短网址\"},{\"id\":1689004565428,\"name\":\"msg\",\"type\":\"string\",\"remark\":\"返回错误提示信息！\"}]', NULL, NULL, 1, 'GET/POST', 1693180811174727681, '2023-07-10 23:56:35', '2023-08-20 22:46:47', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `accessKey` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'accessKey',
  `secretKey` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'secretKey',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1668967663894642690 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1693180811174727681, 'blazemaple', 'bca02089cbd0d78979d8ac7a3b835f2a', NULL, NULL, 'BlazeMaple', 'https://yoloblog.oss-cn-shanghai.aliyuncs.com/OYm7rOb0-pear.jpg', 'BlazeMaple API 开发者', 'admin', 'b8376c18f71ea233242c9dd0e3fc2e2d', 'd05ffd103ecff0c0df5bb7979fd7c87a', '2023-08-20 16:38:57', '2023-08-20 21:13:23', 0);
INSERT INTO `user` VALUES (1693182973216804865, 'guest', 'bca02089cbd0d78979d8ac7a3b835f2a', NULL, NULL, 'Guest', 'https://yoloblog.oss-cn-shanghai.aliyuncs.com/8c5hHdu0-pear.jpg', NULL, 'user', 'ce69d12a819c82333053c9b51e28e26e', 'dc4add8c1b80375d7540edf49edc5046', '2023-08-20 16:47:33', '2023-08-20 22:21:37', 0);

-- ----------------------------
-- Table structure for user_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `user_interface_info`;
CREATE TABLE `user_interface_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` bigint NOT NULL COMMENT '调用用户 id',
  `interfaceInfoId` bigint NOT NULL COMMENT '接口 id',
  `totalNum` int NOT NULL DEFAULT 0 COMMENT '总调用次数',
  `leftNum` int NOT NULL DEFAULT 0 COMMENT '剩余调用次数',
  `status` int NOT NULL DEFAULT 0 COMMENT '0-正常，1-禁用',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户调用接口关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_interface_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
