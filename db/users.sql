CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `user_login` varchar(50) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_role` varchar(50) NOT NULL COMMENT '''admin'',''viewer'',''editor''',
  `user_nickname` varchar(50) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `registred_date` datetime NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
