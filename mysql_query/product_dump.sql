-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `pcomment`;
CREATE TABLE `pcomment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(30) NOT NULL,
  `u_id` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `starpoint` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `p_id` (`p_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `pcomment_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  CONSTRAINT `pcomment_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `pcomment` (`c_id`, `p_id`, `u_id`, `contents`, `starpoint`, `created`) VALUES
(1,	'p1',	'u2',	'텔레비전 제품 써보니 너무 좋아요',	4,	'2021-03-31 14:42:03'),
(2,	'p2',	'u2',	'냉장고 써보니 너무 좋아요',	4,	'2021-03-31 14:42:03'),
(3,	'p1',	'u1',	'이 제품 별로에요',	2,	'2021-03-31 14:42:03'),
(4,	'p1',	'u3',	'그냥 그럭저럭이네요',	3,	'2021-03-31 14:42:03'),
(5,	'p4',	'u3',	'핸드폰 너무 좋아요',	4,	'2021-03-31 14:42:03'),
(6,	'p5',	'u1',	'엘지 휴대폰 좋아요',	4,	'2021-03-31 14:42:03'),
(7,	'p3',	'u3',	'엘지TV 너무 좋아요',	4,	'2021-03-31 14:42:03');

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `p_id` varchar(30) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `pdesd` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product` (`p_id`, `pname`, `pdesd`, `price`, `company`) VALUES
('p1',	'삼성TV',	'삼성 텔레비젼 세트 모델명은 001920',	100000,	'삼성'),
('p2',	'LG 냉장고',	'LG 냉장고 모델명은 229920',	100000,	'엘지'),
('p3',	'LG TV',	'LG TV 세트 모델명은 121330',	100000,	'엘지'),
('p4',	'삼성 핸드폰',	'삼성 핸드폰 모델명은 991920',	100000,	'삼성'),
('p5',	'LG 휴대폰',	'LG 휴대폰 모델명은 776620',	100000,	'엘지');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`u_id`, `name`, `password`) VALUES
('u1',	'홍길동',	'1234'),
('u2',	'유관순',	'1234'),
('u3',	'이순신',	'1234');

-- 2021-03-31 08:24:03
