-- STRUCTURE

DROP DATABASE IF EXISTS foodlist;
CREATE DATABASE IF NOT EXISTS `kapao_queen` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `kapao_queen`;

DROP TABLE foodlist;
CREATE TABLE `foodlist` (
  `id` smallint(8)  NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL, 
  `browse_description` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, 
  
  `thai_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag1` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag2` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` smallint(8)  DEFAULT NULL,
  
  `img` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `background` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingredient_1` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, -- url to img
  `ingredient_2` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingredient_3` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  
  `type` varchar(12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


 INSERT INTO `foodlist` (`id`,`name`, `browse_description`, `thai_name`, `tag1`, `tag2`, `description`,`price`,`img`,`background`,`ingredient_1`, `ingredient_2`, `ingredient_3`,`type`) VALUES
(
'1',
'ITEM1',
 'waefawefawef aewfawef awef awef awefaefwaef awefawef',
 'pat thai',
 'brit food',
 'Main Course', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
40,
'https://cdn.pixabay.com/photo/2017/09/25/13/12/puppy-2785074__340.jpg',
'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
'food'
 ),
 (
 '2',
'Dog shit',
 'awefawefea aewfwaef weafawef eawfwaefawef',
 'pat thai',
 'brit food',
 'Main Course', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
40,
'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg',
'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
'food'
),
(
'3',
'ITEM12',
 'waefawef eaafwaewf feawfewaf awefawef',
 'pat thai',
 'brit food',
 'Main Course', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
40,
'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg',
'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
'food'
),
(
'4',
'ITEM1123',
 'eawfdwe and wafewadf waedfaewf ',
 'pat thai',
 'brit food',
 'Main Course', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
40,
'https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404__340.jpg',
'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
'food'
),
(
'5',
'ITEM142',
 'french shit and awdswdw',
 'pat thai',
 'brit food',
 'Main Course', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors

Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.

Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.
',
40,
'https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026__340.jpg',
'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg',
'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__340.jpg',
'https://cdn.pixabay.com/photo/2015/11/17/13/13/bulldog-1047518__340.jpg',
'https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg',
'dessert'
);