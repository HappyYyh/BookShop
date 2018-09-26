/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 25/09/2018 17:42:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for big_category
-- ----------------------------
DROP TABLE IF EXISTS `big_category`;
CREATE TABLE `big_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类类名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bname`(`bname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_category
-- ----------------------------
INSERT INTO `big_category` VALUES (3, '人文社科');
INSERT INTO `big_category` VALUES (2, '文艺');
INSERT INTO `big_category` VALUES (5, '生活');
INSERT INTO `big_category` VALUES (6, '科技');
INSERT INTO `big_category` VALUES (4, '经管');
INSERT INTO `big_category` VALUES (1, '网络文学');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `super_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大类',
  `sub_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'isbn编号',
  `introduce` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `price` double NULL DEFAULT NULL COMMENT '原价',
  `now_price` double NULL DEFAULT NULL COMMENT '现价',
  `photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `pages` int(11) NULL DEFAULT NULL COMMENT '页数',
  `publisher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `new_book` tinyint(1) NULL DEFAULT NULL COMMENT '是否新书',
  `sale_book` tinyint(1) NULL DEFAULT NULL COMMENT '是否热卖',
  `special_book` tinyint(1) NULL DEFAULT NULL COMMENT '是否特价',
  `recommend_book` tinyint(1) NULL DEFAULT NULL COMMENT '是否特别推荐',
  `add_date` datetime(0) NULL DEFAULT NULL COMMENT '上架日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `super_type`(`super_type`) USING BTREE,
  INDEX `sub_type`(`sub_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '网络文学', '玄幻', '冰与火之歌', '3222587143', '“冰与火之歌”系列小说是美国奇幻大师乔治马丁穷十六年之力，以无比宽博雄浑的气魄，同时又细如发丝的精心构制，成就的当今世界上堪称奇幻**的宏篇巨构。 “冰与火之歌”在评论家们眼中是美国“国宝”级的幻想文学作品，在读者心目中它是几乎无法超越的“神作”', 120, 90.6, '冰与火之歌.PNG', 624, '重庆出版社', '乔治R.R马丁', 0, 1, 0, 0, '2012-01-17 00:00:00');
