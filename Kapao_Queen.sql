DROP DATABASE IF EXISTS kapao_queen;
CREATE DATABASE IF NOT EXISTS `kapao_queen` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `kapao_queen`;

DROP TABLE IF EXISTS `foodlist`;
CREATE TABLE `foodlist` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `thai_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `search_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `browse_description` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` smallint DEFAULT NULL,
  `taglist` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ingredientslist` varchar(600) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `background` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(12) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

LOCK TABLES `foodlist` WRITE;
INSERT INTO `foodlist` VALUES (
1,'Goddess Pad Kaprao','ผัดกะเพราจากนางฟ้า','pad kra pao','Thai favourite stir fry',
'Phat Kaphrao Mu Sap is a traditional Thai dish that boasts a perfect balance of spicy, savory, and aromatic flavors.\nhis delicious stir-fried minced pork dish is cooked with plenty of fresh chili peppers, garlic, and Thai basil leaves, which gives it a distinct and irresistible taste. The tender and juicy pork is minced and cooked until it is lightly browned, and then combined with the spicy and fragrant mixture of herbs and spices.\nThe dish is served hot over a bed of steamed rice and topped with a fried egg, making it a complete and satisfying meal.',
80,'Thai,Rice,Spicy',
'Kaphrao|https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Ocimum_tenuiflorum_24_08_2012.JPG/800px-Ocimum_tenuiflorum_24_08_2012.JPG,Pork|https://pngimg.com/d/pork_PNG32.png',
'https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg',
'https://img2.kochrezepte.at/use/19/pad-krapao-schweinefleisch-mit-thai-basilikum_19694.jpg',
'food'),
(2, 'Drunken Spaghetti', 'ผัดขี้เมา', 'pad kee mao', 'The fiery Thai stir-fry that packs a punch',
'Pad Kee Mao Gai is a spicy and flavorful Thai stir-fry that is sure to satisfy your taste buds. This dish is made with tender chicken, wide rice noodles, and a mix of vegetables and aromatic herbs, such as bell peppers, onions, garlic, and Thai basil leaves. The stir-fry is cooked with a spicy chili paste sauce, which gives the dish its signature kick. the combination of textures and flavors make this dish a popular choice among Thai food enthusiasts.',
 70,'Thai,Noodle,Spicy',
 'Spaghetti|https://yimages360.s3.amazonaws.com/products/2020/08/5f467874c732f/1x.jpg',
 'https://img.wongnai.com/p/1920x0/2018/08/04/af5f930f8a0a4c798d903e22bc25d2f8.jpg',
 'https://steakdeknaew.ketshopweb.com/upload-img/steakdeknaew/Spaghetti/file_1.jpg',
 'food'
),
(3,'Bua Loi','บัวลอย','bua loi','Thai dessert of rice flour balls in coconut milk.',
'a traditional Thai dessert made of glutinous rice flour balls cooked in sweetened coconut milk. The rice flour balls can be plain or filled with various ingredients such as black sesame seeds, taro, pumpkin, or mung beans. The coconut milk is often flavored with pandan leaves or jasmine flowers for a fragrant aroma. Bua loi is a creamy, chewy, and satisfying dessert that can be enjoyed hot or cold.',
30,'Thai,Sweet',
'Rice floor|https://img.lovepik.com/free-png/20210919/lovepik-glutinous-rice-flour-png-image_400665763_wh1200.png',
'https://www.tastingtable.com/img/gallery/bua-loy-the-floating-thai-dessert-you-should-know/intro-1661228311.jpg',
'https://cdn.ready-market.com/101/21cd62de//Templates/pic/ANKO-Bua-Loi-1200x1200.jpg?v=d5d6ff4c',
'dessert'),
(4,'Creamy noodle of the north','ข้าวซอย','khao soi','satisfying noodle dish',
'a spicy and tangy Thai noodle soup with coconut milk and juicy chicken. It is topped with crispy fried noodles, pickled shallots, and fresh herbs for a burst of flavor and texture. Khao soi is a delicious and satisfying dish that originates from Northern Thailand',
120,'Thai,Noodle,Northern',
'',
'https://iamafoodblog.b-cdn.net/wp-content/uploads/2019/02/15-minute-khao-soi-6916w-2.jpg',
'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/11/10/0/DV2709H_Kaosoi_s4x3.jpg.rend.hgtvcom.616.462.suffix/1510328620514.jpeg',
'food'
)
;
UNLOCK TABLES;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0',
  `fname` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lname` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Admin','$2b$10$/f13aj3DuQL.jkBY2vLRveDFfw3M5/PvrpupGVr8jSSeFbx89TaCW',1,'test','admin',NULL,NULL);
UNLOCK TABLES;

-- Dump completed on 2023-04-25 15:59:25
