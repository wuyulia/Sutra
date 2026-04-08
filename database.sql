-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: pet_mall
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `name` varchar(50) NOT NULL COMMENT '品牌名称',
  `logo_url` varchar(255) DEFAULT '' COMMENT '品牌Logo图片地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌/厂商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'皇家 (Royal Canin)','','2026-04-02 19:33:04','2026-04-02 19:33:04'),(2,'渴望 (Orijen)','','2026-04-02 19:33:04','2026-04-02 19:33:04'),(3,'麦富迪 (Myfoodie)','','2026-04-02 19:33:04','2026-04-02 19:33:04'),(4,'伯纳天纯 (Pure&Natural)','','2026-04-02 19:33:04','2026-04-02 19:33:04'),(5,'爱肯拿 (Acana)','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(6,'耐威克 (Navarch)','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(7,'佩玛思特 (PetMaster)','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(8,'普瑞纳 (Purina)','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(9,'洁客 (Clean Paws)','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(10,'ZEZE','','2026-04-03 11:58:56','2026-04-03 11:58:56'),(88,'伯纳天纯','','2026-04-03 11:52:57','2026-04-03 11:52:57'),(120,'渴望','','2026-04-03 11:52:57','2026-04-03 11:52:57'),(200,'卫仕','','2026-04-03 11:52:57','2026-04-03 11:52:57'),(300,'麦富迪','','2026-04-03 11:52:57','2026-04-03 11:52:57'),(500,'皇家','','2026-04-03 11:52:57','2026-04-03 11:52:57');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父级分类ID（0表示顶级菜单，为你以后做多级菜单留好后路）',
  `sort` int DEFAULT '0' COMMENT '排序号（数字越大越靠前）',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除标识（0正常 1删除）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'狗狗主粮',0,0,0,'2026-04-02 19:33:04','2026-04-02 19:33:04'),(2,'猫咪主粮',0,0,0,'2026-04-02 19:33:04','2026-04-02 19:33:04'),(3,'宠物零食',0,0,0,'2026-04-02 19:33:04','2026-04-02 19:33:04'),(4,'医疗保健',0,0,0,'2026-04-02 19:33:04','2026-04-02 19:33:04'),(5,'猫砂用品',0,0,0,'2026-04-03 11:58:56','2026-04-03 11:58:56'),(6,'宠物玩具',0,0,0,'2026-04-03 11:58:56','2026-04-03 11:58:56'),(7,'洗护美容',0,0,0,'2026-04-03 11:58:56','2026-04-03 11:58:56');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(128) NOT NULL COMMENT '商品标题',
  `price` decimal(10,2) NOT NULL COMMENT '销售价格（务必用decimal防精度丢失）',
  `cover_img` varchar(255) NOT NULL COMMENT '商品封面图URL',
  `category_id` bigint NOT NULL COMMENT '所属分类ID',
  `brand_id` bigint NOT NULL COMMENT '所属品牌ID',
  `stock` int NOT NULL DEFAULT '0' COMMENT '库存数量',
  `sales_volume` int DEFAULT '0' COMMENT '销量',
  `is_self_operated` tinyint(1) DEFAULT '0' COMMENT '是否京东自营（1是 0否）',
  `status` tinyint(1) DEFAULT '1' COMMENT '上下架状态（1上架 0下架）',
  `detail_html` text COMMENT '商品详情富文本/长图',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品主表(MVP简化版)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'爱肯拿 (Acana) 经典海洋系列全犬种狗粮 11.4kg',588.00,'https://img10.360buyimg.com/n1/jfs/t1/185800/17/14660/109337/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',1,5,100,1200,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(2,'耐威克 泰迪/贵宾专用狗粮 5kg 改善泪痕',129.00,'https://img11.360buyimg.com/n1/jfs/t1/195155/38/10419/127163/60e66699E2f741165/860189004d88e001.jpg',1,6,500,50000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(3,'冠能 幼犬粮 小型犬 1-12个月 5kg 增强免疫',235.00,'https://img13.360buyimg.com/n1/jfs/t1/172314/33/14022/206981/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',1,8,200,8900,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(4,'皇家 巨型犬成犬粮 L24 15kg 关节呵护',620.00,'https://img12.360buyimg.com/n1/jfs/t1/181467/20/14101/170942/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',1,1,50,1500,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(5,'伯纳天纯 旗舰系列 羊肉蔓越莓 全犬期 12kg',438.00,'https://img11.360buyimg.com/n1/jfs/t1/130545/14/11993/135111/5f8566baEcd8848d6/763bb53443a9b1f7.jpg',1,4,300,13000,0,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(6,'佩玛思特 冰川系列 无谷低敏狗粮 10kg',356.00,'https://img10.360buyimg.com/n1/jfs/t1/191761/28/10188/90795/60e66699E2f741165/860189004d88e001.jpg',1,7,150,4200,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(7,'渴望 鸡肉全猫粮 5.4kg 进口高蛋白',650.00,'https://img11.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',2,2,80,21000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(8,'爱肯拿 农场盛宴系列 鸡肉鱼全猫粮 1.8kg',199.00,'https://img12.360buyimg.com/n1/jfs/t1/172314/33/14022/206981/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',2,5,400,5600,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(9,'皇家 K36 幼猫粮 4-12个月 10kg',485.00,'https://img14.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',2,1,120,18000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(10,'麦富迪 弗列加特全价冻干猫粮 高肉含量 1.5kg',158.00,'https://img10.360buyimg.com/n1/jfs/t1/104273/5/17498/125301/5e81d1baE27926bdf/b1b8ddfb514ffc33.jpg',2,3,600,35000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(11,'普瑞纳 珍致 银勺猫粮 营养美味 1.2kg',85.00,'https://img13.360buyimg.com/n1/jfs/t1/172314/33/14022/206981/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',2,8,300,9200,0,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(12,'耐威克 全价冻干双拼猫粮 2.5kg',79.00,'https://img11.360buyimg.com/n1/jfs/t1/195155/38/10419/127163/60e66699E2f741165/860189004d88e001.jpg',2,6,800,45000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(13,'麦富迪 宠物鸡肉条 狗零食 500g 磨牙训练',39.90,'https://img11.360buyimg.com/n1/jfs/t1/193215/22/10001/100000/60e66699E2f741165/860189004d88e001.jpg',3,3,1000,120000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(14,'珍致 进口猫罐头 金枪鱼银鱼 85g*12罐',119.00,'https://img12.360buyimg.com/n1/jfs/t1/172314/33/14022/206981/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',3,8,500,32000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(15,'喵仙儿 混合口味猫薄荷 磨牙棒 3支装',15.00,'https://img14.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',3,10,2000,15000,0,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(16,'伯纳天纯 狗狗冻干鸭肉粒 100g 增进食欲',45.00,'https://img11.360buyimg.com/n1/jfs/t1/130545/14/11993/135111/5f8566baEcd8848d6/763bb53443a9b1f7.jpg',3,4,400,8900,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(17,'卫仕 宠物复合维生素片 200片 补充营养',69.00,'https://img14.360buyimg.com/n1/jfs/t1/138135/20/21571/123122/612f0b7cE259a93ce/2e09b85c3df01859.jpg',4,3,300,25000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(18,'麦富迪 深海三文鱼油 宠物美毛亮毛 250ml',55.00,'https://img10.360buyimg.com/n1/jfs/t1/104273/5/17498/125301/5e81d1baE27926bdf/b1b8ddfb514ffc33.jpg',4,3,150,6800,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(19,'普瑞纳 幸舒 宠物益生菌 狗狗调理肠胃 30包',188.00,'https://img13.360buyimg.com/n1/jfs/t1/172314/33/14022/206981/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',4,8,200,4300,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(20,'关节舒 氨糖软骨素 宠物狗关节骨骼 120片',125.00,'https://img14.360buyimg.com/n1/jfs/t1/138135/20/21571/123122/612f0b7cE259a93ce/2e09b85c3df01859.jpg',4,6,100,2100,0,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(21,'洁客 (Clean Paws) 破碎膨润土猫砂 10kg 低尘',35.00,'https://img10.360buyimg.com/n1/jfs/t1/191761/28/10188/90795/60e66699E2f741165/860189004d88e001.jpg',5,9,1000,89000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(22,'喵仙儿 豆腐砂原味 6L*6包 冲厕即化',99.00,'https://img14.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',5,10,500,32000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(23,'ZEZE 剑麻猫抓板 磨爪解闷 瓦楞纸 仙人掌型',49.00,'https://img14.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',6,10,200,1500,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(24,'耐威克 宠物网球发射器 狗狗互动户外玩具',88.00,'https://img11.360buyimg.com/n1/jfs/t1/195155/38/10419/127163/60e66699E2f741165/860189004d88e001.jpg',6,6,150,800,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(25,'宠物自动饮水机 2.5L 循环过滤 超静音',129.00,'https://img10.360buyimg.com/n1/jfs/t1/104273/5/17498/125301/5e81d1baE27926bdf/b1b8ddfb514ffc33.jpg',6,3,300,15000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(26,'耐威克 全价幼犬粮 5kg 增强体质',115.00,'https://img11.360buyimg.com/n1/jfs/t1/195155/38/10419/127163/60e66699E2f741165/860189004d88e001.jpg',1,6,400,5200,0,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(27,'皇家 (Royal Canin) 离乳期奶糕 幼猫专用 2kg',165.00,'https://img12.360buyimg.com/n1/jfs/t1/181467/20/14101/170942/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',2,1,200,7800,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(28,'渴望 (Orijen) 区域红肉系列 进口狗粮 11.4kg',780.00,'https://img11.360buyimg.com/n1/jfs/t1/171050/13/21798/95646/617b960bEad3a8e9e/f7cd34cb5038c3de.jpg',1,2,40,900,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(29,'爱肯拿 太平洋鱼味全猫粮 5.4kg 鱼肉配方',540.00,'https://img12.360buyimg.com/n1/jfs/t1/185800/17/14660/109337/60ec0a89Ebc3666f2/d84ec758b76fb085.jpg',2,5,100,3400,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29'),(30,'麦富迪 牛奶味 洁齿磨牙棒 狗零食 120g',15.80,'https://img10.360buyimg.com/n1/jfs/t1/104273/5/17498/125301/5e81d1baE27926bdf/b1b8ddfb514ffc33.jpg',3,3,2000,56000,1,1,NULL,'2026-04-03 11:59:29','2026-04-03 11:59:29');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sku`
--

DROP TABLE IF EXISTS `product_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL COMMENT '关联商品ID',
  `spec_value` varchar(100) NOT NULL COMMENT '规格值，如：5kg装、牛肉味',
  `price` decimal(10,2) NOT NULL COMMENT '该规格的价格',
  `stock` int NOT NULL DEFAULT '0' COMMENT '该规格的库存',
  `sku_img` varchar(255) DEFAULT NULL COMMENT '该规格对应的特写图',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sku`
--

LOCK TABLES `product_sku` WRITE;
/*!40000 ALTER TABLE `product_sku` DISABLE KEYS */;
INSERT INTO `product_sku` VALUES (1,1001,'5kg 家庭装',199.00,100,NULL,'2026-04-03 12:08:02'),(2,1001,'15kg 囤货装',459.00,50,NULL,'2026-04-03 12:08:02'),(3,1003,'1.8kg 试吃装',220.00,30,NULL,'2026-04-03 12:08:02'),(4,1003,'5.4kg 经典装',650.00,20,NULL,'2026-04-03 12:08:02');
/*!40000 ALTER TABLE `product_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pet_mall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 15:31:05