INSERT INTO `book` VALUES (2, '网络文学', '武侠', '择天记', '8964976999', '东土大陆，一个由命运掌控的世界。', 123, 33.5, '择天记.jpg', 223, '人民文学出版社', '猫腻', 0, 1, 0, 0, '2017-05-10 00:00:00');
INSERT INTO `book` VALUES (3, '文艺', '文学', '用孤独和世界对谈', '0982996996', '本书收录清末至今在文学领域影响巨大的20位文学大师的生平、成就、作品、态度与高度.\r\n穿越百年时光与大师对谈，从他们的生命中照见自己，从孤独中懂得体谅，从慈悲中学会坚强。', 42, 31.2, '用孤独和世界对谈.jpg', 127, '国馆', '北京联合出版有限公司', 0, 0, 0, 0, '2018-09-12 00:00:00');
INSERT INTO `book` VALUES (4, '文艺', '艺术', '巴洛克艺术', '9368737183', '本书是德国专业摄影团队十年心血之作，书中近700幅精美图片，详尽的艺术文化史梳理，以前所未有的规模，全面系统地呈现出巴洛克时期绘画、雕塑、建筑、工艺等各个方面的成就，引领读者游历巴洛克艺术世界，探知那宗教激情与尘世享乐、技术理性与迷狂感官的谐和之境，并解读那华丽不可方物的奢华风格背后，人性的欲求与神性的光芒。', 998, 658.6, '巴洛克艺术.jpg', 1200, '北京美术摄影出版社', '罗尔夫?托曼', 0, 0, 0, 0, '2013-03-01 00:00:00');
INSERT INTO `book` VALUES (5, '文艺', '摄影', '寻找幸福 阿尔卑斯的另一种生活', '0145469712', '我们幸福吗？好多人都无法回答这个问题。不过有个数据可以给我们参照：英国新经济基金会发布的“幸福星球指数”上找不到中国。', 70, 34.5, '寻找幸福-阿尔卑斯的另一种生活.jpg', 133, '广东人民出版社', '薄义群', 1, 1, 0, 0, '2011-06-01 00:00:00');
INSERT INTO `book` VALUES (6, '人文社科', '历史', '我们世界的历史', '0513249812', '这是一部堪称经典的世界通史著作，自1976年初版问世以来，广受欢迎，不断重印，并根据世界局势出现的新发展、新动向，不定期进行修订和新的展望，目前已出到第六版。该书按时间序列和历史阶段特点，共分八个篇章，概述了人类从诞生之初直至21世纪的历史，突出分析了那些影响着人类发展的重大事件和进程，但强调指出，历史始终是惯性和革新相互作用的结果，唯有从这个角度才能真正把握历史的连贯发展和真切的转折突破。全书视野广阔，文字优美，对于完整理解人类从古至今的发展历程的大众读者，提供了难得的指引和阅读享受。', 195, 95.5, '我们世界的历史.jpg', 822, '东方出版中心', 'J.M.罗伯茨 ', 1, 0, 0, 1, '2018-07-28 00:00:00');
INSERT INTO `book` VALUES (7, '人文社科', '心理学', ' 我看见的你就是我自己', '7558351657', '本书是意大利知名记者与镜像神经元的发现者里佐拉蒂的谈话录。内容涉及神经科学、心理学、哲学、社会学、语言学等，让读者从神经科学的角度窥见人与人、人与社会的方方面面。', 49.8, 36.9, '我看见的你就是我自己.jpg', 66, '北京联合出版有限公司', ' 贾科莫·里佐拉蒂', 0, 1, 0, 0, '2018-08-17 00:00:00');
INSERT INTO `book` VALUES (8, '人文社科', '政治/军事', '梁衡评点中国历史人物', '2163851672', '本书精选了梁衡1996年至2017年创作的人物散文36篇，包括对*、周恩来、彭德怀、张闻天、瞿秋白、方志敏、邓小平、项羽、诸葛亮、陶渊明、韩愈、范仲淹、文天祥、柳永、李清照、林则徐、沈葆桢、王洛宾、季羡林、赵朴初、吴文季等名人的评点、感悟和思考。图书采以图配文的编排，增加了文本的美感和轻阅读感。', 48, 34.6, '梁衡评点中国历史人物.jpg', 347, '湖南人民出版社', '梁衡', 1, 0, 1, 1, '2017-11-30 00:00:00');
INSERT INTO `book` VALUES (9, '人文社科', '古籍', '四书五经', '1582115167', '南宋光宗绍熙四年（1190），正在漳州任上的朱熹刊行了他编注的《四子书》，也就是后人所说的《四书章句集注》，也就是现在由王华宝、王玉德、朱志先、钱宗武、钱忠弼等共同整理的《四书五经（大儒注本共4册）（精）》一书的初识原本，包括《大学章句》一卷、《中庸章句》一卷、《论语集注》十卷、《孟子集注》七卷。大概连朱熹本人也始料未及的是，这部文字浅近、篇帙并不浩繁的*作面世之后，势头甚至盖过了《诗》、《书》、《礼》、《易》、《春秋》等《五经》，成为此后七百多年中*具影响力的文献。 本次整理力求文字正确，标点准确，篇章条理清晰，板式疏朗醒目，便于阅读了解。', 380, 300.2, '四书五经.jpg', 1024, '凤凰出版社', '朱熹', 0, 1, 0, 0, '2015-06-19 00:00:00');
INSERT INTO `book` VALUES (10, '经管', '经济', '经济学的思维方式', '4951398069', '经济学一点也不复杂，也不难理解，困扰我们的是故作艰深的语言和拒人千里之外的形式。本书没有让人望而生畏公式图表，也没有难懂的术语，更没有枯燥的实证。托马斯·索维尔用*贴近日常生活的语言和案例，为我们讲解经济学博士都不一定能完全掌握的经济学思维方式，让所有人都能体验毫无障碍的阅读，并且在无形中学会经济学这一门专业知识体系和分析工具，让普通人不再受含糊的政治辞令和晦涩的经济学术语的迷惑，掌握经济社会的运转规律。', 88.8, 63.2, '经济学的思维方式.jpg', 223, '四川人民出版社', '托马斯·索维尔', 1, 0, 0, 0, '2018-09-19 00:00:00');
INSERT INTO `book` VALUES (11, '经管', '投资理财', '财富自由之路', '5496504085', '你升级过自己的“操作系统”吗？我们每个人都有自己的“操作系统”，一个不断升级的“操作系统”不仅能给我们带来体验上的快感，还能帮我们更好地优化自己的方向，在正确的方向上做出正确的决定并身体力行地去实践。本书帮助你认清自己的“操作系统”，用作者的亲身经历教你如何升级自己的“操作系统”，并运用它实现自我成长，走上财富自由之路。', 69, 51.7, '财富自由之路.jpg', 168, '电子工业出版社', '李笑来', 1, 0, 0, 1, '2017-10-24 00:00:00');
INSERT INTO `book` VALUES (12, '生活', '孕期', '好孕书：陪你从备孕到生娃', '5647122605', '这是一部从备孕到生娃的全程指南读物，提供从备孕到生娃的所有经验。作者PP殿下采用图文并茂的方式，详细描绘了她从怀孕初期时的注意事项，经历各种孕检时的细节，以及怀孕期间可能遇到的体验，孕晚期出行，待产准备顺产以及*终通过剖腹产顺利生产的全过程。其中不乏孕期所续的各种知识，也有给孕期女性关怀的心灵抚慰。是一本值得备孕期及孕期准父母阅读的图书。', 58, 48.4, '好孕书-陪你从备孕到生娃.jpg', 56, '四川科技出版社', 'PP殿下', 0, 1, 0, 0, '2018-06-13 00:00:00');
INSERT INTO `book` VALUES (13, '生活', '育儿', '好爸爸的影响力', '2655166685', '可以说，爸爸的任何成功，都弥补不了父爱缺位的损失。在孩子的心目中，爸爸的形象是高大伟岸的，爸爸的声音是铿锵有力的，爸爸的气概是气吞山河的。妈妈永远代替不了爸爸的角色，对孩子们来说，爸爸是他们成长路上珍贵的一笔财富。再忙也要陪孩子，孩子的成长少不了爸爸的陪伴，孩子的成才也少不了爸爸的榜样。本书为爸爸们提供了诸多亲子教育方法，如何“扮演”孩子的好玩伴？如何做孩子这块璞玉的创造者、发现者以及雕琢者？如何做值得孩子信赖的好爸爸？如何培养小小男子汉？如何做小公主的保护神？如何许给孩子一个无比美好的未来？种种问题，本书都为爸爸们做了科学的解答。请爸爸们放下手中繁忙的工作，与妈妈们联手互补，陪伴孩子共同成长。', 38, 26.2, '好爸爸的影响力.jpg', 47, '天津人民出版社', '李雪', 1, 0, 0, 0, '2018-05-17 00:00:00');
INSERT INTO `book` VALUES (14, '科技', '科普', '亿万年的孤独:地外文明探寻史话', '1916336668', '160多年之后的今天，世界上*口径的射电望远镜——“中国天眼”，仍在聆听来自宇宙的声音，期待收到外星文明的呼叫。', 39.7, 29, '亿万年的孤独-地外文明探寻史话.jpg', 231, '北京时代华文书局', '汪洁', 0, 1, 0, 1, '2018-08-21 00:00:00');
INSERT INTO `book` VALUES (15, '科技', '自然科学', '你不可不知的50个天文知识', '8115283208', '你不可不知的50个天文知识》通过50篇短小精干的短文，清晰简明地介绍了天体物理学中的基本概念、主要发现以及前沿知识。主要内容包括日心说、牛顿光学理论等天文学基本原理，宇宙的起源和演变，相对论、超大质量黑洞和多重宇宙等宇宙学核心概念，以及人类对类星体、行星和天体生物学认识的*进展。同时，还介绍了矮行星、暗物质、宇宙大爆炸、恒星死亡等尖端科学。', 32, 25.1, '你不可不知的50个天文知识.jpg', 88, '人民邮电出版社', 'Joanne Baker', 1, 0, 0, 0, '2013-10-19 00:00:00');
INSERT INTO `book` VALUES (16, '', '', '荒野求生', '7029039990', '\r\n斩获十二项国际大奖的畅销巨作！卫报年度Zui佳作品。我们身处不同世界，但成长、亲情与人性，却从来没有什么不同。', 25, 18.8, '荒野求生.PNG', 45, '接力出版社', '贝尔·格里尔斯', 1, 0, 0, 1, '2018-04-03 00:00:00');
INSERT INTO `book` VALUES (17, '', '', '小猪佩奇', '2394666756', '深受孩子们喜欢的图书', 64.8, 55.2, '小猪佩奇.jpg', 111, '安徽少年儿童出版社', '英国快乐瓢虫出版公司 ', 0, 1, 0, 0, '2018-04-23 00:00:00');
INSERT INTO `book` VALUES (21, '', '', '我的test', '1234567890', '潇潇出品，必属精品1111', 56, 25, NULL, 100, '潇潇出版社', '潇潇', 1, 0, 0, 0, NULL);
INSERT INTO `book` VALUES (22, '', '', '冰', '1234567890', 'lalaa', 22, 11, '01bb7252-fda9-406d-83ab-c34eaa116f8c.PNG', 126, '我的', 'Jack', 1, 0, 0, 0, '2018-09-20 00:00:00');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '书籍id',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (39, 10, 19, 1);
INSERT INTO `cart` VALUES (40, 10, 3, 1);
INSERT INTO `cart` VALUES (60, 21, 21, 1);
INSERT INTO `cart` VALUES (62, 1, 1, 1);
INSERT INTO `cart` VALUES (64, 2, 3, 1);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单',
  `book_id` int(50) NULL DEFAULT NULL COMMENT '图书编号',
  `num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (25, '2018092011380202', 16, 1);
INSERT INTO `orderdetail` VALUES (26, '2018092011380202', 1, 3);
INSERT INTO `orderdetail` VALUES (27, '2018092011380202', 2, 1);
INSERT INTO `orderdetail` VALUES (28, '2018092011380202', 11, 1);
INSERT INTO `orderdetail` VALUES (29, '2018092011411902', 1, 1);
INSERT INTO `orderdetail` VALUES (30, '2018092011411902', 2, 1);
INSERT INTO `orderdetail` VALUES (31, '2018092011425110', 6, 1);
INSERT INTO `orderdetail` VALUES (32, '2018092011425110', 5, 1);
INSERT INTO `orderdetail` VALUES (33, '2018092011425110', 3, 2);
INSERT INTO `orderdetail` VALUES (34, '2018092014500902', 1, 1);
INSERT INTO `orderdetail` VALUES (35, '2018092014524220', 1, 4);
INSERT INTO `orderdetail` VALUES (36, '2018092014543401', 1, 1);
INSERT INTO `orderdetail` VALUES (37, '2018092014543401', 2, 2);
INSERT INTO `orderdetail` VALUES (38, '2018092014545801', 8, 1);
INSERT INTO `orderdetail` VALUES (39, '2018092015003601', 1, 1);
INSERT INTO `orderdetail` VALUES (40, '2018092015003601', 6, 1);
INSERT INTO `orderdetail` VALUES (41, '2018092016130413', 7, 3);
INSERT INTO `orderdetail` VALUES (42, '2018092016130413', 11, 1);
INSERT INTO `orderdetail` VALUES (43, '2018092016140713', 2, 1);
INSERT INTO `orderdetail` VALUES (44, '2018092016234921', 9, 4);
INSERT INTO `orderdetail` VALUES (45, '2018092016234921', 13, 1);
INSERT INTO `orderdetail` VALUES (46, '2018092016240121', 2, 1);
INSERT INTO `orderdetail` VALUES (47, '2018092016251321', 3, 1);
INSERT INTO `orderdetail` VALUES (48, '2018092016265421', 2, 1);
INSERT INTO `orderdetail` VALUES (49, '2018092016265421', 4, 1);
INSERT INTO `orderdetail` VALUES (50, '2018092110124522', 2, 3);
INSERT INTO `orderdetail` VALUES (51, '2018092110124522', 3, 1);
INSERT INTO `orderdetail` VALUES (52, '2018092110132122', 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户',
  `rec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态',
  `shipdate` datetime(0) NULL DEFAULT NULL COMMENT '发货日期',
  `orderdate` datetime(0) NULL DEFAULT NULL COMMENT '订单日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '2018092011380202', 2, '李四', '北京', '17312221739', 1, NULL, '2018-09-20 11:38:06');
