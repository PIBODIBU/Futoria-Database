-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 20 2017 г., 17:29
-- Версия сервера: 5.7.17-0ubuntu0.16.04.1
-- Версия PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `futoria`
--

-- --------------------------------------------------------

--
-- Структура таблицы `sys_department`
--

CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_faculty`
--

CREATE TABLE `sys_faculty` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_permission`
--

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_rel_role_permission`
--

CREATE TABLE `sys_rel_role_permission` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_rel_user_role`
--

CREATE TABLE `sys_rel_user_role` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `role_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_rel_user_sub_role`
--

CREATE TABLE `sys_rel_user_sub_role` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sub_role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_role`
--

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_subject`
--

CREATE TABLE `sys_subject` (
  `id` bigint(20) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_sub_role`
--

CREATE TABLE `sys_sub_role` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_university`
--

CREATE TABLE `sys_university` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_university_group`
--

CREATE TABLE `sys_university_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sub_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_user`
--

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `name_first` varchar(100) NOT NULL,
  `name_last` varchar(100) NOT NULL,
  `name_middle` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sys_user_data`
--

CREATE TABLE `sys_user_data` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `book_num` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `university_id` bigint(20) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_rel_test_topic`
--

CREATE TABLE `tst_rel_test_topic` (
  `id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_rel_user_subject`
--

CREATE TABLE `tst_rel_user_subject` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_subject_topic`
--

CREATE TABLE `tst_subject_topic` (
  `id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test`
--

CREATE TABLE `tst_test` (
  `id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `need_validation` tinyint(4) NOT NULL,
  `user_owner_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_answer`
--

CREATE TABLE `tst_test_answer` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `text` varchar(300) NOT NULL,
  `is_correct` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_answer_type`
--

CREATE TABLE `tst_test_answer_type` (
  `id` bigint(20) NOT NULL,
  `type` varchar(64) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_permission`
--

CREATE TABLE `tst_test_permission` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_grander_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `test_session_id` bigint(20) DEFAULT NULL,
  `is_expired` tinyint(4) NOT NULL DEFAULT '0',
  `date_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_question`
--

CREATE TABLE `tst_test_question` (
  `id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `difficulty_level_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_question_difficulty`
--

CREATE TABLE `tst_test_question_difficulty` (
  `id` bigint(20) NOT NULL,
  `level` int(11) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_session`
--

CREATE TABLE `tst_test_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `is_started` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_session_answer`
--

CREATE TABLE `tst_test_session_answer` (
  `id` bigint(20) NOT NULL,
  `test_session_id` bigint(20) NOT NULL,
  `answer_id` bigint(20) NOT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `answer_file_name` varchar(300) DEFAULT NULL,
  `answer_type` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tst_test_type`
--

CREATE TABLE `tst_test_type` (
  `id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sys_department`
--
ALTER TABLE `sys_department`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_faculty`
--
ALTER TABLE `sys_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_permission`
--
ALTER TABLE `sys_permission`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_rel_role_permission`
--
ALTER TABLE `sys_rel_role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_rel_role_permission_fk0` (`role_id`),
  ADD KEY `sys_rel_role_permission_fk1` (`permission_id`);

--
-- Индексы таблицы `sys_rel_user_role`
--
ALTER TABLE `sys_rel_user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_rel_user_role_fk2` (`username`) USING BTREE,
  ADD KEY `sys_rel_user_role_fk3` (`role_name`),
  ADD KEY `sys_rel_user_role_ibfk_3` (`user_id`),
  ADD KEY `sys_rel_user_role_ibfk_4` (`role_id`);

--
-- Индексы таблицы `sys_rel_user_sub_role`
--
ALTER TABLE `sys_rel_user_sub_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_rel_user_sub_role_fk0` (`user_id`),
  ADD KEY `sys_rel_user_sub_role_fk1` (`sub_role_id`);

--
-- Индексы таблицы `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Индексы таблицы `sys_subject`
--
ALTER TABLE `sys_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_subject_fk0` (`faculty_id`),
  ADD KEY `sys_subject_fk1` (`department_id`);

--
-- Индексы таблицы `sys_sub_role`
--
ALTER TABLE `sys_sub_role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_university`
--
ALTER TABLE `sys_university`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_university_group`
--
ALTER TABLE `sys_university_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `sys_user_data`
--
ALTER TABLE `sys_user_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_num` (`book_num`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `sys_user_data_fk0` (`user_id`),
  ADD KEY `sys_user_data_fk1` (`university_id`),
  ADD KEY `sys_user_data_fk2` (`faculty_id`),
  ADD KEY `sys_user_data_fk3` (`department_id`),
  ADD KEY `sys_user_data_fk4` (`group_id`);

--
-- Индексы таблицы `tst_rel_test_topic`
--
ALTER TABLE `tst_rel_test_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_rel_test_topic_fk0` (`test_id`),
  ADD KEY `tst_rel_test_topic_fk1` (`topic_id`);

--
-- Индексы таблицы `tst_rel_user_subject`
--
ALTER TABLE `tst_rel_user_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_rel_user_subject_fk0` (`user_id`),
  ADD KEY `tst_rel_user_subject_fk1` (`subject_id`);

--
-- Индексы таблицы `tst_subject_topic`
--
ALTER TABLE `tst_subject_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_subject_topic_fk0` (`subject_id`);

--
-- Индексы таблицы `tst_test`
--
ALTER TABLE `tst_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_fk0` (`subject_id`),
  ADD KEY `tst_test_fk1` (`user_owner_id`);

--
-- Индексы таблицы `tst_test_answer`
--
ALTER TABLE `tst_test_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_answer_fk0` (`question_id`),
  ADD KEY `tst_test_answer_fk1` (`type`);

--
-- Индексы таблицы `tst_test_answer_type`
--
ALTER TABLE `tst_test_answer_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Индексы таблицы `tst_test_permission`
--
ALTER TABLE `tst_test_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_permission_fk0` (`user_id`),
  ADD KEY `tst_test_permission_fk1` (`user_grander_id`),
  ADD KEY `tst_test_permission_fk2` (`test_id`),
  ADD KEY `tst_test_permission_fk3` (`test_session_id`);

--
-- Индексы таблицы `tst_test_question`
--
ALTER TABLE `tst_test_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_question_fk0` (`test_id`),
  ADD KEY `tst_test_question_fk1` (`difficulty_level_id`);

--
-- Индексы таблицы `tst_test_question_difficulty`
--
ALTER TABLE `tst_test_question_difficulty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Индексы таблицы `tst_test_session`
--
ALTER TABLE `tst_test_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_session_fk0` (`user_id`),
  ADD KEY `tst_test_session_fk1` (`test_id`);

--
-- Индексы таблицы `tst_test_session_answer`
--
ALTER TABLE `tst_test_session_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tst_test_session_answer_fk0` (`test_session_id`),
  ADD KEY `tst_test_session_answer_fk1` (`answer_id`),
  ADD KEY `tst_test_session_answer_fk2` (`answer_type`);

--
-- Индексы таблицы `tst_test_type`
--
ALTER TABLE `tst_test_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`),
  ADD KEY `tst_test_type_fk0` (`test_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sys_department`
--
ALTER TABLE `sys_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `sys_faculty`
--
ALTER TABLE `sys_faculty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `sys_permission`
--
ALTER TABLE `sys_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT для таблицы `sys_rel_role_permission`
--
ALTER TABLE `sys_rel_role_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT для таблицы `sys_rel_user_role`
--
ALTER TABLE `sys_rel_user_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `sys_rel_user_sub_role`
--
ALTER TABLE `sys_rel_user_sub_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `sys_subject`
--
ALTER TABLE `sys_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sys_sub_role`
--
ALTER TABLE `sys_sub_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sys_university`
--
ALTER TABLE `sys_university`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `sys_university_group`
--
ALTER TABLE `sys_university_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `sys_user_data`
--
ALTER TABLE `sys_user_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `tst_rel_test_topic`
--
ALTER TABLE `tst_rel_test_topic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_rel_user_subject`
--
ALTER TABLE `tst_rel_user_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_subject_topic`
--
ALTER TABLE `tst_subject_topic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test`
--
ALTER TABLE `tst_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_answer`
--
ALTER TABLE `tst_test_answer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_answer_type`
--
ALTER TABLE `tst_test_answer_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_permission`
--
ALTER TABLE `tst_test_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_question`
--
ALTER TABLE `tst_test_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_question_difficulty`
--
ALTER TABLE `tst_test_question_difficulty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_session`
--
ALTER TABLE `tst_test_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_session_answer`
--
ALTER TABLE `tst_test_session_answer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tst_test_type`
--
ALTER TABLE `tst_test_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `sys_rel_role_permission`
--
ALTER TABLE `sys_rel_role_permission`
  ADD CONSTRAINT `sys_rel_role_permission_fk0` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  ADD CONSTRAINT `sys_rel_role_permission_fk1` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`);

--
-- Ограничения внешнего ключа таблицы `sys_rel_user_role`
--
ALTER TABLE `sys_rel_user_role`
  ADD CONSTRAINT `sys_rel_user_role_fk2` FOREIGN KEY (`username`) REFERENCES `sys_user` (`username`),
  ADD CONSTRAINT `sys_rel_user_role_ibfk_1` FOREIGN KEY (`role_name`) REFERENCES `sys_role` (`role_name`),
  ADD CONSTRAINT `sys_rel_user_role_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `sys_rel_user_role_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`);

--
-- Ограничения внешнего ключа таблицы `sys_rel_user_sub_role`
--
ALTER TABLE `sys_rel_user_sub_role`
  ADD CONSTRAINT `sys_rel_user_sub_role_fk0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `sys_rel_user_sub_role_fk1` FOREIGN KEY (`sub_role_id`) REFERENCES `sys_sub_role` (`id`);

--
-- Ограничения внешнего ключа таблицы `sys_subject`
--
ALTER TABLE `sys_subject`
  ADD CONSTRAINT `sys_subject_fk0` FOREIGN KEY (`faculty_id`) REFERENCES `sys_faculty` (`id`),
  ADD CONSTRAINT `sys_subject_fk1` FOREIGN KEY (`department_id`) REFERENCES `sys_department` (`id`);

--
-- Ограничения внешнего ключа таблицы `sys_user_data`
--
ALTER TABLE `sys_user_data`
  ADD CONSTRAINT `sys_user_data_fk0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `sys_user_data_fk1` FOREIGN KEY (`university_id`) REFERENCES `sys_university` (`id`),
  ADD CONSTRAINT `sys_user_data_fk2` FOREIGN KEY (`faculty_id`) REFERENCES `sys_faculty` (`id`),
  ADD CONSTRAINT `sys_user_data_fk3` FOREIGN KEY (`department_id`) REFERENCES `sys_department` (`id`),
  ADD CONSTRAINT `sys_user_data_fk4` FOREIGN KEY (`group_id`) REFERENCES `sys_university_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_rel_test_topic`
--
ALTER TABLE `tst_rel_test_topic`
  ADD CONSTRAINT `tst_rel_test_topic_fk0` FOREIGN KEY (`test_id`) REFERENCES `tst_test` (`id`),
  ADD CONSTRAINT `tst_rel_test_topic_fk1` FOREIGN KEY (`topic_id`) REFERENCES `tst_subject_topic` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_rel_user_subject`
--
ALTER TABLE `tst_rel_user_subject`
  ADD CONSTRAINT `tst_rel_user_subject_fk0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `tst_rel_user_subject_fk1` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_subject_topic`
--
ALTER TABLE `tst_subject_topic`
  ADD CONSTRAINT `tst_subject_topic_fk0` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test`
--
ALTER TABLE `tst_test`
  ADD CONSTRAINT `tst_test_fk0` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`),
  ADD CONSTRAINT `tst_test_fk1` FOREIGN KEY (`user_owner_id`) REFERENCES `sys_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_answer`
--
ALTER TABLE `tst_test_answer`
  ADD CONSTRAINT `tst_test_answer_fk0` FOREIGN KEY (`question_id`) REFERENCES `tst_test_question` (`id`),
  ADD CONSTRAINT `tst_test_answer_fk1` FOREIGN KEY (`type`) REFERENCES `tst_test_answer_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_permission`
--
ALTER TABLE `tst_test_permission`
  ADD CONSTRAINT `tst_test_permission_fk0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `tst_test_permission_fk1` FOREIGN KEY (`user_grander_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `tst_test_permission_fk2` FOREIGN KEY (`test_id`) REFERENCES `tst_test` (`id`),
  ADD CONSTRAINT `tst_test_permission_fk3` FOREIGN KEY (`test_session_id`) REFERENCES `tst_test_session` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_question`
--
ALTER TABLE `tst_test_question`
  ADD CONSTRAINT `tst_test_question_fk0` FOREIGN KEY (`test_id`) REFERENCES `tst_test` (`id`),
  ADD CONSTRAINT `tst_test_question_fk1` FOREIGN KEY (`difficulty_level_id`) REFERENCES `tst_test_question_difficulty` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_session`
--
ALTER TABLE `tst_test_session`
  ADD CONSTRAINT `tst_test_session_fk0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  ADD CONSTRAINT `tst_test_session_fk1` FOREIGN KEY (`test_id`) REFERENCES `tst_test` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_session_answer`
--
ALTER TABLE `tst_test_session_answer`
  ADD CONSTRAINT `tst_test_session_answer_fk0` FOREIGN KEY (`test_session_id`) REFERENCES `tst_test_session` (`id`),
  ADD CONSTRAINT `tst_test_session_answer_fk1` FOREIGN KEY (`answer_id`) REFERENCES `tst_test_answer` (`id`),
  ADD CONSTRAINT `tst_test_session_answer_fk2` FOREIGN KEY (`answer_type`) REFERENCES `tst_test_answer_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `tst_test_type`
--
ALTER TABLE `tst_test_type`
  ADD CONSTRAINT `tst_test_type_fk0` FOREIGN KEY (`test_id`) REFERENCES `tst_test` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
