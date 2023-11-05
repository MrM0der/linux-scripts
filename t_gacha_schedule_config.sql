-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Ноя 05 2023 г., 19:17
-- Версия сервера: 10.9.8-MariaDB-1:10.9.8+maria~ubu2204
-- Версия PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hk4e_db_config`
--

-- --------------------------------------------------------

--
-- Структура таблицы `t_gacha_schedule_config`
--

CREATE TABLE `t_gacha_schedule_config` (
  `schedule_id` int(11) NOT NULL COMMENT '活动ID',
  `gacha_type` int(11) NOT NULL DEFAULT 0 COMMENT '扭蛋类型',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `cost_item_id` int(11) UNSIGNED NOT NULL COMMENT '消耗材料ID',
  `cost_item_num` int(11) UNSIGNED NOT NULL COMMENT '消耗材料数量',
  `gacha_pool_id` int(11) UNSIGNED NOT NULL COMMENT 'Gacha根ID',
  `gacha_prob_rule_id` int(11) UNSIGNED NOT NULL COMMENT 'Gacha概率配置ID',
  `gacha_up_config` varchar(512) NOT NULL DEFAULT '' COMMENT 'UP配置',
  `gacha_rule_config` varchar(512) NOT NULL DEFAULT '' COMMENT '保底规则配置',
  `gacha_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋Prefab路径',
  `gacha_preview_prefab_path` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋预览Prefab路径',
  `gacha_prob_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋概率展示url',
  `gacha_record_url` varchar(512) NOT NULL DEFAULT '' COMMENT '扭蛋记录url',
  `gacha_prob_url_oversea` varchar(512) NOT NULL DEFAULT '' COMMENT '海外扭蛋概率展示url',
  `gacha_record_url_oversea` varchar(512) NOT NULL DEFAULT '' COMMENT '海外扭蛋记录url',
  `gacha_sort_id` int(11) UNSIGNED NOT NULL COMMENT '扭蛋排序权重',
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0不生效，1生效',
  `title_textmap` varchar(256) NOT NULL DEFAULT '' COMMENT 'Gacha显示多语言文本',
  `display_up4_item_list` varchar(512) NOT NULL DEFAULT '' COMMENT '显示up4星物品',
  `desc` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='扭蛋活动配置';

--
-- Дамп данных таблицы `t_gacha_schedule_config`
--

INSERT INTO `t_gacha_schedule_config` (`schedule_id`, `gacha_type`, `begin_time`, `end_time`, `cost_item_id`, `cost_item_num`, `gacha_pool_id`, `gacha_prob_rule_id`, `gacha_up_config`, `gacha_rule_config`, `gacha_prefab_path`, `gacha_preview_prefab_path`, `gacha_prob_url`, `gacha_record_url`, `gacha_prob_url_oversea`, `gacha_record_url_oversea`, `gacha_sort_id`, `enabled`, `title_textmap`, `display_up4_item_list`, `desc`) VALUES
(22, 200, '2020-09-28 00:00:00', '2106-02-07 06:28:15', 224, 1, 101, 3, '{}', '{}', 'GachaShowPanel_A022', 'UI_Tab_GachaShowPanel_A022', 'http://10.242.1.1:21000/gacha/info/22?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/200?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 1000, 1, 'UI_GACHA_SHOW_PANEL_A022_TITLE', '', 'Wanderlust Invocation; new prefab (1.1+)'),
(103, 301, '2023-08-24 16:13:38', '2023-09-09 16:13:38', 223, 1, 201, 1, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[1073]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[1020,1034,1032]}]}', '{}', 'GachaShowPanel_A103', 'UI_Tab_GachaShowPanel_A103', 'http://10.242.1.1:21000/gacha/info/103?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/301?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9998, 1, 'UI_GACHA_SHOW_PANEL_A0103_TITLE', '1020,1034,1032', 'The Moongrass\' Enlightenment 2022-11-02'),
(104, 400, '2023-08-24 16:13:38', '2023-09-09 16:13:38', 223, 1, 201, 1, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[1049]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[1020,1034,1032]}]}', '{}', 'GachaShowPanel_A104', 'UI_Tab_GachaShowPanel_A104', 'http://10.242.1.1:21000/gacha/info/104?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/400?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9998, 1, 'UI_GACHA_SHOW_PANEL_A049_TITLE', '1020,1034,1032', 'Tapestry of Golden Flames 2022-11-02'),
(105, 302, '2023-08-24 16:13:38', '2023-09-09 16:13:38', 223, 1, 201, 2, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[14511,15509]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[12415,11405,13407,14403,15401]}]}', '{}', 'GachaShowPanel_A102', 'UI_Tab_GachaShowPanel_A105', 'http://10.242.1.1:21000/gacha/info/105?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/302?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9997, 1, 'UI_GACHA_SHOW_PANEL_A021_TITLE', '12415,11405,13407,14403,15401', 'Epitome Invocation 2022-11-02'),
(106, 301, '2023-09-09 16:13:39', '2024-09-25 16:13:39', 223, 1, 201, 1, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[11501,11502,11503,11504,11505,11509,11510,11511]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[]}]}', '{}', 'GachaShowPanel_A020', 'UI_Tab_GachaShowPanel_A020', 'http://10.242.1.1:21000/gacha/info/106?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/301?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9998, 1, 'UI_GACHA_SHOW_PANEL_A020_TITLE', '', 'Everbloom Violet 2022-11-18'),
(107, 400, '2023-09-09 16:13:39', '2024-09-25 16:13:39', 223, 1, 201, 1, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[1026,1029,1030,1033,1037,1038,1042,1046,1047,1049,1051,1052,1054,1057,1058,1060,1063,1066,1069,1070,1071,1073,1002,1022]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[]}]}', '{}', 'GachaShowPanel_A032', 'UI_Tab_GachaShowPanel_A032', 'http://10.242.1.1:21000/gacha/info/107?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/400?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9998, 1, 'UI_GACHA_SHOW_PANEL_A032_TITLE', '', 'Farewell of Snezhnaya 2022-11-18'),
(108, 302, '2023-09-09 16:13:39', '2024-09-25 16:13:39', 223, 1, 201, 2, '{\"gacha_up_list\":[{\"item_parent_type\":1,\"prob\":500,\"item_list\":[15501,15502,15503,15507,15508,15509,15511,14501,14502,14504,14506,14509,14511,13501,13502,13504,13505,13507,13509,13511,12501,12502,12503,12504,12510]},{\"item_parent_type\":2,\"prob\":500,\"item_list\":[]}]}', '{}', 'GachaShowPanel_A108', 'UI_Tab_GachaShowPanel_A108', 'http://10.242.1.1:21000/gacha/info/108?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', 'http://10.242.1.1:21000/gacha/record/302?authkey_ver=1&sign_type=2&auth_appid=webview_gacha', '', '', 9997, 1, 'UI_GACHA_SHOW_PANEL_A021_TITLE', '', 'Epitome Invocation 2022-11-18');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `t_gacha_schedule_config`
--
ALTER TABLE `t_gacha_schedule_config`
  ADD PRIMARY KEY (`schedule_id`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `t_gacha_schedule_config`
--
ALTER TABLE `t_gacha_schedule_config`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID', AUTO_INCREMENT=109;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