INSERT INTO `orders` VALUES (5, '2018092011411902', 2, '李四', '北京', '17312221739', 2, NULL, '2018-09-20 11:41:29');
INSERT INTO `orders` VALUES (6, '2018092011425110', 10, '赵六', '', '', 1, NULL, '2018-09-20 11:42:58');
INSERT INTO `orders` VALUES (7, '2018092014500902', 2, '李四', '北京', '17312221739', 1, '2018-09-21 09:59:40', '2018-09-20 14:50:15');
INSERT INTO `orders` VALUES (8, '2018092014524220', 20, '爱死了', '', '', 1, NULL, '2018-09-20 14:52:48');
INSERT INTO `orders` VALUES (9, '2018092014543401', 1, '张三', '江苏南京', '17314111222', 2, NULL, '2018-09-20 14:54:38');
INSERT INTO `orders` VALUES (10, '2018092014545801', 1, '张三', '江苏南京', '17314111222', 1, NULL, '2018-09-20 14:55:03');
INSERT INTO `orders` VALUES (11, '2018092015003601', 1, '张三', '江苏南京', '17314111222', 1, '2018-09-21 09:59:35', '2018-09-20 15:00:41');
INSERT INTO `orders` VALUES (12, '2018092016130413', 13, '潇潇', '', '', 1, NULL, '2018-09-20 16:13:07');
INSERT INTO `orders` VALUES (13, '2018092016140713', 13, '潇潇', '南京市雨花台区', '17721521263', 1, NULL, '2018-09-20 16:14:08');
INSERT INTO `orders` VALUES (14, '2018092016234921', 21, '潇潇五号', '', '', 1, NULL, '2018-09-20 16:23:55');
INSERT INTO `orders` VALUES (15, '2018092016240121', 21, '潇潇五号', '', '', 1, NULL, '2018-09-20 16:24:02');
INSERT INTO `orders` VALUES (16, '2018092016251321', 21, '潇潇五号', '', '', 1, NULL, '2018-09-20 16:25:14');
INSERT INTO `orders` VALUES (17, '2018092016265421', 21, '潇潇五号', '', '', 1, NULL, '2018-09-20 16:26:59');
INSERT INTO `orders` VALUES (18, '2018092110124522', 22, '开心', '江苏南京', '', 1, NULL, '2018-09-21 10:13:09');
INSERT INTO `orders` VALUES (19, '2018092110132122', 22, '开心', '江苏南京', '', 1, NULL, '2018-09-21 10:13:23');

