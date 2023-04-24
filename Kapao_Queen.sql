-- STRUCTURE

DROP DATABASE IF EXISTS kapao_queen;
CREATE DATABASE IF NOT EXISTS `kapao_queen` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `kapao_queen`;

DROP TABLE IF EXISTS foodlist;
CREATE TABLE `foodlist` (
  `id` int PRIMARY KEY NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL, 
  `thai_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,

  `browse_description` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, 
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` smallint(8)  DEFAULT NULL,

  `taglist` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `background` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,

  -- `ingredient_1` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, -- url to img
  -- `ingredient_2` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  -- `ingredient_3` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  
  `type` varchar(12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `kapao_queen`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `is_admin` TINYINT NOT NULL DEFAULT 0,
  `fname` VARCHAR(50),
  `lname` VARCHAR(50),
  `email` VARCHAR(50),
  `address` VARCHAR(100),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);

DROP TABLE IF EXISTS ingredients;
CREATE TABLE `kapao_queen`.`ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `img` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

DROP TABLE IF EXISTS food_ingredients;
CREATE TABLE `kapao_queen`.`food_ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `food_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `food_id_UNIQUE` (`food_id` ASC, `ingredient_id` ASC) VISIBLE,
  INDEX `fk_food_ingredients_ingredients1_idx` (`ingredient_id` ASC) VISIBLE,
  CONSTRAINT `fk_food_ingredients_ingredients1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `kapao_queen`.`ingredients` (`id`),
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
  CONSTRAINT `fk_food_ingredients_food1`
    FOREIGN KEY (`food_id`)
    REFERENCES `kapao_queen`.`foodlist` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION);
);

INSERT INTO `ingredients` (`id`,`name`, `img`) VALUES 
(1,'Chicken', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Ayam_kampung_free_range_chicken_meat_Indonesia.JPG/800px-Ayam_kampung_free_range_chicken_meat_Indonesia.JPG'),
(2,'Kaphrao', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Ocimum_tenuiflorum_24_08_2012.JPG/800px-Ocimum_tenuiflorum_24_08_2012.JPG'),
(3,'Pork','https://pngimg.com/d/pork_PNG32.png')
;

INSERT INTO `foodlist` (`id`,`name`,`thai_name`,`search_name`,`browse_description`,`description`,`type`,`price`,`taglist`,`img`,`background`) VALUES 
(
1,'Phat Kaphrao From God','ผัดกะเพราจากพระเจ้า','pad kra pao','Thai favourite stir fry',
'Phat Kaphrao Mu Sap is a traditional Thai dish that boasts a perfect balance of spicy, savory, and aromatic flavors.
his delicious stir-fried minced pork dish is cooked with plenty of fresh chili peppers, garlic, and Thai basil leaves, which gives it a distinct and irresistible taste. The tender and juicy pork is minced and cooked until it is lightly browned, and then combined with the spicy and fragrant mixture of herbs and spices.
The dish is served hot over a bed of steamed rice and topped with a fried egg, making it a complete and satisfying meal.',
'Main Courses',
80,
'Thai,Spicy',
'https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg',
'https://img2.kochrezepte.at/use/19/pad-krapao-schweinefleisch-mit-thai-basilikum_19694.jpg'
);

INSERT INTO `food_ingredients` (`food_id`, `ingredient_id`) VALUES 
(1, 3),
(1, 2);


--  INSERT INTO `foodlist` (`id`,`name`, `browse_description`, `thai_name`, `tag1`, `tag2`, `description`,`price`,`img`,`background`,`ingredient_1`, `ingredient_2`, `ingredient_3`,`type`) VALUES
-- (
-- '1',
-- 'ITEM1',
--  'waefawefawef aewfawef awef awef awefaefwaef awefawef',
--  'pat thai',
--  'brit food',
--  'Main Course', 
--  'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
-- Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
-- Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
-- 40,
-- 'https://cdn.pixabay.com/photo/2017/09/25/13/12/puppy-2785074__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
-- 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
-- 'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
-- 'food'
--  ),
--  (
--  '2',
-- 'Dog shit',
--  'awefawefea aewfwaef weafawef eawfwaefawef',
--  'pat thai',
--  'brit food',
--  'Main Course', 
--  'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
-- Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
-- Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
-- 40,
-- 'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg',
-- 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
-- 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
-- 'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
-- 'food'
-- ),
-- (
-- '3',
-- 'ITEM12',
--  'waefawef eaafwaewf feawfewaf awefawef',
--  'pat thai',
--  'brit food',
--  'Main Course', 
--  'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
-- Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
-- Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
-- 40,
-- 'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
-- 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
-- 'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
-- 'food'
-- ),
-- (
-- '4',
-- 'ITEM1123',
--  'eawfdwe and wafewadf waedfaewf ',
--  'pat thai',
--  'brit food',
--  'Main Course', 
--  'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
-- Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
-- Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
-- 40,
-- 'https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
-- 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
-- 'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
-- 'food'
-- ),
-- (
-- '5',
-- 'ITEM142',
--  'french shit and awdswdw',
--  'pat thai',
--  'brit food',
--  'Main Course', 
--  'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors

-- Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.

-- Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.
-- ',
-- 40,
-- 'https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
-- 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
-- 'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
-- 'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
-- 'dessert'
-- );