-- ----------------------------
-- Table structure for small_category
-- ----------------------------
DROP TABLE IF EXISTS `small_category`;
CREATE TABLE `small_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NULL DEFAULT NULL COMMENT '大类id',
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小类名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sname`(`sname`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of small_category
-- ----------------------------
INSERT INTO `small_category` VALUES (1, 1, '玄幻');
INSERT INTO `small_category` VALUES (2, 1, '武侠');
INSERT INTO `small_category` VALUES (3, 2, '文学');
INSERT INTO `small_category` VALUES (4, 2, '艺术');
INSERT INTO `small_category` VALUES (5, 2, '摄影');
INSERT INTO `small_category` VALUES (6, 3, '历史');
INSERT INTO `small_category` VALUES (7, 3, '心理学');
INSERT INTO `small_category` VALUES (8, 3, '政治/军事');
INSERT INTO `small_category` VALUES (9, 3, '古籍');
INSERT INTO `small_category` VALUES (10, 4, '经济');
INSERT INTO `small_category` VALUES (11, 4, '投资理财');
INSERT INTO `small_category` VALUES (12, 5, '孕期');
INSERT INTO `small_category` VALUES (13, 5, '育儿');
INSERT INTO `small_category` VALUES (14, 6, '科普');
INSERT INTO `small_category` VALUES (15, 6, '自然科学');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `postcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `add_date` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhangsan', '123456', 'zhangsan@qq.com', '张三', 0, '1997-09-17 00:00:00', '江苏南京', '213300', '17314111222', '1', '2018-02-26 14:13:39');
INSERT INTO `user` VALUES (2, 'lisi', '123', 'lisi@qq.com', '李四', 1, '1970-01-01 00:00:00', '北京', '222211', '17312221739', '1', NULL);
INSERT INTO `user` VALUES (3, 'wangwu', '123', 'wangwu@qq.com', '王五', 1, '1998-08-27 00:00:00', '天上', '234522', '17332111222', '2', '2018-09-17 14:41:18');
INSERT INTO `user` VALUES (10, 'zhaoliu', '1234', 'zhaoliu@qq.com', '赵六', 0, NULL, NULL, NULL, NULL, '1', '2018-09-17 15:26:38');
INSERT INTO `user` VALUES (12, 'feitian', '1234', 'feitian@163.com', '飞天啊啊啊', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-17 20:25:11');
INSERT INTO `user` VALUES (13, 'xiaoixao', 'xxxx', 'xiaoxiao@xiaoxiao.com', '潇潇', NULL, '2018-09-05 00:00:00', '南京市雨花台区', '213300', '17721521263', '1', '2018-09-17 23:27:11');
INSERT INTO `user` VALUES (14, 'xiaoxiao2', 'xxxx', 'xiaoxiao@xiaoxiao.com', '潇潇二号', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-17 23:27:55');
INSERT INTO `user` VALUES (15, 'xiaoxiao3', 'xxxx', 'xiaoxiao@xiaoxiao.com', '潇潇三号', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-17 23:28:23');
INSERT INTO `user` VALUES (16, 'feifei', 'ffff', 'feifei@feifei.com', '嗨嗨', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-17 23:28:50');
INSERT INTO `user` VALUES (17, 'feifeiaa', 'ffff', 'feifei@feifei.com', '飞飞', NULL, NULL, NULL, NULL, NULL, '2', '2018-09-17 23:29:35');
INSERT INTO `user` VALUES (18, 'adads', 'aaaa', 'xiaoxiao@xiaoxiao.com', '我啊', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-17 23:29:58');
INSERT INTO `user` VALUES (19, '1234', '1234', '121212@qq.com', '去问问', 0, NULL, 'asdsds', NULL, NULL, '2', '2018-09-19 14:05:36');
INSERT INTO `user` VALUES (20, '12345', '123456', '12345@qq.com', '爱死了', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-20 14:51:39');
INSERT INTO `user` VALUES (21, 'xiaoxiao', 'XXXX', 'xiaoxiao@xiaoxiao.com', '潇潇五号', NULL, NULL, NULL, NULL, NULL, '1', '2018-09-20 16:23:13');
INSERT INTO `user` VALUES (22, 'kaixin', '1234', 'kaixin@qq.com', '开心', NULL, NULL, '江苏南京', '213300', NULL, '2', '2018-09-21 10:11:05');

SET FOREIGN_KEY_CHECKS = 1;
