-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2022 at 02:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL,
  `attachment_uniqiueid` varchar(100) NOT NULL,
  `attachment_created` datetime DEFAULT NULL,
  `attachment_updated` datetime DEFAULT NULL,
  `attachment_creatorid` int(11) NOT NULL,
  `attachment_clientid` int(11) DEFAULT NULL COMMENT 'optional',
  `attachment_directory` varchar(100) NOT NULL,
  `attachment_filename` varchar(250) NOT NULL,
  `attachment_extension` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(20) DEFAULT NULL COMMENT 'image | file',
  `attachment_size` varchar(30) DEFAULT NULL COMMENT 'Human readable file size',
  `attachment_thumbname` varchar(250) DEFAULT NULL COMMENT 'optional for images',
  `attachmentresource_type` varchar(50) NOT NULL COMMENT '[polymorph] task | expense | ticket | ticketreply',
  `attachmentresource_id` int(11) NOT NULL COMMENT '[polymorph] e.g ticket_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL COMMENT '[do not truncate] - only delete where category_system_default = no',
  `category_created` datetime DEFAULT NULL,
  `category_updated` datetime DEFAULT NULL,
  `category_creatorid` int(11) DEFAULT NULL,
  `category_name` varchar(150) DEFAULT NULL,
  `category_description` varchar(150) DEFAULT NULL COMMENT 'optional (mainly used by knowledge base)',
  `category_system_default` varchar(20) DEFAULT 'no' COMMENT 'yes | no (system default cannot be deleted)',
  `category_visibility` varchar(20) DEFAULT 'everyone' COMMENT 'everyone | team | client (mainly used by knowledge base)',
  `category_icon` varchar(100) DEFAULT 'sl-icon-docs' COMMENT 'optional (mainly used by knowledge base)',
  `category_type` varchar(50) NOT NULL COMMENT 'project | client | contract | expense | invoice | lead | ticket | item| estimate | knowledgebase',
  `category_slug` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[do not truncate][system defaults] - 1=project,2=client,3lead,4=invoice,5=estimate,6=contract,7=expense,8=item,9=ticket, 10=knowledgebase, 11=proposal';

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_created`, `category_updated`, `category_creatorid`, `category_name`, `category_description`, `category_system_default`, `category_visibility`, `category_icon`, `category_type`, `category_slug`) VALUES
(1, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'project', '1-default'),
(2, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'client', '2-default'),
(3, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'lead', '3-default'),
(4, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'invoice', '4-default'),
(5, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'estimate', '5-default'),
(6, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'contract', '6-default'),
(7, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'expense', '7-default'),
(8, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'item', '8-default'),
(9, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Support', NULL, 'yes', 'everyone', 'sl-icon-folder', 'ticket', '9-support'),
(10, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Frequently Asked Questions', 'Answers to some of the most frequently asked questions', 'yes', 'everyone', 'sl-icon-call-out', 'knowledgebase', '10-frequently-asked-questions'),
(11, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'proposal', '11-proposal'),
(12, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Default', NULL, 'yes', 'everyone', 'sl-icon-folder', 'proposal', '12-contract'),
(21, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Uncategorised', NULL, 'yes', 'everyone', 'sl-icon-folder', 'milestones', '1-uncategorised');

-- --------------------------------------------------------

--
-- Table structure for table `checklists`
--

CREATE TABLE `checklists` (
  `checklist_id` int(11) NOT NULL,
  `checklist_position` int(11) NOT NULL,
  `checklist_created` datetime NOT NULL,
  `checklist_updated` datetime NOT NULL,
  `checklist_creatorid` int(11) NOT NULL,
  `checklist_clientid` int(11) DEFAULT NULL,
  `checklist_text` varchar(250) NOT NULL,
  `checklist_status` varchar(250) NOT NULL DEFAULT 'pending' COMMENT 'pending | completed',
  `checklistresource_type` varchar(50) NOT NULL,
  `checklistresource_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `ci_cookies`
--

CREATE TABLE `ci_cookies` (
  `id` int(11) NOT NULL,
  `cookie_id` varchar(255) DEFAULT NULL,
  `netid` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `orig_page_requested` varchar(120) DEFAULT NULL,
  `php_session_id` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_cookies`
--

INSERT INTO `ci_cookies` (`id`, `cookie_id`, `netid`, `ip_address`, `user_agent`, `orig_page_requested`, `php_session_id`, `created_at`, `updated_at`) VALUES
(21, '602fb1d0ebb5e5.02613291', '24', '116.89.99.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', '9ac311366b5a696f191961ff1d082633940ad604', '2021-02-19 20:40:48', NULL),
(23, '6034a80e507608.38335776', '11', '128.106.78.133', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', 'fd7486e4865378d5dc5bcfaa623418989fff9281', '2021-02-23 15:00:30', NULL),
(25, '6034a8d210c714.79082932', '13', '119.56.97.87', 'Mozilla/5.0 (Linux; Android 10; ELS-NX9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Mobile Safari/537.36', '', '75169fc3fbd6447da7c03e393fdcf5173c4a7c48', '2021-02-23 15:03:46', NULL),
(26, '6034be75e99001.32953922', '10', '111.65.70.167', 'Mozilla/5.0 (Linux; Android 10; SAMSUNG SM-G965F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/13.2 Chrome/83.0.4103.106 Mobile Safari/537.36', '', '94a8190019215d2af2dfd1ef7a275763f5754974', '2021-02-23 16:36:05', NULL),
(31, '6034f4517d44f9.51230664', '27', '124.123.185.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36 Edg/88.0.705.74', '', 'cb26f3e66458c7722dac46f93511e5931137602f', '2021-02-23 20:25:53', NULL),
(34, '6035e7e5e66d03.20781332', '14', '111.65.45.245', 'Mozilla/5.0 (Linux; Android 10; CPH2037) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', '', 'eaa742c0f52e50a0c28cd21b4842667a36f8c60d', '2021-02-24 13:45:09', NULL),
(41, '603892b955b145.53031025', '18', '119.56.106.0', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', '6d89c4972c3c648b955da500653015f32f0ad8a6', '2021-02-26 14:18:33', NULL),
(42, '603892f93f5485.56670829', '23', '111.65.61.85', 'Mozilla/5.0 (Linux; Android 10; ELE-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', '', 'cbbabedc8d7f87ffcd483b3fdc5e5e5a28771584', '2021-02-26 14:19:37', NULL),
(47, '60408d887fdcc4.56489855', '12', '118.200.94.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', 'b43065544b5926b3262341e21cccb102404ab60d', '2021-03-04 15:34:32', NULL),
(54, '6049a6b12a6e55.99621355', '2', '118.200.94.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '', '5dacd2a44ffe45147d15bff2aadea9e068b90219', '2021-03-11 13:12:17', NULL),
(55, '6049d74d5ed891.52578183', '21', '118.200.94.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.2 Mobile/15E148 Safari/604.1', '', '09f93f6a6c77f7a603111b45c70d6a4bfc9e844b', '2021-03-11 16:39:41', NULL),
(56, '606135e366aa89.94826145', '15', '183.90.37.37', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', '145cb9c73c2438a36195afc6171e10bfa2f24878', '2021-03-29 10:05:23', NULL),
(57, '606540f2e4ba16.30024515', '16', '119.56.97.212', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', '17e20dd803ca67474f47d6fe326d4d04a02b7d66', '2021-04-01 11:41:38', NULL),
(60, '60701f18c5ff82.63391449', '22', '119.56.109.70', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '', '03e1b139efb0eeee8ebade09c2d602c493f79a7a', '2021-04-09 17:32:08', NULL),
(61, '607646f8c6f933.15798306', '6', '118.200.94.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '', '7a75d12a0403d8daf4bc102849619d1048783182', '2021-04-14 09:35:52', NULL),
(62, '6078e7d02fc536.82355480', '19', '118.200.94.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1', '', 'a89b3a4865fb3611dd8bc8224260cbd1b17c9f5a', '2021-04-16 09:26:40', NULL),
(64, '60af80f8863d44.63099623', '1', '49.206.45.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '', '6af03168d615f0090ece96dfb66797968ccb206c', '2021-05-27 19:22:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `client_created` datetime DEFAULT NULL,
  `client_updated` datetime DEFAULT NULL,
  `client_creatorid` int(11) NOT NULL,
  `client_created_from_leadid` int(11) NOT NULL COMMENT 'the lead that the customer was created from',
  `client_categoryid` int(11) NOT NULL DEFAULT 2 COMMENT 'default category',
  `client_company_name` varchar(150) NOT NULL,
  `client_phone` varchar(50) DEFAULT NULL,
  `client_logo_folder` varchar(50) DEFAULT NULL,
  `client_logo_filename` varchar(50) DEFAULT NULL,
  `client_website` varchar(250) DEFAULT NULL,
  `client_vat` varchar(50) DEFAULT NULL,
  `client_billing_street` varchar(200) DEFAULT NULL,
  `client_billing_city` varchar(100) DEFAULT NULL,
  `client_billing_state` varchar(100) DEFAULT NULL,
  `client_billing_zip` varchar(50) DEFAULT NULL,
  `client_billing_country` varchar(100) DEFAULT NULL,
  `client_shipping_street` varchar(250) DEFAULT NULL,
  `client_shipping_city` varchar(100) DEFAULT NULL,
  `client_shipping_state` varchar(100) DEFAULT NULL,
  `client_shipping_zip` varchar(50) DEFAULT NULL,
  `client_shipping_country` varchar(100) DEFAULT NULL,
  `client_status` varchar(50) NOT NULL DEFAULT 'active' COMMENT 'active | suspended'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_created` datetime DEFAULT NULL,
  `comment_updated` datetime DEFAULT NULL,
  `comment_creatorid` int(11) NOT NULL,
  `comment_clientid` int(11) DEFAULT NULL COMMENT 'required for client type resources',
  `comment_text` text NOT NULL,
  `commentresource_type` varchar(50) NOT NULL COMMENT '[polymorph] project | ticket | task | lead',
  `commentresource_id` int(11) NOT NULL COMMENT '[polymorph] e.g project_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` int(11) NOT NULL,
  `contract_created` datetime DEFAULT NULL,
  `contract_updated` datetime DEFAULT NULL,
  `contract_clientid` int(11) NOT NULL,
  `contract_projectid` int(11) NOT NULL,
  `contract_creatorid` int(11) NOT NULL,
  `contract_categoryid` int(11) NOT NULL DEFAULT 6,
  `contract_title` varchar(250) NOT NULL,
  `contract_start_date` datetime NOT NULL,
  `contract_expiry_date` datetime NOT NULL,
  `contract_value` decimal(10,2) NOT NULL,
  `contract_text` text NOT NULL,
  `contract_status` varchar(30) NOT NULL DEFAULT 'draft' COMMENT 'draft | pending | active| expired'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `contract_templates`
--

CREATE TABLE `contract_templates` (
  `contracttemplates_id` int(11) NOT NULL COMMENT '[do not truncate]',
  `contracttemplates_created` datetime DEFAULT NULL,
  `contracttemplates_updated` datetime DEFAULT NULL,
  `contracttemplates_creatorid` int(11) DEFAULT NULL,
  `contracttemplates_title` varchar(250) DEFAULT NULL,
  `contracttemplates_text` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[do not truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `emaillog_id` int(11) NOT NULL,
  `emaillog_created` datetime DEFAULT NULL,
  `emaillog_updated` datetime DEFAULT NULL,
  `emaillog_email` varchar(100) DEFAULT NULL,
  `emaillog_subject` varchar(200) DEFAULT NULL,
  `emaillog_body` text DEFAULT NULL,
  `emaillog_attachment` varchar(250) DEFAULT 'attached file name'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `emailqueue_id` int(11) NOT NULL,
  `emailqueue_created` datetime NOT NULL,
  `emailqueue_updated` datetime NOT NULL,
  `emailqueue_to` varchar(150) DEFAULT NULL,
  `emailqueue_subject` varchar(250) DEFAULT NULL,
  `emailqueue_message` text DEFAULT NULL,
  `emailqueue_type` varchar(10) DEFAULT 'general' COMMENT 'general|pdf (used for emails that need to generate a pdf)',
  `emailqueue_resourcetype` varchar(10) DEFAULT NULL COMMENT 'e.g. invoice. Used mainly for deleting records, when resource has been deleted',
  `emailqueue_resourceid` int(11) DEFAULT NULL,
  `emailqueue_pdf_resource_type` varchar(50) DEFAULT NULL COMMENT 'estimate|invoice',
  `emailqueue_pdf_resource_id` int(11) DEFAULT NULL COMMENT 'resource id (e.g. estimate id)',
  `emailqueue_started_at` datetime DEFAULT NULL COMMENT 'timestamp of when processing started',
  `emailqueue_status` varchar(20) DEFAULT 'new' COMMENT 'new|processing (set to processing by the cronjob, to avoid duplicate processing)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `emailtemplate_name` varchar(100) DEFAULT NULL,
  `emailtemplate_type` varchar(30) DEFAULT NULL COMMENT 'everyone|admin|client',
  `emailtemplate_category` varchar(30) DEFAULT NULL COMMENT 'users|projects|tasks|leads|tickets|billing|estimates|other',
  `emailtemplate_subject` varchar(250) DEFAULT NULL,
  `emailtemplate_body` text DEFAULT NULL,
  `emailtemplate_variables` text DEFAULT NULL,
  `emailtemplate_created` datetime DEFAULT NULL,
  `emailtemplate_updated` datetime DEFAULT NULL,
  `emailtemplate_status` varchar(20) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `emailtemplate_language` varchar(50) DEFAULT NULL,
  `emailtemplate_real_template` varchar(50) DEFAULT 'yes' COMMENT 'yes|no',
  `emailtemplate_show_enabled` varchar(50) DEFAULT 'yes' COMMENT 'yes|no',
  `emailtemplate_id` int(11) NOT NULL COMMENT 'x'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[do not truncate]';

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('New User Welcome', 'everyone', 'users', 'Welcome - Your Account Details', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Welcome</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>Your account has been created. Below are your login details.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Username</strong></td>\n<td class=\"td-2\">{username}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Password</strong></td>\n<td class=\"td-2\">{password}</td>\n</tr>\n</tbody>\n</table>\n<p>You will be asked to change your password the first time you log in.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{dashboard_url}\" target=\"_blank\" rel=\"noopener\">Login To You Account</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {username}, {password}', '2019-12-08 17:13:10', '2020-11-12 10:10:48', 'enabled', 'english', 'yes', 'yes', 1),
('Reset Password Request', 'everyone', 'users', 'Reset Password Request', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Reset Your Password</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>To complete your password request, please follow the link below.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<p>If you are not the one that has initiated this password request, please contact us.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{password_reset_link}\" target=\"_blank\" rel=\"noopener\">Reset Password</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {password_reset_link}', '2019-12-08 17:13:10', '2020-11-12 12:21:58', 'enabled', 'english', 'yes', 'yes', 2),
('Email Signature', 'everyone', 'other', '---', '<div align=\"left\">\r\n<p>Thanks,</p>\r\n<p><strong>Support Team</strong></p>\r\n</div>', '', '2019-12-08 17:13:10', '2020-08-23 06:58:05', 'disabled', 'english', 'no', 'no', 100),
('Email Footer', 'everyone', 'other', '---', '<p>You received this email because you have an account with us. You can change your email preferences in your account dashboard.</p>', '', '2019-12-08 17:13:10', '2020-11-12 20:38:15', 'disabled', 'english', 'no', 'no', 102),
('New Project Created', 'client', 'projects', 'New Project Created', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Project Details</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>Your new project has just been created. Below are the project\'s details.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Project ID</strong></td>\n<td class=\"td-2\">{project_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Start Date</strong></td>\n<td class=\"td-2\">{project_start_date}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Due Date</strong></td>\n<td class=\"td-2\">{project_due_date}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via then dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{dashboard_url}\" target=\"_blank\" rel=\"noopener\">Login To You Account</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {project_id}, {project_title}, {project_start_date}, {project_due_date}, {project_status}, {project_category}, {project_hourly_rate}, {project_description}, {client_name}, {client_id}, {project_url}', '2019-12-08 17:13:10', '2020-11-12 11:06:30', 'enabled', 'english', 'yes', 'yes', 103),
('Project Status Change', 'client', 'projects', 'Project Status Has Changed', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Project Status Changed</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>The status of your project has just been updated. The new status is shown below.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Project ID</strong></td>\n<td class=\"td-2\">{project_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Status</strong></td>\n<td class=\"td-2\">{project_status}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{project_url}\" target=\"_blank\" rel=\"noopener\">Manage Project</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {project_id}, {project_title}, {project_description}, {project_start_date}, {project_due_date}, {project_status}, {project_category}, {project_hourly_rate}, {project_description}, {client_name}, {client_id}, {project_url}', '2019-12-08 17:13:10', '2020-11-13 08:11:06', 'enabled', 'english', 'yes', 'yes', 105),
('Project File Uploaded', 'everyone', 'projects', 'New Project File Uploaded', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New File Uploaded</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new file has been uploaded to the project.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Project ID</strong></td>\n<td class=\"td-2\">{project_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>File</strong></td>\n<td class=\"td-2\"><a href=\"{file_url}\">{file_name}</a></td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Uploaded By</strong></td>\n<td class=\"td-2\">{uploader_first_name}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{project_files_url}\" target=\"_blank\" rel=\"noopener\">Manage Project</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {file_name}, {file_size}, {file_extension}, {file_url}, {uploader_first_name}, {uploader_last_name}, {project_id}, {project_description}, {project_title}, {project_start_date}, {project_due_date}, {project_status}, {project_category}, {project_hourly_rate}, {project_description}, {client_name}, {client_id}, {project_url}, {project_files_url}', '2019-12-08 17:13:10', '2020-11-12 12:25:45', 'enabled', 'english', 'yes', 'yes', 106);
INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('Project Comment', 'everyone', 'projects', 'New Project Comment', '<!DOCTYPE html>\r\n<html>\r\n\r\n<head>\r\n\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n    <title>Email Confirmation</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        @media screen {\r\n            @font-face {\r\n                font-family: \'Source Sans Pro\';\r\n                font-style: normal;\r\n                font-weight: 400;\r\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\r\n            }\r\n\r\n            @font-face {\r\n                font-family: \'Source Sans Pro\';\r\n                font-style: normal;\r\n                font-weight: 700;\r\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\r\n            }\r\n        }\r\n\r\n        body,\r\n        table,\r\n        td,\r\n        a {\r\n            -ms-text-size-adjust: 100%;\r\n            /* 1 */\r\n            -webkit-text-size-adjust: 100%;\r\n            /* 2 */\r\n        }\r\n\r\n        img {\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n\r\n        a[x-apple-data-detectors] {\r\n            font-family: inherit !important;\r\n            font-size: inherit !important;\r\n            font-weight: inherit !important;\r\n            line-height: inherit !important;\r\n            color: inherit !important;\r\n            text-decoration: none !important;\r\n        }\r\n\r\n        div[style*=\"margin: 16px 0;\"] {\r\n            margin: 0 !important;\r\n        }\r\n\r\n        body {\r\n            width: 100% !important;\r\n            height: 100% !important;\r\n            padding: 0 !important;\r\n            margin: 0 !important;\r\n            padding: 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            background-color: #f9fafc;\r\n            color: #60676d;\r\n        }\r\n\r\n        table {\r\n            border-collapse: collapse !important;\r\n        }\r\n\r\n        a {\r\n            color: #1a82e2;\r\n        }\r\n\r\n        img {\r\n            height: auto;\r\n            line-height: 100%;\r\n            text-decoration: none;\r\n            border: 0;\r\n            outline: none;\r\n        }\r\n\r\n        .table-1 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-1 td {\r\n            padding: 36px 24px 40px;\r\n            text-align: center;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-1 h1 {\r\n            margin: 0;\r\n            font-size: 32px;\r\n            font-weight: 600;\r\n            letter-spacing: -1px;\r\n            line-height: 48px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-2 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-2 td {\r\n            padding: 36px 24px 0;\r\n            border-top: 3px solid #d4dadf;\r\n            background-color: #ffffff;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-2 h1 {\r\n            margin: 0;\r\n            font-size: 20px;\r\n            font-weight: 600;\r\n            letter-spacing: -1px;\r\n            line-height: 48px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-3 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-2 td {\r\n\r\n            background-color: #ffffff;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .td-1 {\r\n            padding: 24px;\r\n            font-size: 16px;\r\n            line-height: 24px;\r\n            background-color: #ffffff;\r\n            text-align: left;\r\n            padding-bottom: 10px;\r\n            padding-top: 0px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-gray {\r\n            width: 100%;\r\n        }\r\n\r\n        .table-gray tr {\r\n            height: 24px;\r\n        }\r\n\r\n        .table-gray .td-1 {\r\n            background-color: #f1f3f7;\r\n            width: 30%;\r\n            border: solid 1px #e7e9ec;\r\n            padding-top: 5px;\r\n            padding-bottom: 5px;\r\n            font-size:16px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-gray .td-2 {\r\n            background-color: #f1f3f7;\r\n            width: 70%;\r\n            border: solid 1px #e7e9ec;\r\n            font-size:16px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .button {\r\n            display: inline-block;\r\n            padding: 16px 36px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            color: #ffffff;\r\n            text-decoration: none;\r\n            border-radius: 6px;\r\n            background-color: #1a82e2;\r\n            border-radius: 6px;\r\n        }\r\n\r\n        .signature {\r\n            padding: 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            line-height: 24px;\r\n            border-bottom: 3px solid #d4dadf;\r\n            background-color: #ffffff;\r\n        }\r\n\r\n        .footer {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .footer td {\r\n            padding: 12px 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 14px;\r\n            line-height: 20px;\r\n            color: #666;\r\n        }\r\n\r\n        .td-button {\r\n            padding: 12px;\r\n            background-color: #ffffff;\r\n            text-align: center;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .p-24 {\r\n            padding: 24px;\r\n        }\r\n    </style>\r\n\r\n</head>\r\n\r\n<body>\r\n<!-- start body -->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\">\r\n<h1>New Comment Posted</h1>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end hero --> <!-- start hero -->\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\">\r\n<h1>Hi {first_name},</h1>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end hero --> <!-- start copy block -->\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\r\n<tbody>\r\n<tr>\r\n<td class=\"td-1\">\r\n<p>A new comment has been posted on this project.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\">\r\n<table class=\"table-gray\" cellpadding=\"5\">\r\n<tbody>\r\n<tr>\r\n<td class=\"td-1\"><strong>Project Title</strong></td>\r\n<td class=\"td-2\">{project_title}</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\"><strong>Posted By</strong></td>\r\n<td class=\"td-2\">{poster_first_name}</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\" colspan=\"2\">{comment}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>You can manage your project via the dashboard.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"left\" bgcolor=\"#ffffff\">\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"td-button\">\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\"><a class=\"button\" href=\"{project_comments_url}\" target=\"_blank\" rel=\"noopener\">Manage Project</a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"signature\">\r\n<p>{email_signature}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end copy block --> <!-- start footer -->\r\n<tr>\r\n<td class=\"p-24\" align=\"center\">\r\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<p>{email_footer}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end footer --></tbody>\r\n</table>\r\n<!-- end body -->\r\n</body>\r\n\r\n</html>', '{first_name}, {last_name}, {comment}, {poster_first_name}, {poster_last_name}, {project_id}, {project_title}, {project_start_date}, {project_due_date}, {project_status}, {project_category}, {project_hourly_rate}, {project_description}, {client_name}, {client_id}, {project_url}, {project_comments_url}', '2019-12-08 17:13:10', '2020-11-21 19:24:33', 'enabled', 'english', 'yes', 'yes', 107),
('Project Assignment', 'team', 'projects', 'New Project Assignment', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Project Assignment</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>You have just been assigned to a new project.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Project ID</strong></td>\n<td class=\"td-2\">{project_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Start Date</strong></td>\n<td class=\"td-2\">{project_start_date}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Due Date</strong></td>\n<td class=\"td-2\">{project_due_date}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{project_url}\" target=\"_blank\" rel=\"noopener\">Manage Project</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {assigned_by_first_name}, {assigned_by_last_name}, {project_id}, {project_description}, {project_title}, {project_description}, {project_start_date}, {project_due_date}, {project_status}, {project_category}, {project_hourly_rate}, {project_description}, {client_name}, {client_id}, {project_url}', '2019-12-08 17:13:10', '2020-11-12 12:39:45', 'enabled', 'english', 'yes', 'yes', 108),
('Lead Status Change', 'team', 'leads', 'Lead Status Has Changed', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Lead Status Update</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>The status of this lead has just been updated. The new status is shown below.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Lead ID</strong></td>\n<td class=\"td-2\">{lead_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Lead Title</strong></td>\n<td class=\"td-2\">{lead_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Lead Name</strong></td>\n<td class=\"td-2\">{lead_name}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Lead Status</strong></td>\n<td class=\"td-2\">{lead_status}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your lead via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{lead_url}\" target=\"_blank\" rel=\"noopener\">Manage Lead</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {lead_id}, {lead_name}, {lead_title}, {lead_description}, {lead_created_date}, {lead_value}, {lead_status}, {lead_category}, {lead_url}', '2019-12-08 17:13:10', '2020-11-12 12:42:09', 'enabled', 'english', 'yes', 'yes', 109),
('Lead Comment', 'team', 'leads', 'New Lead Comment', '<!DOCTYPE html>\r\n<html>\r\n\r\n<head>\r\n\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n    <title>Email Confirmation</title>\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        @media screen {\r\n            @font-face {\r\n                font-family: \'Source Sans Pro\';\r\n                font-style: normal;\r\n                font-weight: 400;\r\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\r\n            }\r\n\r\n            @font-face {\r\n                font-family: \'Source Sans Pro\';\r\n                font-style: normal;\r\n                font-weight: 700;\r\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\r\n            }\r\n        }\r\n\r\n        body,\r\n        table,\r\n        td,\r\n        a {\r\n            -ms-text-size-adjust: 100%;\r\n            /* 1 */\r\n            -webkit-text-size-adjust: 100%;\r\n            /* 2 */\r\n        }\r\n\r\n        img {\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n\r\n        a[x-apple-data-detectors] {\r\n            font-family: inherit !important;\r\n            font-size: inherit !important;\r\n            font-weight: inherit !important;\r\n            line-height: inherit !important;\r\n            color: inherit !important;\r\n            text-decoration: none !important;\r\n        }\r\n\r\n        div[style*=\"margin: 16px 0;\"] {\r\n            margin: 0 !important;\r\n        }\r\n\r\n        body {\r\n            width: 100% !important;\r\n            height: 100% !important;\r\n            padding: 0 !important;\r\n            margin: 0 !important;\r\n            padding: 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            background-color: #f9fafc;\r\n            color: #60676d;\r\n        }\r\n\r\n        table {\r\n            border-collapse: collapse !important;\r\n        }\r\n\r\n        a {\r\n            color: #1a82e2;\r\n        }\r\n\r\n        img {\r\n            height: auto;\r\n            line-height: 100%;\r\n            text-decoration: none;\r\n            border: 0;\r\n            outline: none;\r\n        }\r\n\r\n        .table-1 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-1 td {\r\n            padding: 36px 24px 40px;\r\n            text-align: center;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-1 h1 {\r\n            margin: 0;\r\n            font-size: 32px;\r\n            font-weight: 600;\r\n            letter-spacing: -1px;\r\n            line-height: 48px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-2 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-2 td {\r\n            padding: 36px 24px 0;\r\n            border-top: 3px solid #d4dadf;\r\n            background-color: #ffffff;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-2 h1 {\r\n            margin: 0;\r\n            font-size: 20px;\r\n            font-weight: 600;\r\n            letter-spacing: -1px;\r\n            line-height: 48px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-3 {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .table-2 td {\r\n\r\n            background-color: #ffffff;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .td-1 {\r\n            padding: 24px;\r\n            font-size: 16px;\r\n            line-height: 24px;\r\n            background-color: #ffffff;\r\n            text-align: left;\r\n            padding-bottom: 10px;\r\n            padding-top: 0px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-gray {\r\n            width: 100%;\r\n        }\r\n\r\n        .table-gray tr {\r\n            height: 24px;\r\n        }\r\n\r\n        .table-gray .td-1 {\r\n            background-color: #f1f3f7;\r\n            width: 30%;\r\n            border: solid 1px #e7e9ec;\r\n            padding-top: 5px;\r\n            padding-bottom: 5px;\r\n            font-size:16px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .table-gray .td-2 {\r\n            background-color: #f1f3f7;\r\n            width: 70%;\r\n            border: solid 1px #e7e9ec;\r\n            font-size:16px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .button {\r\n            display: inline-block;\r\n            padding: 16px 36px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            color: #ffffff;\r\n            text-decoration: none;\r\n            border-radius: 6px;\r\n            background-color: #1a82e2;\r\n            border-radius: 6px;\r\n        }\r\n\r\n        .signature {\r\n            padding: 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 16px;\r\n            line-height: 24px;\r\n            border-bottom: 3px solid #d4dadf;\r\n            background-color: #ffffff;\r\n        }\r\n\r\n        .footer {\r\n            max-width: 600px;\r\n        }\r\n\r\n        .footer td {\r\n            padding: 12px 24px;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n            font-size: 14px;\r\n            line-height: 20px;\r\n            color: #666;\r\n        }\r\n\r\n        .td-button {\r\n            padding: 12px;\r\n            background-color: #ffffff;\r\n            text-align: center;\r\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\r\n        }\r\n\r\n        .p-24 {\r\n            padding: 24px;\r\n        }\r\n    </style>\r\n\r\n</head>\r\n\r\n<body>\r\n<!-- start body -->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\">\r\n<h1>New Comment Posted</h1>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end hero --> <!-- start hero -->\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"left\">\r\n<h1>Hi {first_name},</h1>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end hero --> <!-- start copy block -->\r\n<tr>\r\n<td align=\"center\">\r\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\r\n<tbody>\r\n<tr>\r\n<td class=\"td-1\">\r\n<p>A new comment has been posted on this lead.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\">\r\n<table class=\"table-gray\" cellpadding=\"5\">\r\n<tbody>\r\n<tr>\r\n<td class=\"td-1\"><strong>Lead Title</strong></td>\r\n<td class=\"td-2\">{lead_title}</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\"><strong>Posted By</strong></td>\r\n<td class=\"td-2\">{poster_first_name}</td>\r\n</tr>\r\n<tr>\r\n<td class=\"td-1\" colspan=\"2\">{comment}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>You can manage your lead via the dashboard.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"left\" bgcolor=\"#ffffff\">\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"td-button\">\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\"><a class=\"button\" href=\"{lead_url}\" target=\"_blank\" rel=\"noopener\">Manage Lead</a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class=\"signature\">\r\n<p>{email_signature}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end copy block --> <!-- start footer -->\r\n<tr>\r\n<td class=\"p-24\" align=\"center\">\r\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<p>{email_footer}</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<!-- end footer --></tbody>\r\n</table>\r\n<!-- end body -->\r\n</body>\r\n\r\n</html>', '{first_name}, {last_name}, {lead_id}, {lead_name}, {lead_description}, {comment}, {poster_first_name}, {poster_last_name}, {lead_title}, {lead_created_date}, {lead_value}, {lead_status}, {lead_category}, {lead_url}', '2019-12-08 17:13:10', '2020-11-21 19:22:27', 'enabled', 'english', 'yes', 'yes', 110),
('Lead Assignment', 'team', 'leads', 'New Lead Assignment', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Lead Assignment</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>You have just been assigned to a lead.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Lead Name</strong></td>\n<td class=\"td-2\">{lead_name}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Lead Title</strong></td>\n<td class=\"td-2\">{lead_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{lead_url}\" target=\"_blank\" rel=\"noopener\">Manage Lead</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {assigned_by_first_name}, {assigned_by_last_name}, {lead_id}, {lead_name}, {lead_description}, {lead_title}, {lead_created_date}, {lead_value}, {lead_status}, {lead_category}, {lead_url}', '2019-12-08 17:13:10', '2020-11-12 12:44:45', 'enabled', 'english', 'yes', 'yes', 111);
INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('Lead File Uploaded', 'team', 'leads', 'New Lead File Uploaded', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New File Added</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new file has just been attached to this lead.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Lead Name</strong></td>\n<td class=\"td-2\">{lead_name}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Lead Title</strong></td>\n<td class=\"td-2\">{lead_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>File</strong></td>\n<td class=\"td-2\"><a href=\"{file_url}\">{file_name}</a></td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Uploaded By</strong></td>\n<td class=\"td-2\">{uploader_first_name}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your lead via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{lead_url}\" target=\"_blank\" rel=\"noopener\">Manage Lead</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {file_name}, {file_size}, {file_extension}, {file_url}, {uploader_first_name}, {uploader_last_name}, {lead_id}, {lead_name}, {lead_description}, {lead_title}, {lead_created_date}, {lead_value}, {lead_status}, {lead_category}, {lead_url}', '2019-12-08 17:13:10', '2020-11-12 12:46:56', 'enabled', 'english', 'yes', 'yes', 112),
('Task Status Change', 'everyone', 'tasks', 'Task Status Has Changed', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Task Status Update</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>The status of this task has just been updated. The new status is shown below.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Task Title</strong></td>\n<td class=\"td-2\">{task_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Status</strong></td>\n<td class=\"td-2\">{task_status}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your task via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{task_url}\" target=\"_blank\" rel=\"noopener\">View Task</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {task_id}, {task_title}, {task_created_date}, {task_date_start}, {task_description}, {task_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {task_status}, {task_milestone}, {task_url}', '2019-12-08 17:13:10', '2020-11-13 08:15:19', 'enabled', 'english', 'yes', 'yes', 113),
('Task Assignment', 'everyone', 'tasks', 'New Task Assignment', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Task Assignment</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>You have just been assigned to a task.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Task Title</strong></td>\n<td class=\"td-2\">{task_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Due Date</strong></td>\n<td class=\"td-2\">{task_date_due}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your task via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{task_url}\" target=\"_blank\" rel=\"noopener\">Manage Task</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {assigned_by_first_name}, {assigned_by_last_name}, {task_id}, {task_title}, {task_created_date}, {task_date_start}, {task_description}, {task_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {task_status}, {task_milestone}, {task_url}', '2019-12-08 17:13:10', '2020-11-12 12:50:42', 'enabled', 'english', 'yes', 'yes', 115),
('Task File Uploaded', 'everyone', 'tasks', 'New Task File Uploaded', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New File Added</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new file has just been attached to this task.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Task Title</strong></td>\n<td class=\"td-2\">{task_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>File</strong></td>\n<td class=\"td-2\"><a href=\"{file_url}\">{file_name}</a></td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Uploaded By</strong></td>\n<td class=\"td-2\">{uploader_first_name}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your task via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{task_url}\" target=\"_blank\" rel=\"noopener\">Manage Task</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {file_name}, {file_size}, {file_extension}, {file_url}, {uploader_first_name}, {uploader_last_name}, {task_id}, {task_title}, {task_created_date}, {task_date_start}, {task_description}, {task_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {task_status}, {task_milestone}, {task_url}', '2019-12-08 17:13:10', '2020-11-12 12:53:03', 'enabled', 'english', 'yes', 'yes', 116),
('New Invoice', 'client', 'billing', 'New Invoice - #{invoice_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Invoice</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>foo bar</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Invoice ID</strong></td>\n<td class=\"td-2\">{invoice_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Amount</strong></td>\n<td class=\"td-2\">{invoice_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Due Date</strong></td>\n<td class=\"td-2\">{invoice_date_due}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can view your invoice and make any payments using the link below.</p>\n<p>Your invoice is attached.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{invoice_url}\" target=\"_blank\" rel=\"noopener\">View Invoice</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {invoice_id}, {invoice_amount}, {invoice_amount_due}, {invoice_date_created}, {invoice_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {invoice_status}, {invoice_url}', '2019-12-08 17:13:10', '2020-11-13 08:21:16', 'enabled', 'english', 'yes', 'yes', 117);
INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('Invoice Reminder', 'client', 'billing', 'Invoice Reminder - #{invoice_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Invoice Reminder</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>This invoice is now overdue.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Invoice ID</strong></td>\n<td class=\"td-2\">{invoice_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Due Date</strong></td>\n<td class=\"td-2\">{invoice_date_due}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Amount</strong></td>\n<td class=\"td-2\">{invoice_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can view your invoice and make any payments using the link below.</p>\n<p>Your invoice is attached.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{invoice_url}\" target=\"_blank\" rel=\"noopener\">View Invoice</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {invoice_id}, {invoice_amount}, {invoice_amount_due}, {invoice_created_date}, {invoice_date_created}, {invoice_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {invoice_status}, {client_name}, {client_id},{invoice_url}', '2019-12-08 17:13:10', '2020-11-13 08:23:26', 'enabled', 'english', 'yes', 'yes', 118),
('Thank You For Payment', 'client', 'billing', 'Thank You For Your Payment', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Thank You!</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>We have received your payment and it has been applied to your invoice.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Invoice ID</strong></td>\n<td class=\"td-2\">{invoice_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Amount Paid</strong></td>\n<td class=\"td-2\">{payment_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Transaction ID</strong></td>\n<td class=\"td-2\">{payment_transaction_id}</td>\n</tr>\n</tbody>\n</table>\n<p>You can view your invoice using the link below.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{invoice_url}\" target=\"_blank\" rel=\"noopener\">View Invoice</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {invoice_id}, {invoice_amount}, {invoice_amount_due}, {invoice_date_created}, {invoice_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {invoice_status}, {payment_gateway}, {payment_amount}, {payment_transaction_id}, {client_id}, {client_name}, {paid_by_name}, {invoice_url}', '2019-12-08 17:13:10', '2020-11-12 13:02:54', 'enabled', 'english', 'yes', 'yes', 119),
('New Payment', 'team', 'billing', 'New Payment Received', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Payment</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new payment has just been made.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Invoice ID</strong></td>\n<td class=\"td-2\">{invoice_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Amount Due</strong></td>\n<td class=\"td-2\">{invoice_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Transaction ID</strong></td>\n<td class=\"td-2\">{payment_transaction_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Client Name</strong></td>\n<td class=\"td-2\">{client_name}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Paid By</strong></td>\n<td class=\"td-2\">{paid_by_name}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage payments and invoices via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{invoice_url}\" target=\"_blank\" rel=\"noopener\">Manage Invoices</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {invoice_id}, {invoice_amount}, {invoice_amount_due}, {invoice_date_created}, {invoice_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {invoice_status}, {payment_gateway}, {payment_amount}, {payment_transaction_id}, {client_id}, {client_name}, {paid_by_name}, {invoice_url}', '2019-12-08 17:13:10', '2020-11-12 13:06:24', 'enabled', 'english', 'yes', 'yes', 120),
('New Estimate', 'client', 'estimates', 'New Estimate - #{estimate_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>NEW ESTIMATE</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>We have prepared a new cost estimate for your project.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Estimate Amount</strong></td>\n<td class=\"td-2\">{estimate_amount}</td>\n</tr>\n</tbody>\n</table>\n<p>You can review this estimate via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{estimate_url}\" target=\"_blank\" rel=\"noopener\">View Estimate</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {estimate_id}, {estimate_amount}, {estimate_date_created}, {estimate_expiry_date}, {project_title}, {project_id}, {client_name}, {client_id}, {estimate_status}, {estimate_url}', '2019-12-08 17:13:10', '2020-11-12 20:09:26', 'enabled', 'english', 'yes', 'yes', 121),
('New Ticket', 'everyone', 'tickets', 'New Ticket Opened - #{ticket_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Ticket Opened</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new support ticket has been created.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Title</strong></td>\n<td class=\"td-2\">{ticket_subject}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Created By</strong></td>\n<td class=\"td-2\">{by_first_name}</td>\n</tr>\n<tr>\n<td class=\"td-2\" colspan=\"2\">{ticket_message}</td>\n</tr>\n</tbody>\n</table>\n<p>You can view and respond to this ticket via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{ticket_url}\" target=\"_blank\" rel=\"noopener\">View Ticket</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {ticket_id}, {by_first_name}, {by_last_name}, {ticket_subject}, {ticket_message}, {ticket_date_created}, {project_id}, {project_title}, {client_name}, {client_id}, {ticket_priority}, {ticket_status}, {ticket_url}', '2019-12-08 17:13:10', '2020-11-12 20:29:16', 'enabled', 'english', 'yes', 'yes', 124);
INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('New Ticket Reply', 'everyone', 'tickets', 'New Ticket Reply - #{ticket_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Ticket Reply</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new reply has just been posted to this ticket.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Title</strong></td>\n<td class=\"td-2\">{ticket_subject}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Posted By</strong></td>\n<td class=\"td-2\">{by_first_name}</td>\n</tr>\n<tr>\n<td class=\"td-2\" colspan=\"2\">{ticket_reply_message}</td>\n</tr>\n</tbody>\n</table>\n<p>You can view and reply to this ticket via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{ticket_url}\" target=\"_blank\" rel=\"noopener\">View Ticket</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {ticket_id}, {by_first_name}, {by_last_name}, {ticket_subject}, {ticket_message}, {ticket_reply_message}, {ticket_date_created}, {project_id}, {project_title}, {client_name}, {client_id}, {ticket_priority}, {ticket_status}, {ticket_url}', '2019-12-08 17:13:10', '2020-11-12 20:33:27', 'enabled', 'english', 'yes', 'yes', 125),
('Ticket Closed', 'client', 'tickets', 'Ticket Has Been Closed', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Ticket Closed</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>This ticket has now been closed.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Ticket ID</strong></td>\n<td class=\"td-2\">{username}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Ticket Title</strong></td>\n<td class=\"td-2\">{password}</td>\n</tr>\n</tbody>\n</table>\n<p>If you require further assistance you can open a new support ticket.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{ticket_url}\" target=\"_blank\" rel=\"noopener\">View Ticket</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {ticket_id}, {by_first_name}, {by_last_name}, {ticket_subject}, {ticket_message}, {ticket_date_created}, {project_id}, {project_title}, {client_name}, {client_id}, {ticket_status}, {ticket_priority}, {ticket_url}', '2019-12-08 17:13:10', '2020-11-12 20:35:20', 'enabled', 'english', 'yes', 'yes', 126),
('System Notification', 'admin', 'system', '{notification_subject}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>{notification_title}</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>{notification_message}</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">&nbsp;</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {notification_title}, {notification_subject}, {notification_message}', '2019-12-08 17:13:10', '2020-11-12 20:37:25', 'enabled', 'english', 'yes', 'yes', 127),
('Task Comment', 'everyone', 'tasks', 'New Task Comment', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>New Comment</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>A new comment has just been posted on this project.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Task</strong></td>\n<td class=\"td-2\">{task_title}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Posted By</strong></td>\n<td class=\"td-2\">{poster_first_name}</td>\n</tr>\n<tr>\n<td class=\"td-2\" colspan=\"2\">{comment}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your task via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{task_url}\" target=\"_blank\" rel=\"noopener\">View Task</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {comment}, {poster_first_name}, {poster_last_name}, {task_id}, {task_title}, {task_created_date}, {task_date_start}, {task_description}, {task_date_due}, {project_title}, {project_id}, {client_name}, {client_id}, {task_status}, {task_milestone}, {task_url}', '2019-12-08 17:13:10', '2020-11-13 08:18:31', 'enabled', 'english', 'yes', 'yes', 128),
('Estimate Accepted', 'team', 'estimates', 'Estimate Accepted - #{estimate_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Estimate Accepted</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>Great news, {client_name} has just accepted this Estimate.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Estimate ID</strong></td>\n<td class=\"td-2\">{estimate_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Estimate Amount</strong></td>\n<td class=\"td-2\">{estimate_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage this estimate via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{estimate_url}\" target=\"_blank\" rel=\"noopener\">View Estimate</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {estimate_id}, {estimate_amount}, {estimate_date_created}, {estimate_expiry_date}, {project_id}, {project_title}, {client_name}, {client_id}, {estimate_status}, {estimate_url}', '2019-12-08 17:13:10', '2020-11-12 20:20:09', 'enabled', 'english', 'yes', 'yes', 129);
INSERT INTO `email_templates` (`emailtemplate_name`, `emailtemplate_type`, `emailtemplate_category`, `emailtemplate_subject`, `emailtemplate_body`, `emailtemplate_variables`, `emailtemplate_created`, `emailtemplate_updated`, `emailtemplate_status`, `emailtemplate_language`, `emailtemplate_real_template`, `emailtemplate_show_enabled`, `emailtemplate_id`) VALUES
('Estimate Declined', 'team', 'estimates', 'Estimate Declined - #{estimate_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Estimate Declined</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>Unfortunately,&nbsp;{client_name} has just declined this estimate.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Estimate ID</strong></td>\n<td class=\"td-2\">{estimate_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Estimate Amount</strong></td>\n<td class=\"td-2\">{estimate_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can manage your project via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{estimate_url}\" target=\"_blank\" rel=\"noopener\">View Estimate</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {estimate_id}, {estimate_amount}, {estimate_date_created}, {estimate_expiry_date}, {project_id}, {project_title}, {client_name}, {client_id}, {estimate_status}, {estimate_url}', '2019-12-08 17:13:10', '2020-11-13 08:25:00', 'enabled', 'english', 'yes', 'yes', 130),
('Estimate Revised', 'client', 'estimates', 'Estimate Revised - #{estimate_id}', '<!DOCTYPE html>\n<html>\n\n<head>\n\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <title>Email Confirmation</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <style type=\"text/css\">\n        @media screen {\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 400;\n                src: local(\'Source Sans Pro Regular\'), local(\'SourceSansPro-Regular\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format(\'woff\');\n            }\n\n            @font-face {\n                font-family: \'Source Sans Pro\';\n                font-style: normal;\n                font-weight: 700;\n                src: local(\'Source Sans Pro Bold\'), local(\'SourceSansPro-Bold\'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format(\'woff\');\n            }\n        }\n\n        body,\n        table,\n        td,\n        a {\n            -ms-text-size-adjust: 100%;\n            /* 1 */\n            -webkit-text-size-adjust: 100%;\n            /* 2 */\n        }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        a[x-apple-data-detectors] {\n            font-family: inherit !important;\n            font-size: inherit !important;\n            font-weight: inherit !important;\n            line-height: inherit !important;\n            color: inherit !important;\n            text-decoration: none !important;\n        }\n\n        div[style*=\"margin: 16px 0;\"] {\n            margin: 0 !important;\n        }\n\n        body {\n            width: 100% !important;\n            height: 100% !important;\n            padding: 0 !important;\n            margin: 0 !important;\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            background-color: #f9fafc;\n            color: #60676d;\n        }\n\n        table {\n            border-collapse: collapse !important;\n        }\n\n        a {\n            color: #1a82e2;\n        }\n\n        img {\n            height: auto;\n            line-height: 100%;\n            text-decoration: none;\n            border: 0;\n            outline: none;\n        }\n\n        .table-1 {\n            max-width: 600px;\n        }\n\n        .table-1 td {\n            padding: 36px 24px 40px;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-1 h1 {\n            margin: 0;\n            font-size: 32px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n            padding: 36px 24px 0;\n            border-top: 3px solid #d4dadf;\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-2 h1 {\n            margin: 0;\n            font-size: 20px;\n            font-weight: 600;\n            letter-spacing: -1px;\n            line-height: 48px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-3 {\n            max-width: 600px;\n        }\n\n        .table-2 td {\n\n            background-color: #ffffff;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .td-1 {\n            padding: 24px;\n            font-size: 16px;\n            line-height: 24px;\n            background-color: #ffffff;\n            text-align: left;\n            padding-bottom: 10px;\n            padding-top: 0px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray {\n            width: 100%;\n        }\n\n        .table-gray tr {\n            height: 24px;\n        }\n\n        .table-gray .td-1 {\n            background-color: #f1f3f7;\n            width: 30%;\n            border: solid 1px #e7e9ec;\n            padding-top: 5px;\n            padding-bottom: 5px;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .table-gray .td-2 {\n            background-color: #f1f3f7;\n            width: 70%;\n            border: solid 1px #e7e9ec;\n            font-size:16px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .button {\n            display: inline-block;\n            padding: 16px 36px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            color: #ffffff;\n            text-decoration: none;\n            border-radius: 6px;\n            background-color: #1a82e2;\n            border-radius: 6px;\n        }\n\n        .signature {\n            padding: 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 16px;\n            line-height: 24px;\n            border-bottom: 3px solid #d4dadf;\n            background-color: #ffffff;\n        }\n\n        .footer {\n            max-width: 600px;\n        }\n\n        .footer td {\n            padding: 12px 24px;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n            font-size: 14px;\n            line-height: 20px;\n            color: #666;\n        }\n\n        .td-button {\n            padding: 12px;\n            background-color: #ffffff;\n            text-align: center;\n            font-family: \'Source Sans Pro\', Helvetica, Arial, sans-serif;\n        }\n\n        .p-24 {\n            padding: 24px;\n        }\n    </style>\n\n</head>\n\n<body>\n<!-- start body -->\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start hero -->\n<tbody>\n<tr>\n<td align=\"center\">\n<table class=\"table-1\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Estimate Revised</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start hero -->\n<tr>\n<td align=\"center\">\n<table class=\"table-2\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"left\">\n<h1>Hi {first_name},</h1>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end hero --> <!-- start copy block -->\n<tr>\n<td align=\"center\">\n<table class=\"table-3\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start copy -->\n<tbody>\n<tr>\n<td class=\"td-1\">\n<p>Great news, we have just revised your estimate. The revised estimate is attached to this email.</p>\n</td>\n</tr>\n<tr>\n<td class=\"td-1\">\n<table class=\"table-gray\" cellpadding=\"5\">\n<tbody>\n<tr>\n<td class=\"td-1\"><strong>Estimate ID</strong></td>\n<td class=\"td-2\">{estimate_id}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Estimate Amount</strong></td>\n<td class=\"td-2\">{estimate_amount}</td>\n</tr>\n<tr>\n<td class=\"td-1\"><strong>Project Title</strong></td>\n<td class=\"td-2\">{project_title}</td>\n</tr>\n</tbody>\n</table>\n<p>You can review this estimate via the dashboard.</p>\n</td>\n</tr>\n<tr>\n<td align=\"left\" bgcolor=\"#ffffff\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td class=\"td-button\">\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr>\n<td align=\"center\"><a class=\"button\" href=\"{estimate_url}\" target=\"_blank\" rel=\"noopener\">View Estimate</a></td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td class=\"signature\">\n<p>{email_signature}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end copy block --> <!-- start footer -->\n<tr>\n<td class=\"p-24\" align=\"center\">\n<table class=\"footer\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><!-- start permission -->\n<tbody>\n<tr>\n<td align=\"center\">\n<p>{email_footer}</p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<!-- end footer --></tbody>\n</table>\n<!-- end body -->\n</body>\n\n</html>', '{first_name}, {last_name}, {estimate_id}, {estimate_amount}, {estimate_date_created}, {estimate_expiry_date}, {project_id}, {project_title}, {client_name}, {client_id}, {estimate_status}, {estimate_url}', '2019-12-08 17:13:10', '2020-11-12 20:26:04', 'enabled', 'english', 'yes', 'yes', 131);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `office_shift_id` int(111) NOT NULL,
  `reports_to` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `date_of_birth` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `e_status` int(11) NOT NULL,
  `user_role_id` int(100) NOT NULL,
  `department_id` int(100) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `designation_id` int(100) NOT NULL,
  `company_id` int(111) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `view_companies_id` varchar(255) NOT NULL,
  `salary_template` varchar(255) NOT NULL,
  `hourly_grade_id` int(111) NOT NULL,
  `monthly_grade_id` int(111) NOT NULL,
  `date_of_joining` varchar(200) NOT NULL,
  `date_of_leaving` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `wages_type` int(11) NOT NULL,
  `basic_salary` varchar(200) NOT NULL DEFAULT '0',
  `daily_wages` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempee` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempeer` varchar(200) DEFAULT '0',
  `salary_income_tax` varchar(200) NOT NULL DEFAULT '0',
  `salary_overtime` varchar(200) NOT NULL DEFAULT '0',
  `salary_commission` varchar(200) NOT NULL DEFAULT '0',
  `salary_claims` varchar(200) NOT NULL DEFAULT '0',
  `salary_paid_leave` varchar(200) NOT NULL DEFAULT '0',
  `salary_director_fees` varchar(200) NOT NULL DEFAULT '0',
  `salary_bonus` varchar(200) NOT NULL DEFAULT '0',
  `salary_advance_paid` varchar(200) NOT NULL DEFAULT '0',
  `address` mediumtext NOT NULL,
  `state` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_no` varchar(45) DEFAULT NULL,
  `profile_picture` mediumtext NOT NULL,
  `profile_background` mediumtext NOT NULL,
  `resume` mediumtext NOT NULL,
  `skype_id` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `facebook_link` mediumtext NOT NULL,
  `twitter_link` mediumtext NOT NULL,
  `blogger_link` mediumtext NOT NULL,
  `linkdedin_link` mediumtext NOT NULL,
  `google_plus_link` mediumtext NOT NULL,
  `instagram_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(111) NOT NULL,
  `online_status` int(111) NOT NULL,
  `fixed_header` varchar(150) NOT NULL,
  `compact_sidebar` varchar(150) NOT NULL,
  `boxed_wrapper` varchar(150) NOT NULL,
  `ethnicity_type` int(11) NOT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `nationality_id` int(11) NOT NULL,
  `citizenship_id` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `bill_estimateid` int(11) NOT NULL,
  `bill_created` datetime DEFAULT NULL,
  `bill_updated` datetime DEFAULT NULL,
  `bill_date_sent_to_customer` datetime DEFAULT NULL,
  `bill_clientid` int(11) NOT NULL,
  `bill_projectid` int(11) DEFAULT NULL,
  `bill_creatorid` int(11) NOT NULL,
  `bill_categoryid` int(11) NOT NULL DEFAULT 4,
  `bill_date` date NOT NULL,
  `bill_expiry_date` date DEFAULT NULL,
  `bill_subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `bill_discount_type` varchar(30) DEFAULT 'none' COMMENT 'amount | percentage | none',
  `bill_discount_percentage` decimal(10,2) DEFAULT 0.00 COMMENT 'actual amount or percentage',
  `bill_discount_amount` decimal(10,2) DEFAULT 0.00,
  `bill_amount_before_tax` decimal(10,2) DEFAULT 0.00,
  `bill_tax_type` varchar(20) DEFAULT 'summary' COMMENT 'summary|lineitem|none',
  `bill_tax_total_percentage` decimal(10,2) DEFAULT 0.00 COMMENT 'percentage',
  `bill_tax_total_amount` decimal(10,2) DEFAULT 0.00 COMMENT 'amount',
  `bill_final_amount` decimal(10,2) DEFAULT 0.00,
  `bill_notes` text DEFAULT NULL,
  `bill_terms` text DEFAULT NULL,
  `bill_status` varchar(50) NOT NULL DEFAULT 'draft' COMMENT 'draft | new | accepted | revised | declined | expired',
  `bill_type` varchar(20) NOT NULL DEFAULT 'estimate' COMMENT 'estimate|invoice',
  `bill_visibility` varchar(20) NOT NULL DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent estimates that are still being cloned from showing in estimates list)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_created` datetime DEFAULT NULL COMMENT '[notes] Events record the event, whilst timelines determine where the event is displayed',
  `event_updated` datetime DEFAULT NULL,
  `event_creatorid` int(11) NOT NULL,
  `event_clientid` int(11) NOT NULL COMMENT 'for client type resources',
  `event_item` varchar(150) DEFAULT NULL COMMENT 'status | project | task | lead | expense | estimate| comment | attachment | file | invoice | payment | assigned',
  `event_item_id` int(11) DEFAULT NULL COMMENT 'e.g. invoice_id (used in the link shown in the even)',
  `event_item_content` text DEFAULT NULL COMMENT 'e.g. #INV-029200 (used in the text if the event, also in the link text)',
  `event_item_content2` text DEFAULT NULL COMMENT 'extra content',
  `event_item_content3` text DEFAULT NULL COMMENT 'extra content',
  `event_item_content4` text DEFAULT NULL COMMENT 'extra content',
  `event_item_lang` varchar(150) DEFAULT NULL COMMENT '(e.g. - event_created_invoice found in the lang file )',
  `event_item_lang_alt` varchar(150) DEFAULT NULL COMMENT 'Example: Fred posted a comment (as opposed to) You posed a comment',
  `event_parent_type` varchar(150) DEFAULT NULL COMMENT 'used to identify the parent up the tree (e.g. for a task, parent is project) (.e.g. for a task comment, parent is task)',
  `event_parent_id` varchar(150) DEFAULT NULL COMMENT 'id of the parent item (e.g project_id)',
  `event_parent_title` varchar(150) DEFAULT NULL COMMENT 'e.g. task title',
  `event_show_item` varchar(150) DEFAULT 'yes' COMMENT 'yes|no (if the item should be shown in the notifications dopdown)',
  `event_show_in_timeline` varchar(150) DEFAULT 'yes' COMMENT 'yes|no (if this should show the project timeline)',
  `event_notification_category` varchar(150) DEFAULT NULL COMMENT '(e.g. notifications_new_invoice) This determins if a user will get a web notification, an email, both, or none. As per the settings in the [user] table and the login in the [eventTrackingRepo)',
  `eventresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] project | ticket | lead (e.g. if you want the event to show in the project timeline, then eventresource_type  must be set to project)',
  `eventresource_id` int(11) DEFAULT NULL COMMENT '[polymorph] e.g project_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `events_tracking`
--

CREATE TABLE `events_tracking` (
  `eventtracking_id` int(11) NOT NULL,
  `eventtracking_created` datetime NOT NULL,
  `eventtracking_updated` datetime NOT NULL,
  `eventtracking_eventid` int(11) NOT NULL,
  `eventtracking_userid` int(11) NOT NULL,
  `eventtracking_status` varchar(30) DEFAULT 'unread' COMMENT 'read|unread',
  `eventtracking_email` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `eventtracking_source` varchar(50) DEFAULT NULL COMMENT 'the actual item (e.g. file | comment | invoice)',
  `eventtracking_source_id` varchar(50) DEFAULT NULL COMMENT 'the id of the actual item',
  `parent_type` varchar(50) DEFAULT NULL COMMENT 'used to locate the main event in the events table. Also used for marking the event as read, once the parent has been viewed. (e.g. for invoice, parent is invoice. For comment task, parent is task)',
  `parent_id` int(11) DEFAULT NULL,
  `resource_type` varchar(50) DEFAULT NULL COMMENT 'Also used for marking events as read, for ancillary items like (project comments, project file) where just viewing a project is enough',
  `resource_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_created` date DEFAULT NULL,
  `expense_updated` date DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `expense_clientid` int(11) DEFAULT NULL,
  `expense_projectid` int(11) DEFAULT NULL,
  `expense_creatorid` int(11) NOT NULL,
  `expense_categoryid` int(11) NOT NULL DEFAULT 7,
  `expense_amount` decimal(10,2) NOT NULL,
  `expense_description` text DEFAULT NULL,
  `expense_type` text DEFAULT NULL COMMENT 'business|client',
  `expense_billable` varchar(30) DEFAULT 'not_billable' COMMENT 'billable | not_billable',
  `expense_billing_status` varchar(30) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `expense_billable_invoiceid` int(11) DEFAULT NULL COMMENT 'id of the invoice that it has been billed to'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `file_uniqueid` varchar(100) DEFAULT NULL,
  `file_upload_unique_key` varchar(100) DEFAULT NULL COMMENT 'used to idetify files that were uploaded in one go',
  `file_created` datetime DEFAULT NULL,
  `file_updated` datetime DEFAULT NULL,
  `file_creatorid` int(11) DEFAULT NULL,
  `file_clientid` int(11) DEFAULT NULL COMMENT 'optional',
  `file_filename` varchar(250) DEFAULT NULL,
  `file_directory` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_size` varchar(40) DEFAULT NULL COMMENT 'human readable file size',
  `file_type` varchar(20) DEFAULT NULL COMMENT 'image|file',
  `file_thumbname` varchar(250) DEFAULT NULL COMMENT 'optional',
  `file_visibility_client` varchar(5) DEFAULT 'yes' COMMENT 'yes | no',
  `fileresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] project',
  `fileresource_id` int(11) DEFAULT NULL COMMENT '[polymorph] e.g project_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `bill_invoiceid` int(11) NOT NULL,
  `bill_created` datetime DEFAULT NULL,
  `bill_updated` datetime DEFAULT NULL,
  `bill_date_sent_to_customer` date DEFAULT NULL COMMENT 'the date an invoice was published or lasts emailed to the customer',
  `bill_clientid` int(11) NOT NULL,
  `bill_projectid` int(11) DEFAULT NULL COMMENT 'optional',
  `bill_subscriptionid` int(11) DEFAULT NULL COMMENT 'optional',
  `bill_creatorid` int(11) NOT NULL,
  `bill_categoryid` int(11) NOT NULL DEFAULT 4,
  `bill_date` date NOT NULL,
  `bill_due_date` date DEFAULT NULL,
  `bill_subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `bill_discount_type` varchar(30) DEFAULT 'none' COMMENT 'amount | percentage | none',
  `bill_discount_percentage` decimal(10,2) DEFAULT 0.00 COMMENT 'actual amount or percentage',
  `bill_discount_amount` decimal(10,2) DEFAULT 0.00,
  `bill_amount_before_tax` decimal(10,2) DEFAULT 0.00,
  `bill_tax_type` varchar(20) DEFAULT 'summary' COMMENT 'summary|lineitem|none',
  `bill_tax_total_percentage` decimal(10,2) DEFAULT 0.00 COMMENT 'percentage',
  `bill_tax_total_amount` decimal(10,2) DEFAULT 0.00 COMMENT 'amount',
  `bill_final_amount` decimal(10,2) DEFAULT 0.00,
  `bill_notes` text DEFAULT NULL,
  `bill_terms` text DEFAULT NULL,
  `bill_status` varchar(50) NOT NULL DEFAULT 'draft' COMMENT 'draft | due | overdue | paid | part_paid',
  `bill_recurring` varchar(50) DEFAULT 'no' COMMENT 'yes|no',
  `bill_recurring_duration` int(11) DEFAULT NULL COMMENT 'e.g. 20 (for 20 days)',
  `bill_recurring_period` varchar(30) DEFAULT NULL COMMENT 'day | week | month | year',
  `bill_recurring_cycles` int(11) DEFAULT NULL COMMENT '0 for infinity',
  `bill_recurring_cycles_counter` int(11) DEFAULT NULL COMMENT 'number of times it has been renewed',
  `bill_recurring_last` date DEFAULT NULL COMMENT 'date when it was last renewed',
  `bill_recurring_next` date DEFAULT NULL COMMENT 'date when it will next be renewed',
  `bill_recurring_child` varchar(5) DEFAULT 'no' COMMENT 'yes|no',
  `bill_recurring_parent_id` int(11) DEFAULT NULL COMMENT 'if it was generated from a recurring invoice, the id of parent invoice',
  `bill_overdue_reminder_sent` varchar(5) DEFAULT '' COMMENT 'yes | no',
  `bill_invoice_type` varchar(30) DEFAULT 'onetime' COMMENT 'onetime | subscription',
  `bill_type` varchar(20) DEFAULT 'invoice' COMMENT 'invoice|estimate',
  `bill_visibility` varchar(20) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent invoices that are still being cloned from showing in invoices list)',
  `bill_cron_status` varchar(20) DEFAULT 'none' COMMENT 'none|processing|completed|error  (used to prevent collisions when recurring invoiced)',
  `bill_cron_date` datetime DEFAULT NULL COMMENT 'date when cron was run'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_created` datetime DEFAULT NULL,
  `item_updated` datetime DEFAULT NULL,
  `item_categoryid` int(11) NOT NULL DEFAULT 8,
  `item_creatorid` int(11) NOT NULL,
  `item_description` varchar(250) DEFAULT NULL,
  `item_unit` varchar(50) DEFAULT NULL,
  `item_rate` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `kb_categories`
--

CREATE TABLE `kb_categories` (
  `kbcategory_id` int(11) NOT NULL,
  `kbcategory_created` datetime NOT NULL,
  `kbcategory_updated` datetime NOT NULL,
  `kbcategory_creatorid` int(11) NOT NULL,
  `kbcategory_title` varchar(250) NOT NULL,
  `kbcategory_description` text DEFAULT NULL,
  `kbcategory_position` int(11) DEFAULT NULL,
  `kbcategory_visibility` varchar(50) DEFAULT 'everyone' COMMENT 'everyone | team | client',
  `kbcategory_slug` varchar(250) DEFAULT NULL,
  `kbcategory_icon` varchar(250) DEFAULT NULL,
  `kbcategory_system_default` varchar(250) DEFAULT 'no' COMMENT 'yes | no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

--
-- Dumping data for table `kb_categories`
--

INSERT INTO `kb_categories` (`kbcategory_id`, `kbcategory_created`, `kbcategory_updated`, `kbcategory_creatorid`, `kbcategory_title`, `kbcategory_description`, `kbcategory_position`, `kbcategory_visibility`, `kbcategory_slug`, `kbcategory_icon`, `kbcategory_system_default`) VALUES
(1, '2021-01-11 20:03:05', '2021-01-11 20:03:05', 0, 'Frequently Asked Questions', 'Answers to some of the most frequently asked questions', 1, 'everyone', '1-frequently-asked-questions', 'sl-icon-call-out', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `knowledgebase`
--

CREATE TABLE `knowledgebase` (
  `knowledgebase_id` int(11) NOT NULL,
  `knowledgebase_created` datetime NOT NULL,
  `knowledgebase_updated` datetime NOT NULL,
  `knowledgebase_creatorid` int(11) NOT NULL,
  `knowledgebase_categoryid` int(11) NOT NULL,
  `knowledgebase_title` varchar(250) NOT NULL,
  `knowledgebase_slug` varchar(250) DEFAULT NULL,
  `knowledgebase_text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `lead_id` int(11) NOT NULL,
  `lead_position` double NOT NULL,
  `lead_created` datetime DEFAULT NULL,
  `lead_updated` datetime DEFAULT NULL,
  `lead_creatorid` int(11) DEFAULT NULL,
  `lead_updatorid` int(11) DEFAULT NULL,
  `lead_categoryid` int(11) DEFAULT 3,
  `lead_firstname` varchar(100) DEFAULT NULL,
  `lead_lastname` varchar(100) DEFAULT NULL,
  `lead_email` varchar(150) DEFAULT NULL,
  `lead_phone` varchar(150) DEFAULT NULL,
  `lead_job_position` varchar(150) DEFAULT NULL,
  `lead_company_name` varchar(150) DEFAULT NULL,
  `lead_website` varchar(150) DEFAULT NULL,
  `lead_street` varchar(150) DEFAULT NULL,
  `lead_city` varchar(150) DEFAULT NULL,
  `lead_state` varchar(150) DEFAULT NULL,
  `lead_zip` varchar(150) DEFAULT NULL,
  `lead_country` varchar(150) DEFAULT NULL,
  `lead_source` varchar(150) DEFAULT NULL,
  `lead_title` varchar(250) DEFAULT NULL,
  `lead_description` text DEFAULT NULL,
  `lead_value` decimal(10,2) DEFAULT NULL,
  `lead_last_contacted` date DEFAULT NULL,
  `lead_converted` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `lead_converted_by_userid` int(11) DEFAULT NULL COMMENT 'id of user who converted',
  `lead_converted_date` datetime DEFAULT NULL COMMENT 'date lead converted',
  `lead_converted_clientid` int(11) DEFAULT NULL COMMENT 'if the lead has previously been converted to a client',
  `lead_status` tinyint(4) DEFAULT 1 COMMENT 'Deafult is id: 1 (leads_status) table',
  `lead_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `leads_assigned`
--

CREATE TABLE `leads_assigned` (
  `leadsassigned_id` int(11) NOT NULL,
  `leadsassigned_leadid` int(11) DEFAULT NULL,
  `leadsassigned_userid` int(11) DEFAULT NULL,
  `leadsassigned_created` datetime NOT NULL,
  `leadsassigned_updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `leads_sources`
--

CREATE TABLE `leads_sources` (
  `leadsources_id` int(11) NOT NULL,
  `leadsources_created` datetime NOT NULL,
  `leadsources_updated` datetime NOT NULL,
  `leadsources_creatorid` int(11) NOT NULL,
  `leadsources_title` varchar(200) NOT NULL COMMENT '[do not truncate] - good to have example sources like google'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `leads_status`
--

CREATE TABLE `leads_status` (
  `leadstatus_id` int(11) NOT NULL,
  `leadstatus_created` datetime DEFAULT NULL,
  `leadstatus_creatorid` int(11) DEFAULT NULL,
  `leadstatus_updated` datetime DEFAULT NULL,
  `leadstatus_title` varchar(200) NOT NULL,
  `leadstatus_position` int(11) NOT NULL,
  `leadstatus_color` varchar(100) NOT NULL DEFAULT 'default' COMMENT 'default|primary|success|info|warning|danger|lime|brown',
  `leadstatus_system_default` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[do not truncate]  expected to have 2 system default statuses (ID: 1 & 2) ''new'' & ''converted'' statuses ';

-- --------------------------------------------------------

--
-- Table structure for table `lineitems`
--

CREATE TABLE `lineitems` (
  `lineitem_id` int(11) NOT NULL,
  `lineitem_position` int(11) DEFAULT NULL,
  `lineitem_created` datetime DEFAULT NULL,
  `lineitem_updated` datetime DEFAULT NULL,
  `lineitem_description` varchar(250) DEFAULT NULL,
  `lineitem_rate` varchar(250) DEFAULT NULL,
  `lineitem_unit` varchar(100) DEFAULT NULL,
  `lineitem_quantity` float DEFAULT NULL,
  `lineitem_tax_rate` decimal(10,2) DEFAULT NULL,
  `lineitem_tax_amount` decimal(10,2) DEFAULT NULL,
  `lineitem_total` decimal(10,2) DEFAULT NULL,
  `lineitemresource_linked_type` varchar(30) DEFAULT NULL COMMENT 'task | expense',
  `lineitemresource_linked_id` int(11) DEFAULT NULL COMMENT 'e.g. task id',
  `lineitemresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] invoice | estimate',
  `lineitemresource_id` int(11) DEFAULT NULL COMMENT '[polymorph] e.g invoice_id',
  `lineitem_type` varchar(10) DEFAULT 'plain' COMMENT 'plain|time',
  `lineitem_time_hours` int(11) DEFAULT NULL,
  `lineitem_time_minutes` int(11) DEFAULT NULL,
  `lineitem_time_timers_list` text DEFAULT NULL COMMENT 'comma separated list of timers'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `milestone_id` int(11) NOT NULL,
  `milestone_created` datetime NOT NULL,
  `milestone_updated` datetime NOT NULL,
  `milestone_creatorid` int(11) NOT NULL,
  `milestone_title` varchar(250) NOT NULL DEFAULT 'uncategorised',
  `milestone_projectid` int(11) NOT NULL,
  `milestone_position` int(11) NOT NULL DEFAULT 1,
  `milestone_type` varchar(50) NOT NULL DEFAULT 'categorised' COMMENT 'categorised|uncategorised [1 uncategorised milestone if automatically created when a new project is created]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`milestone_id`, `milestone_created`, `milestone_updated`, `milestone_creatorid`, `milestone_title`, `milestone_projectid`, `milestone_position`, `milestone_type`) VALUES
(1, '2021-03-21 21:32:58', '2021-03-21 21:32:58', 0, 'Planning', 1, 1, 'categorised'),
(2, '2021-03-21 21:32:58', '2021-03-21 21:32:58', 0, 'Design', 1, 1, 'categorised'),
(3, '2021-03-21 21:32:58', '2021-03-21 21:32:58', 0, 'Development', 1, 1, 'categorised'),
(4, '2021-03-21 21:32:58', '2021-03-21 21:32:58', 0, 'Testing', 1, 1, 'categorised'),
(5, '2021-03-21 21:32:58', '2021-03-21 21:32:58', 1, 'uncategorised', 1, 5, 'uncategorised'),
(6, '2021-03-22 18:03:47', '2021-03-22 18:03:47', 0, 'Planning', 2, 1, 'categorised'),
(7, '2021-03-22 18:03:47', '2021-03-22 18:03:47', 0, 'Design', 2, 1, 'categorised'),
(8, '2021-03-22 18:03:47', '2021-03-22 18:03:47', 0, 'Development', 2, 1, 'categorised'),
(9, '2021-03-22 18:03:47', '2021-03-22 18:03:47', 0, 'Testing', 2, 1, 'categorised'),
(10, '2021-03-22 18:03:47', '2021-03-22 18:03:47', 1, 'uncategorised', 2, 5, 'uncategorised'),
(11, '2021-03-22 18:05:18', '2021-03-22 18:05:18', 0, 'Planning', 3, 1, 'categorised'),
(12, '2021-03-22 18:05:18', '2021-03-22 18:05:18', 0, 'Design', 3, 1, 'categorised'),
(13, '2021-03-22 18:05:18', '2021-03-22 18:05:18', 0, 'Development', 3, 1, 'categorised'),
(14, '2021-03-22 18:05:18', '2021-03-22 18:05:18', 0, 'Testing', 3, 1, 'categorised'),
(15, '2021-03-22 18:05:18', '2021-03-22 18:05:18', 1, 'uncategorised', 3, 5, 'uncategorised'),
(16, '2021-03-22 18:08:16', '2021-03-22 18:08:16', 0, 'Planning', 4, 1, 'categorised'),
(17, '2021-03-22 18:08:16', '2021-03-22 18:08:16', 0, 'Design', 4, 1, 'categorised'),
(18, '2021-03-22 18:08:16', '2021-03-22 18:08:16', 0, 'Development', 4, 1, 'categorised'),
(19, '2021-03-22 18:08:16', '2021-03-22 18:08:16', 0, 'Testing', 4, 1, 'categorised'),
(20, '2021-03-22 18:08:16', '2021-03-22 18:08:16', 1, 'uncategorised', 4, 5, 'uncategorised'),
(21, '2021-03-22 18:09:56', '2021-03-22 18:09:56', 0, 'Planning', 5, 1, 'categorised'),
(22, '2021-03-22 18:09:56', '2021-03-22 18:09:56', 0, 'Design', 5, 1, 'categorised'),
(23, '2021-03-22 18:09:56', '2021-03-22 18:09:56', 0, 'Development', 5, 1, 'categorised'),
(24, '2021-03-22 18:09:56', '2021-03-22 18:09:56', 0, 'Testing', 5, 1, 'categorised'),
(25, '2021-03-22 18:09:56', '2021-03-22 18:09:56', 1, 'uncategorised', 5, 5, 'uncategorised'),
(26, '2021-03-24 20:37:47', '2021-03-24 20:37:47', 0, 'Planning', 6, 1, 'categorised'),
(27, '2021-03-24 20:37:47', '2021-03-24 20:37:47', 0, 'Design', 6, 1, 'categorised'),
(28, '2021-03-24 20:37:47', '2021-03-24 20:37:47', 0, 'Development', 6, 1, 'categorised'),
(29, '2021-03-24 20:37:47', '2021-03-24 20:37:47', 0, 'Testing', 6, 1, 'categorised'),
(30, '2021-03-24 20:37:47', '2021-03-24 20:37:47', 1, 'uncategorised', 6, 5, 'uncategorised');

-- --------------------------------------------------------

--
-- Table structure for table `milestone_categories`
--

CREATE TABLE `milestone_categories` (
  `milestonecategory_id` int(11) NOT NULL,
  `milestonecategory_created` datetime NOT NULL,
  `milestonecategory_updated` datetime NOT NULL,
  `milestonecategory_creatorid` int(11) NOT NULL,
  `milestonecategory_title` varchar(250) NOT NULL,
  `milestonecategory_position` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `milestone_categories`
--

INSERT INTO `milestone_categories` (`milestonecategory_id`, `milestonecategory_created`, `milestonecategory_updated`, `milestonecategory_creatorid`, `milestonecategory_title`, `milestonecategory_position`) VALUES
(1, '2020-11-26 08:59:44', '2020-11-26 08:59:44', 0, 'Planning', 1),
(2, '2020-11-26 08:59:44', '2020-11-26 08:59:44', 0, 'Design', 2),
(3, '2020-11-26 08:59:44', '2020-11-26 08:59:44', 0, 'Development', 3),
(4, '2020-11-26 08:59:44', '2020-11-26 08:59:44', 0, 'Testing', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `note_created` datetime DEFAULT NULL COMMENT 'always now()',
  `note_updated` datetime DEFAULT NULL,
  `note_creatorid` int(11) DEFAULT NULL,
  `note_title` varchar(250) DEFAULT NULL,
  `note_description` text DEFAULT NULL,
  `note_visibility` varchar(30) DEFAULT 'public' COMMENT 'private|public',
  `noteresource_type` varchar(50) DEFAULT NULL COMMENT '[polymorph] client | project | user | lead',
  `noteresource_id` int(11) DEFAULT NULL COMMENT '[polymorph] e.g project_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]. Notes are always private to the user who created them. They are never visible to anyone else';

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL COMMENT '[truncate]',
  `payment_created` datetime DEFAULT NULL,
  `payment_updated` datetime DEFAULT NULL,
  `payment_creatorid` int(11) DEFAULT NULL COMMENT '''0'' for system',
  `payment_date` date DEFAULT NULL,
  `payment_invoiceid` int(11) NOT NULL COMMENT 'invoice id',
  `payment_clientid` int(11) DEFAULT NULL,
  `payment_projectid` int(11) DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_transaction_id` varchar(100) DEFAULT NULL,
  `payment_gateway` varchar(100) DEFAULT NULL COMMENT 'paypal | stripe | cash | bank',
  `payment_notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `payment_sessions`
--

CREATE TABLE `payment_sessions` (
  `session_id` int(11) NOT NULL,
  `session_created` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `session_creatorid` int(11) DEFAULT NULL COMMENT 'user making the payment',
  `session_creator_fullname` varchar(150) DEFAULT NULL,
  `session_creator_email` varchar(150) DEFAULT NULL,
  `session_gateway_name` varchar(150) DEFAULT NULL COMMENT 'stripe | paypal | etc',
  `session_gateway_ref` varchar(150) DEFAULT NULL COMMENT 'Stripe - The checkout_session_id | Paypal -',
  `session_amount` decimal(10,2) DEFAULT NULL COMMENT 'amount of the payment',
  `session_invoices` varchar(250) DEFAULT NULL COMMENT '[currently] - single invoice id | [future] - comma seperated list of invoice id''s that are for this payment'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track payment sessions so that IPN/Webhook calls can be linked to the correct invoice. Cronjob can be used to cleanup this table for any records older than 72hrs';

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `project_created` datetime DEFAULT NULL,
  `project_updated` datetime DEFAULT NULL,
  `project_clientid` int(11) NOT NULL,
  `project_creatorid` int(11) NOT NULL COMMENT 'creator of the project',
  `project_categoryid` int(11) DEFAULT 1 COMMENT 'default category',
  `project_title` varchar(250) NOT NULL,
  `project_date_start` date NOT NULL,
  `project_date_due` date DEFAULT NULL,
  `project_description` text DEFAULT NULL,
  `project_status` varchar(50) NOT NULL DEFAULT 'not_started' COMMENT 'not_started | in_progress | on_hold | cancelled | completed',
  `project_progress` tinyint(3) DEFAULT 0,
  `project_billing_rate` decimal(10,2) DEFAULT 0.00,
  `project_billing_type` varchar(40) DEFAULT 'hourly' COMMENT 'hourly | fixed',
  `project_billing_estimated_hours` int(11) DEFAULT 0 COMMENT 'estimated hours',
  `project_billing_costs_estimate` decimal(10,2) DEFAULT 0.00,
  `project_progress_manually` varchar(10) DEFAULT 'no' COMMENT 'yes | no',
  `clientperm_tasks_view` varchar(10) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_tasks_collaborate` varchar(40) DEFAULT 'no' COMMENT 'yes | no',
  `clientperm_tasks_create` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_timesheets_view` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `clientperm_expenses_view` varchar(40) DEFAULT 'no' COMMENT 'yes | no',
  `assignedperm_milestone_manage` varchar(40) DEFAULT 'yes' COMMENT 'yes | no',
  `assignedperm_tasks_collaborate` varchar(40) DEFAULT NULL COMMENT 'yes | no',
  `project_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent projects that are still being cloned from showing in projects list)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `projects_assigned`
--

CREATE TABLE `projects_assigned` (
  `projectsassigned_id` int(11) NOT NULL COMMENT '[truncate]',
  `projectsassigned_projectid` int(11) DEFAULT NULL,
  `projectsassigned_userid` int(11) DEFAULT NULL,
  `projectsassigned_created` datetime DEFAULT NULL,
  `projectsassigned_updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `projects_manager`
--

CREATE TABLE `projects_manager` (
  `projectsmanager_id` int(11) NOT NULL,
  `projectsmanager_created` datetime NOT NULL,
  `projectsmanager_updated` datetime NOT NULL,
  `projectsmanager_projectid` int(11) NOT NULL,
  `projectsmanager_userid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_created` datetime DEFAULT NULL,
  `role_updated` datetime DEFAULT NULL,
  `role_system` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes | no (system roles cannot be deleted)',
  `role_type` varchar(10) NOT NULL COMMENT 'client|team',
  `role_name` varchar(100) NOT NULL,
  `role_clients` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_contacts` tinyint(4) NOT NULL COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_invoices` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_estimates` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_payments` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_items` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_tasks` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_tasks_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_projects` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_projects_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_projects_billing` varchar(20) NOT NULL DEFAULT '0' COMMENT 'none (0) | view (1) | view-add-edit (2)',
  `role_leads` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_leads_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_expenses` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_expenses_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_timesheets` int(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-delete (2)',
  `role_timesheets_scope` varchar(20) NOT NULL DEFAULT 'own' COMMENT 'own | global',
  `role_team` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_tickets` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_knowledgebase` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_manage_knowledgebase_categories` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_reports` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'none (0) | view (1) | view-add-edit (2) | view-edit-add-delete (3)',
  `role_assign_projects` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_assign_leads` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_assign_tasks` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `role_set_project_permissions` varchar(20) NOT NULL DEFAULT 'no' COMMENT 'yes|no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[do not truncate] [roles 1,2,3 required] [role 1 = admin] [role 2 = client] [role 3 = staff]';

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_created`, `role_updated`, `role_system`, `role_type`, `role_name`, `role_clients`, `role_contacts`, `role_invoices`, `role_estimates`, `role_payments`, `role_items`, `role_tasks`, `role_tasks_scope`, `role_projects`, `role_projects_scope`, `role_projects_billing`, `role_leads`, `role_leads_scope`, `role_expenses`, `role_expenses_scope`, `role_timesheets`, `role_timesheets_scope`, `role_team`, `role_tickets`, `role_knowledgebase`, `role_manage_knowledgebase_categories`, `role_reports`, `role_assign_projects`, `role_assign_leads`, `role_assign_tasks`, `role_set_project_permissions`) VALUES
(1, '2018-09-07 14:49:41', '2018-09-07 14:49:41', 'yes', 'team', 'Administrator', 3, 3, 3, 3, 3, 3, 3, 'global', 3, 'global', '2', 3, 'global', 3, 'global', 3, 'global', 3, 3, 3, 'yes', 3, 'yes', 'yes', 'yes', 'yes'),
(2, '2018-09-07 14:49:41', '2021-03-31 07:25:38', 'no', 'team', 'Staff', 1, 1, 0, 0, 1, 0, 3, 'own', 1, 'own', '0', 3, 'own', 3, 'own', 1, 'own', 1, 3, 1, 'no', 0, 'no', 'no', 'no', 'no'),
(5, '2018-09-07 14:49:41', '2018-09-07 14:49:41', 'yes', 'client', 'Client', 0, 3, 1, 1, 1, 0, 1, 'own', 1, 'own', '0', 0, 'own', 0, 'own', 1, 'own', 1, 2, 1, 'no', 0, 'no', 'no', 'no', 'no'),
(9, '2020-09-13 17:21:34', '2020-09-13 17:21:49', 'no', 'team', 'Accounting', 0, 0, 0, 0, 0, 0, 0, 'own', 0, 'own', '0', 0, 'own', 0, 'own', 0, 'own', 0, 0, 0, 'no', 0, 'no', 'no', 'no', 'no'),
(10, '2020-10-14 05:07:26', '2020-10-14 05:07:26', 'no', 'team', 'Management', 3, 3, 3, 3, 0, 3, 3, 'global', 3, 'own', '0', 3, 'global', 3, 'global', 2, 'global', 0, 3, 3, 'no', 0, 'yes', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(250) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `created_at`, `updated_at`, `last_activity`) VALUES
('y7YQ1lvT7ydsKPN06KT70vx0L5vwiRu9SZ7JO6j4', NULL, '92.118.160.45', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFc0enFaYlhsZktuWmJwYjNORktlZXhFTVJqMTVVUVg4cm1QVDlNUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639391356),
('UOwFoJgyL2o0IGchVTl0vxWRGRrRCPxADOMsiMpu', NULL, '185.27.99.135', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmxuT055WWwzNEJPUkxqbkhMNE56WW04QlRwcDZoSG05MnZaRmhjaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639398985),
('JBs9LRpBiEw5yCSpgAglqkpNBe3zhg7v16TjDvsO', NULL, '92.118.160.13', 'Go http package', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDZnWDlFSzRXejRBMUU4NDQwUXM1WmlCUVh1SDlYZGtldk1hT3pqYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639406163),
('S1bUKO38BZoAqEvrtUiKxhhQG0q8ej8EfQTa57jF', NULL, '20.212.3.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWo4Z3R5NVpNMHhGTVJPVXJsZWhDd3ByemZTZXdiRVVVZzhWUG9ZSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vbWFpbC5zZ21sLmNvbS5zZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', NULL, NULL, 1639422006),
('lD74ywC0EqdiQYVvIOtmV2n8qLolivLu5ntacRoG', NULL, '20.212.3.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzM2SFhoeU1HSW15eFJ0dXdpUEs3U3IxMEZLSjhQdHg1NmJnWEZYSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639426557),
('Y88YtXgrNJ9NhoNkuE7Nv1Wd6AmeY3ZsTPXEB153', NULL, '20.212.3.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmRYZHVVODVVVk9TckZsSGdQaTk1ek9VMzFObkk2akxFdWtrajRIRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639442919),
('2WUYvdIzjV6rUd7G1x7VoV0pZYdJhbeljK0qT2MZ', NULL, '172.104.40.160', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU1hNbHJ4aURVd1lZQ1dsZXB4T2VQQ0RkQ0JzVnZuWXdtV0hZRXNGcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639472469),
('dLPgs7WjLUWNp8SEJUuqTqRvGvubRcgj09cGHlHq', NULL, '34.77.162.30', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGRrSnBYRjhXN1RtSWI0ZXR6eEZwa2NncTBHTjdMZEIyYVJWejJQWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639527329),
('yPQJ1iiiwzgXELLPzjp0QrOsx7S5zr9Shg4FDRE5', NULL, '20.94.202.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0F2V2pFUzFkRlc5TEhZN0YzWUp0QU9TdFkyRUVRMmczMlBobWE3TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639545086),
('0MXBfsfq3U3xJOCODG2OzfYoccITonNF3bjvEh46', NULL, '173.252.107.17', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHZSdVdPdDJrdGIxMXh2aVZyTmxnUWZSa21GNHUxcjNXbFBJdlpGayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639097350),
('A9D2lQWpbRsB3p2uJ8zjbcTmCDNgrfswe4DaxtKN', NULL, '34.77.162.15', 'Expanse indexes the network perimeters of our customers. If you have any questions or concerns, please reach out to: scaninfo@expanseinc.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWs1Z3lUbkJmTm1NMHpLV2lMUWFxS1hWblU0UVBySEhJeDdRSVlmeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639098771),
('KsItL9KWjphfsxcxF0wz8NutGSIZSqyHUlpPXxvr', NULL, '138.246.253.15', 'quic-go-HTTP/3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib3l3VHl3MzltZFdsZ2JHRnBXUmZvdDJhT21WdXBmM0NlaHJHU0E1dyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639100705),
('XxUDnuGpsMdxoAIv8C3UBwDLXdyduO9ZGfZq0XIV', NULL, '172.104.40.160', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUnVPUGdoSjNtVk13OEJ3YzdyanFNdkxaVDVrMVA5R1lXS2JoU3dYUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639126900),
('bbzuJTdUlLK7co0T0wpndfOxKiBrffOpFWEwc2Sj', NULL, '35.182.113.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT25UNXRlWHlzWVU5SkdGbGtWQmppV0FTem1NTXRaeG1zdmxyNDYzMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639128634),
('lg0lR0HTQ9tuRHdsA80MwBjFRi7SRCVQzy1dZ95F', NULL, '91.208.197.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0) Gecko/20100101 Firefox/68.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1BOTG1nRno0NnU4dW53Q3d6T3BDYnFtc2Zja2Vmb1hsN3VtRHJtayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639205772),
('FnWjIPSzDVBe6BLKIQ3KHKOBSSS7aYlPn1jR18lJ', NULL, '52.32.235.173', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjNveEE2N1dIZGdSSUpzbTFZdW9KVXdBUGd6QkR3TlMyMHhhT2R4RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639225109),
('hzmLeTEVbsxqRywR860raGlDj2039k8wuIYDU98D', NULL, '34.222.107.239', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXJ0b2d4U3FUejNIY0JNYjFkRzNzNkRHY2NPYjk5UUVYSHlHaERMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639225131),
('CmmvX7GNl6aNINC0HEkyuN7x6utxETSX4ogFdGjT', NULL, '173.252.83.9', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXZDbzN4Y3QxNjlxWGZXRW5aeExUQzZTZXlmZUt3bGptVUdzenlQcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639227841),
('p7uFSK8Pqu2OkUjLg4nBdhOfj0c4tiqnJ1drNEKU', NULL, '172.104.40.160', '', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZXZKRlZZR1dORncwZlBWT3NMc3E3eGxpdXZVbGJEekI1Tk9YSUFSWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639299676),
('o0Ml4opqDteHEhfmN8rr6md26VkLDIzNLikrQAcO', NULL, '34.212.228.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNENJMmp4VjRJaFFsdmlPNHAwbEllSW5tMDhqeU8ydjRrUG1WV1BVbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639311206),
('i9ci2uHQCjRCuiwwGMxWZTkrShWC8Rc2Isd8gHIH', NULL, '52.36.81.206', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1RWZklXWHdSaU1zVmdHNDBldFhOTlBsRmtvU3NzM3FnQWxLSFduSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639311245),
('hHJhi8zW3K29ynqEaqfvW2RRn7wddtyRrIXXbXuU', NULL, '104.219.251.41', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYVNGUnRaQUdtblZhY0tLbjdzN1AydEk4cUJENUFraXNzTDJiMG40UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', NULL, NULL, 1639327593),
('C8bRjlGIEXzfKgSn3GdL4Xn9SUDXvBlqS8hgm6yB', NULL, '162.142.125.41', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejFWbE5BRzhRS3BsYVZPSGhza25qVHU1OHo4UTliSWRaUThzRFlMMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639343812),
('AVOlAHKVXLkrrL7pRiLypGwSxA0S5FQPSu8orG1z', NULL, '162.142.125.41', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkRVMk1obm9NZW1tanFIeE1xaG5wa0dMb2FaRERXY3N3NnRJd0dUUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639343812),
('CjUeLFy5IW0uoXAdAcat0z6EEYEOQGOZUTSRl2R4', NULL, '204.12.197.234', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTlMMGlIMFE5Tk5jaDQ5ZG45Q0hTNDB6NUFseGlUVmtPbnRNUWUwUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639362805),
('1ZsAl6BIGl7ycRQPXQvHbziwZfAT6tmaegMRSvYp', NULL, '204.12.197.234', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDNNa1kzdGM2NW5LY2cya3ZGMUJ2dDFaTU5ZZXVZaGlyejJpYVhZZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639362810),
('U8393GItbvWkOH29DyfraiYpn7KlXsyGlpTjlHiB', NULL, '185.217.198.159', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2825.16 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFQ4V2ljQzlQT25YaThRQVNnblpmY0F3TnF6eXFjYWF3djFXaldTUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vc2dtbC5jb20uc2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', NULL, NULL, 1639370272);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_created` datetime NOT NULL,
  `settings_updated` datetime NOT NULL,
  `settings_installation_date` datetime NOT NULL COMMENT 'date the system was setup',
  `settings_version` varchar(10) NOT NULL,
  `settings_purchase_code` varchar(200) DEFAULT NULL COMMENT 'codecanyon code',
  `settings_company_name` varchar(200) DEFAULT NULL,
  `settings_company_address_line_1` varchar(200) DEFAULT NULL,
  `settings_company_state` varchar(200) DEFAULT NULL,
  `settings_company_city` varchar(200) DEFAULT NULL,
  `settings_company_zipcode` varchar(200) DEFAULT NULL,
  `settings_company_country` varchar(200) DEFAULT NULL,
  `settings_company_telephone` varchar(200) DEFAULT NULL,
  `settings_clients_registration` varchar(200) DEFAULT NULL COMMENT 'enabled | disabled',
  `settings_clients_shipping_address` varchar(200) DEFAULT NULL COMMENT 'enabled | disabled',
  `settings_email_general_variables` text DEFAULT NULL COMMENT 'common variable displayed available in templates',
  `settings_email_from_address` varchar(200) DEFAULT NULL,
  `settings_email_from_name` varchar(200) DEFAULT NULL,
  `settings_email_server_type` varchar(200) DEFAULT NULL COMMENT 'smtp|sendmail',
  `settings_email_smtp_host` varchar(200) DEFAULT NULL,
  `settings_email_smtp_port` varchar(20) DEFAULT NULL,
  `settings_email_smtp_username` varchar(120) DEFAULT NULL,
  `settings_email_smtp_password` varchar(120) DEFAULT NULL,
  `settings_email_smtp_encryption` varchar(120) DEFAULT NULL COMMENT 'tls|ssl|starttls',
  `settings_estimates_default_terms_conditions` text DEFAULT NULL,
  `settings_estimates_prefix` varchar(50) DEFAULT NULL,
  `settings_features_billing` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled (invoice, payments, products)',
  `settings_features_leads` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_features_knowledgebase` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_features_estimates` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_features_expenses` varchar(50) DEFAULT 'enabled' COMMENT 'enabled|disabled',
  `settings_features_notes` varchar(50) DEFAULT NULL COMMENT 'enabled|disabled',
  `settings_files_max_size_mb` int(11) DEFAULT 300 COMMENT 'maximum size in MB',
  `settings_knowledgebase_article_ordering` varchar(50) DEFAULT 'name' COMMENT 'name-asc|name-desc|date-asc|date-desc',
  `settings_knowledgebase_allow_guest_viewing` varchar(50) DEFAULT 'no' COMMENT 'yes | no',
  `settings_knowledgebase_external_pre_body` text DEFAULT NULL COMMENT 'for use when viewing externally, as guest',
  `settings_knowledgebase_external_post_body` text DEFAULT NULL COMMENT 'for use when viewing externally, as guest',
  `settings_knowledgebase_external_header` text DEFAULT NULL COMMENT 'for use when viewing externally, as guest',
  `settings_system_timezone` varchar(100) DEFAULT NULL,
  `settings_system_date_format` varchar(50) DEFAULT NULL COMMENT 'd-m-Y | d/m/Y | m-d-Y | m/d/Y | Y-m-d | Y/m/d | Y-d-m | Y/d/m',
  `settings_system_datepicker_format` varchar(50) DEFAULT NULL COMMENT 'dd-mm-yyyy | mm-dd-yyyy',
  `settings_system_default_leftmenu` varchar(50) DEFAULT NULL COMMENT 'collapsed | open',
  `settings_system_default_statspanel` varchar(50) DEFAULT NULL COMMENT 'collapsed | open',
  `settings_system_pagination_limits` tinyint(4) DEFAULT NULL,
  `settings_system_kanban_pagination_limits` tinyint(4) DEFAULT NULL,
  `settings_system_currency_symbol` varchar(10) DEFAULT NULL,
  `settings_system_currency_position` varchar(10) DEFAULT NULL COMMENT 'left|right',
  `settings_system_decimal_separator` varchar(20) DEFAULT NULL,
  `settings_system_thousand_separator` varchar(20) DEFAULT NULL,
  `settings_system_close_modals_body_click` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_system_language_default` varchar(10) DEFAULT 'en' COMMENT 'english|french|etc',
  `settings_system_language_allow_users_to_change` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_system_logo_large_name` varchar(100) DEFAULT 'logo.jpg',
  `settings_system_logo_small_name` varchar(100) DEFAULT 'logo-small.jpg',
  `settings_system_logo_versioning` varchar(100) DEFAULT '1' COMMENT 'used to refresh logo when updated',
  `settings_system_javascript_versioning` varchar(100) DEFAULT '1',
  `settings_tags_allow_users_create` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_allow_private` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_allow_new_sources` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_leads_kanban_value` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_date_created` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_category` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_date_contacted` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_telephone` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_source` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_leads_kanban_email` varchar(10) DEFAULT NULL COMMENT 'show|hide',
  `settings_tasks_client_visibility` varchar(20) DEFAULT NULL COMMENT 'visible|invisible - used in create new task form on the checkbox ',
  `settings_tasks_billable` varchar(20) DEFAULT NULL COMMENT 'billable|not-billable - used in create new task form on the checkbox ',
  `settings_tasks_kanban_date_created` varchar(20) DEFAULT NULL COMMENT 'show|hide',
  `settings_tasks_kanban_date_due` varchar(20) DEFAULT NULL COMMENT 'show|hide',
  `settings_tasks_kanban_date_start` varchar(20) DEFAULT NULL COMMENT 'show|hide',
  `settings_tasks_kanban_priority` varchar(20) DEFAULT NULL COMMENT 'show|hide',
  `settings_tasks_kanban_client_visibility` varchar(20) DEFAULT NULL COMMENT 'show|hide',
  `settings_invoices_prefix` varchar(50) DEFAULT NULL,
  `settings_invoices_recurring_grace_period` smallint(6) DEFAULT NULL COMMENT 'Number of days for due date on recurring invoices. If set to zero, invoices will be given due date same as invoice date',
  `settings_invoices_default_terms_conditions` text DEFAULT NULL,
  `settings_projects_default_hourly_rate` decimal(10,2) DEFAULT 0.00 COMMENT 'default hourly rate for new projects',
  `settings_projects_allow_setting_permission_on_project_creation` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_files_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_files_upload` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_comments_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_comments_post` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_collaborate` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_tasks_create` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_timesheets_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_expenses_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_milestones_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_clientperm_assigned_view` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_assignedperm_milestone_manage` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_projects_assignedperm_tasks_collaborate` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_stripe_secret_key` varchar(150) DEFAULT NULL,
  `settings_stripe_public_key` varchar(150) DEFAULT NULL,
  `settings_stripe_webhooks_key` varchar(150) DEFAULT NULL COMMENT 'from strip dashboard',
  `settings_stripe_default_subscription_plan_id` varchar(150) DEFAULT NULL,
  `settings_stripe_currency` varchar(150) DEFAULT NULL,
  `settings_stripe_display_name` varchar(150) DEFAULT NULL COMMENT 'what customer will see on payment screen',
  `settings_stripe_status` varchar(30) DEFAULT NULL COMMENT 'enabled|disabled',
  `settings_paypal_email` varchar(150) DEFAULT NULL,
  `settings_paypal_currency` varchar(150) DEFAULT NULL,
  `settings_paypal_display_name` varchar(150) DEFAULT NULL COMMENT 'what customer will see on payment screen',
  `settings_paypal_mode` varchar(40) DEFAULT NULL COMMENT 'sandbox | live',
  `settings_paypal_status` varchar(40) DEFAULT NULL COMMENT 'enabled|disabled',
  `settings_bank_details` text DEFAULT NULL,
  `settings_bank_display_name` varchar(150) DEFAULT NULL COMMENT 'what customer will see on payment screen',
  `settings_bank_status` varchar(40) DEFAULT NULL COMMENT 'enabled|disabled',
  `settings_completed_check_email` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_expenses_billable_by_default` varchar(10) DEFAULT 'yes' COMMENT 'yes|no',
  `settings_tickets_edit_subject` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_tickets_edit_body` varchar(10) DEFAULT NULL COMMENT 'yes|no',
  `settings_theme_name` varchar(100) DEFAULT 'default' COMMENT 'default|darktheme',
  `settings_theme_head` text DEFAULT NULL,
  `settings_theme_body` text DEFAULT NULL,
  `settings_cronjob_has_run` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `settings_cronjob_last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_created`, `settings_updated`, `settings_installation_date`, `settings_version`, `settings_purchase_code`, `settings_company_name`, `settings_company_address_line_1`, `settings_company_state`, `settings_company_city`, `settings_company_zipcode`, `settings_company_country`, `settings_company_telephone`, `settings_clients_registration`, `settings_clients_shipping_address`, `settings_email_general_variables`, `settings_email_from_address`, `settings_email_from_name`, `settings_email_server_type`, `settings_email_smtp_host`, `settings_email_smtp_port`, `settings_email_smtp_username`, `settings_email_smtp_password`, `settings_email_smtp_encryption`, `settings_estimates_default_terms_conditions`, `settings_estimates_prefix`, `settings_features_billing`, `settings_features_leads`, `settings_features_knowledgebase`, `settings_features_estimates`, `settings_features_expenses`, `settings_features_notes`, `settings_files_max_size_mb`, `settings_knowledgebase_article_ordering`, `settings_knowledgebase_allow_guest_viewing`, `settings_knowledgebase_external_pre_body`, `settings_knowledgebase_external_post_body`, `settings_knowledgebase_external_header`, `settings_system_timezone`, `settings_system_date_format`, `settings_system_datepicker_format`, `settings_system_default_leftmenu`, `settings_system_default_statspanel`, `settings_system_pagination_limits`, `settings_system_kanban_pagination_limits`, `settings_system_currency_symbol`, `settings_system_currency_position`, `settings_system_decimal_separator`, `settings_system_thousand_separator`, `settings_system_close_modals_body_click`, `settings_system_language_default`, `settings_system_language_allow_users_to_change`, `settings_system_logo_large_name`, `settings_system_logo_small_name`, `settings_system_logo_versioning`, `settings_system_javascript_versioning`, `settings_tags_allow_users_create`, `settings_leads_allow_private`, `settings_leads_allow_new_sources`, `settings_leads_kanban_value`, `settings_leads_kanban_date_created`, `settings_leads_kanban_category`, `settings_leads_kanban_date_contacted`, `settings_leads_kanban_telephone`, `settings_leads_kanban_source`, `settings_leads_kanban_email`, `settings_tasks_client_visibility`, `settings_tasks_billable`, `settings_tasks_kanban_date_created`, `settings_tasks_kanban_date_due`, `settings_tasks_kanban_date_start`, `settings_tasks_kanban_priority`, `settings_tasks_kanban_client_visibility`, `settings_invoices_prefix`, `settings_invoices_recurring_grace_period`, `settings_invoices_default_terms_conditions`, `settings_projects_default_hourly_rate`, `settings_projects_allow_setting_permission_on_project_creation`, `settings_projects_clientperm_files_view`, `settings_projects_clientperm_files_upload`, `settings_projects_clientperm_comments_view`, `settings_projects_clientperm_comments_post`, `settings_projects_clientperm_tasks_view`, `settings_projects_clientperm_tasks_collaborate`, `settings_projects_clientperm_tasks_create`, `settings_projects_clientperm_timesheets_view`, `settings_projects_clientperm_expenses_view`, `settings_projects_clientperm_milestones_view`, `settings_projects_clientperm_assigned_view`, `settings_projects_assignedperm_milestone_manage`, `settings_projects_assignedperm_tasks_collaborate`, `settings_stripe_secret_key`, `settings_stripe_public_key`, `settings_stripe_webhooks_key`, `settings_stripe_default_subscription_plan_id`, `settings_stripe_currency`, `settings_stripe_display_name`, `settings_stripe_status`, `settings_paypal_email`, `settings_paypal_currency`, `settings_paypal_display_name`, `settings_paypal_mode`, `settings_paypal_status`, `settings_bank_details`, `settings_bank_display_name`, `settings_bank_status`, `settings_completed_check_email`, `settings_expenses_billable_by_default`, `settings_tickets_edit_subject`, `settings_tickets_edit_body`, `settings_theme_name`, `settings_theme_head`, `settings_theme_body`, `settings_cronjob_has_run`, `settings_cronjob_last_run`) VALUES
(1, '2020-11-26 08:59:44', '2021-05-28 07:34:35', '2021-01-11 20:03:05', '1.01', NULL, 'SGM', '15 Yishun Industrial Street 1 #01-08 Win 5', 'Singapore', 'Singapore', '768091', 'Singapore', '+6562508527', 'disabled', 'disabled', '{our_company_name}, {todays_date}, {email_signature}, {email_footer}, {dashboard_url}', 'info@example.com', 'Dashboard Inc', 'sendmail', NULL, NULL, NULL, NULL, NULL, '<p>Thank you for your business. We look forward to working with you on this project.</p>', 'EST-', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 'enabled', 5000, 'name-asc', 'no', NULL, NULL, NULL, 'Asia/Singapore', 'm-d-Y', 'mm-dd-yyyy', 'collapsed', 'expanded', 20, 10, '$', 'left', 'fullstop', 'comma', 'no', 'english', 'no', 'logo.png', 'logo-small.png', '1622157334', '1', 'yes', 'yes', 'yes', 'show', 'show', 'hide', 'show', 'show', 'hide', 'show', 'visible', 'billable', 'show', 'show', 'hide', 'show', 'show', 'INV-', 3, '<p>Thank you for your business.</p>', '0.00', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'yes', 'yes', 'yes', 'yes', NULL, NULL, NULL, NULL, 'USD', 'Credit Card', 'disabled', 'info@example.com', 'USD', 'Paypal', 'live', 'disabled', '<p><strong>This is just an example:</strong></p>\r\n<p><strong>Bank Name:</strong>&nbsp;ABCD</p>\r\n<p><strong>Account Name:</strong>&nbsp;ABCD</p>\r\n<p><strong>Account Number:</strong>&nbsp;ABCD</p>', 'Bank Transfer', 'disabled', 'yes', 'no', 'yes', 'yes', 'default', NULL, NULL, 'no', '2021-05-28 07:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_created` datetime DEFAULT NULL,
  `tag_updated` datetime DEFAULT NULL,
  `tag_creatorid` int(11) DEFAULT NULL,
  `tag_title` varchar(100) NOT NULL,
  `tag_visibility` varchar(50) NOT NULL DEFAULT 'user' COMMENT 'public | user  (public tags are only created via admin settings)',
  `tagresource_type` varchar(50) NOT NULL COMMENT '[polymorph] invoice | project | client | lead | task | estimate | ticket | contract | note',
  `tagresource_id` int(11) NOT NULL COMMENT '[polymorph] e.g project_id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_position` double NOT NULL COMMENT 'increment by 16384',
  `task_created` datetime DEFAULT NULL COMMENT 'always now()',
  `task_updated` datetime DEFAULT NULL,
  `task_creatorid` int(11) DEFAULT NULL,
  `task_clientid` int(11) DEFAULT NULL COMMENT 'optional',
  `task_projectid` int(11) DEFAULT NULL COMMENT 'project_id',
  `task_date_start` date DEFAULT NULL,
  `task_date_due` date DEFAULT NULL,
  `task_title` varchar(250) DEFAULT NULL,
  `task_description` text DEFAULT NULL,
  `task_client_visibility` varchar(100) DEFAULT 'yes',
  `task_milestoneid` int(11) DEFAULT NULL COMMENT 'new tasks must be set to the [uncategorised] milestone',
  `task_previous_status` varchar(100) DEFAULT 'new',
  `task_priority` varchar(100) NOT NULL DEFAULT 'normal' COMMENT 'normal | high | urgent',
  `task_status` varchar(100) NOT NULL DEFAULT 'new' COMMENT 'new | in_progress | testing | awaiting_feedback | completed',
  `task_billable` varchar(5) DEFAULT 'yes' COMMENT 'yes | no',
  `task_billable_status` varchar(20) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `task_billable_invoiceid` int(11) DEFAULT NULL COMMENT 'id of the invoice that it has been billed to',
  `task_billable_lineitemid` int(11) DEFAULT NULL COMMENT 'id of line item that was billed',
  `task_visibility` varchar(40) DEFAULT 'visible' COMMENT 'visible|hidden (used to prevent tasks that are still being cloned from showing in tasks list)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `tasks_assigned`
--

CREATE TABLE `tasks_assigned` (
  `tasksassigned_id` int(11) NOT NULL COMMENT '[truncate]',
  `tasksassigned_taskid` int(11) NOT NULL,
  `tasksassigned_userid` int(11) DEFAULT NULL,
  `tasksassigned_created` datetime DEFAULT NULL,
  `tasksassigned_updated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

--
-- Dumping data for table `tasks_assigned`
--

INSERT INTO `tasks_assigned` (`tasksassigned_id`, `tasksassigned_taskid`, `tasksassigned_userid`, `tasksassigned_created`, `tasksassigned_updated`) VALUES
(1, 3, 5, NULL, NULL),
(2, 7, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `tax_id` int(11) NOT NULL,
  `tax_taxrateid` int(11) NOT NULL COMMENT 'Reference to tax rates table',
  `tax_created` datetime NOT NULL,
  `tax_updated` datetime NOT NULL,
  `tax_name` varchar(100) DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `taxresource_type` varchar(50) DEFAULT NULL COMMENT 'invoice|estimate|lineitem',
  `taxresource_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `taxrates`
--

CREATE TABLE `taxrates` (
  `taxrate_id` int(11) NOT NULL,
  `taxrate_uniqueid` varchar(200) NOT NULL COMMENT 'Used in <js> for identification',
  `taxrate_created` datetime NOT NULL,
  `taxrate_updated` datetime NOT NULL,
  `taxrate_creatorid` int(11) NOT NULL,
  `taxrate_name` varchar(100) NOT NULL,
  `taxrate_value` decimal(10,2) NOT NULL,
  `taxrate_status` varchar(20) NOT NULL DEFAULT 'enabled' COMMENT 'enabled|disabled'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_created` datetime DEFAULT NULL,
  `ticket_updated` datetime DEFAULT NULL,
  `ticket_creatorid` int(11) NOT NULL,
  `ticket_categoryid` int(11) NOT NULL DEFAULT 9,
  `ticket_clientid` int(11) DEFAULT NULL,
  `ticket_projectid` int(11) DEFAULT NULL,
  `ticket_subject` varchar(250) DEFAULT NULL,
  `ticket_message` text DEFAULT NULL,
  `ticket_priority` varchar(50) NOT NULL DEFAULT 'normal' COMMENT 'normal | high | urgent',
  `ticket_last_updated` datetime DEFAULT NULL,
  `ticket_status` varchar(50) NOT NULL DEFAULT 'open' COMMENT 'open | on_hold | answered | closed'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `ticketreply_id` int(11) NOT NULL,
  `ticketreply_created` datetime NOT NULL,
  `ticketreply_updated` datetime NOT NULL,
  `ticketreply_creatorid` int(11) NOT NULL,
  `ticketreply_clientid` int(11) DEFAULT NULL,
  `ticketreply_ticketid` int(11) NOT NULL,
  `ticketreply_text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `timelines`
--

CREATE TABLE `timelines` (
  `timeline_id` int(11) NOT NULL,
  `timeline_eventid` int(11) NOT NULL,
  `timeline_resourcetype` varchar(50) DEFAULT NULL COMMENT 'invoices | projects | estimates | etc',
  `timeline_resourceid` int(11) DEFAULT NULL COMMENT 'the id of the item affected'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `timers`
--

CREATE TABLE `timers` (
  `timer_id` int(11) NOT NULL,
  `timer_created` datetime DEFAULT NULL,
  `timer_updated` datetime DEFAULT NULL,
  `timer_creatorid` int(11) DEFAULT NULL,
  `timer_started` int(11) DEFAULT NULL COMMENT 'unix time stam for when the timer was started',
  `timer_stopped` int(11) DEFAULT 0 COMMENT 'unix timestamp for when the timer was stopped',
  `timer_time` int(11) DEFAULT 0 COMMENT 'seconds',
  `timer_taskid` int(11) DEFAULT NULL,
  `timer_projectid` int(11) DEFAULT 0 COMMENT 'needed for repository filtering',
  `timer_clientid` int(11) DEFAULT 0 COMMENT 'needed for repository filtering',
  `timer_status` varchar(20) DEFAULT 'running' COMMENT 'running | stopped',
  `timer_billing_status` varchar(50) DEFAULT 'not_invoiced' COMMENT 'invoiced | not_invoiced',
  `timer_billing_invoiceid` int(11) DEFAULT NULL COMMENT 'invoice id, if billed'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL,
  `unit_created` datetime DEFAULT NULL,
  `unit_update` datetime DEFAULT NULL,
  `unit_creatorid` int(11) DEFAULT 1,
  `unit_name` varchar(50) NOT NULL,
  `unit_system_default` varchar(50) NOT NULL DEFAULT 'no' COMMENT 'yes|no',
  `unit_time_default` varchar(50) DEFAULT 'no' COMMENT 'yes|no (used to identify time unit)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate]';

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `update_id` int(11) NOT NULL,
  `update_created` datetime NOT NULL,
  `update_updated` datetime NOT NULL,
  `update_version` decimal(10,2) DEFAULT NULL,
  `update_mysql_filename` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tracks updates sql file execution';

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`update_id`, `update_created`, `update_updated`, `update_version`, `update_mysql_filename`) VALUES
(1, '2020-11-24 12:46:17', '2020-11-24 12:46:17', NULL, '1.01.sql'),
(2, '2020-11-24 12:51:17', '2020-11-24 12:51:17', NULL, '1.02.sql'),
(3, '2020-11-24 12:55:15', '2020-11-24 12:55:15', NULL, '1.10.sql');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL COMMENT 'date when acccount was deleted',
  `creatorid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL COMMENT 'for client users',
  `account_owner` varchar(10) DEFAULT 'no' COMMENT 'yes | no',
  `primary_admin` varchar(10) DEFAULT 'no' COMMENT 'yes | no (only 1 primary admin - created during setup)',
  `avatar_directory` varchar(100) DEFAULT NULL,
  `avatar_filename` varchar(100) DEFAULT NULL,
  `type` varchar(10) NOT NULL COMMENT 'client | team |contact',
  `status` varchar(20) DEFAULT 'active' COMMENT 'active|suspended|deleted',
  `role_id` int(11) NOT NULL DEFAULT 2 COMMENT 'for team users',
  `last_seen` datetime DEFAULT NULL,
  `theme` varchar(100) DEFAULT 'default',
  `last_ip_address` varchar(100) DEFAULT NULL,
  `social_facebook` varchar(200) DEFAULT NULL,
  `social_twitter` varchar(200) DEFAULT NULL,
  `social_linkedin` varchar(200) DEFAULT NULL,
  `social_github` varchar(200) DEFAULT NULL,
  `social_dribble` varchar(200) DEFAULT NULL,
  `pref_language` varchar(200) DEFAULT 'english' COMMENT 'english|french|etc',
  `pref_email_notifications` varchar(10) DEFAULT 'yes' COMMENT 'yes | no',
  `pref_leftmenu_position` varchar(50) DEFAULT 'collapsed' COMMENT 'collapsed | open',
  `pref_statspanel_position` varchar(50) DEFAULT 'collapsed' COMMENT 'collapsed | open',
  `pref_filter_own_tasks` varchar(50) DEFAULT 'no' COMMENT 'Show only a users tasks in the tasks list',
  `pref_filter_own_projects` varchar(50) DEFAULT 'no' COMMENT 'Show only a users projects in the projects list',
  `pref_filter_own_leads` varchar(50) DEFAULT 'no' COMMENT 'Show only a users projects in the leads list',
  `pref_view_tasks_layout` varchar(50) DEFAULT 'kanban' COMMENT 'list|kanban',
  `pref_view_leads_layout` varchar(50) DEFAULT 'kanban' COMMENT 'list|kanban',
  `remember_token` varchar(150) DEFAULT NULL,
  `forgot_password_token` varchar(150) DEFAULT NULL COMMENT 'random token',
  `forgot_password_token_expiry` datetime DEFAULT NULL,
  `force_password_change` varchar(10) DEFAULT 'no' COMMENT 'yes|no',
  `notifications_system` varchar(10) DEFAULT 'no' COMMENT 'no| yes | yes_email [everyone] NB: database defaults for all notifications are ''no'' actual values must be set in the settings config file',
  `notifications_new_project` varchar(10) DEFAULT 'no' COMMENT 'no| yes_email [client]',
  `notifications_projects_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [everyone]',
  `notifications_billing_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email |[team]',
  `notifications_new_assignement` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [team]',
  `notifications_leads_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email [team]',
  `notifications_tasks_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email  [everyone]',
  `notifications_tickets_activity` varchar(10) DEFAULT 'no' COMMENT 'no | yes | yes_email  [everyone]',
  `thridparty_stripe_customer_id` varchar(150) DEFAULT NULL COMMENT 'optional - when customer pays via ',
  `dashboard_access` varchar(150) DEFAULT 'yes' COMMENT 'yes|no',
  `welcome_email_sent` varchar(150) DEFAULT 'no' COMMENT 'yes|no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='[truncate] except user id 0 & 1';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created`, `updated`, `deleted`, `creatorid`, `email`, `password`, `first_name`, `last_name`, `phone`, `position`, `clientid`, `account_owner`, `primary_admin`, `avatar_directory`, `avatar_filename`, `type`, `status`, `role_id`, `last_seen`, `theme`, `last_ip_address`, `social_facebook`, `social_twitter`, `social_linkedin`, `social_github`, `social_dribble`, `pref_language`, `pref_email_notifications`, `pref_leftmenu_position`, `pref_statspanel_position`, `pref_filter_own_tasks`, `pref_filter_own_projects`, `pref_filter_own_leads`, `pref_view_tasks_layout`, `pref_view_leads_layout`, `remember_token`, `forgot_password_token`, `forgot_password_token_expiry`, `force_password_change`, `notifications_system`, `notifications_new_project`, `notifications_projects_activity`, `notifications_billing_activity`, `notifications_new_assignement`, `notifications_leads_activity`, `notifications_tasks_activity`, `notifications_tickets_activity`, `thridparty_stripe_customer_id`, `dashboard_access`, `welcome_email_sent`) VALUES
(1, '2021-01-11 20:04:18', '2021-06-25 12:34:47', NULL, 0, 'sales@cssdesign.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Johnathan', 'Tan', NULL, NULL, NULL, 'no', 'yes', NULL, NULL, 'team', 'active', 1, '2021-06-25 12:34:47', 'default', '27.104.245.144', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'open', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', 'Wa9UrsHrSFAnJnq9Z72zuxTk1AuZ35xYIhAMBN4YoF3BvSSL1ATwdjx73HC9', 'JATieuBlSGBzP7VVM3JjxXEfeOHXMvZARN2oc6As2bsg1hVTG8', '2021-01-15 09:10:03', 'no', 'yes_email', 'no', 'yes_email', 'yes_email', 'yes_email', 'yes_email', 'yes_email', 'yes_email', NULL, 'no', 'no'),
(2, NULL, '2021-05-28 11:09:51', NULL, NULL, 'ciayie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Chua', 'Cia Yie', '83748749', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 1, '2021-05-28 11:09:51', 'default', '49.206.44.196', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', 'Km2HJaWrhX3CX9tNg7UhrDQ8MEmZQ19fr2UG4EHt4PYtYxYKrlxDyLJ6BPSl', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(3, NULL, '2021-05-28 11:10:32', NULL, NULL, 'yankai@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ong', 'Yan Kai', '90260360', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 1, '2021-05-28 11:10:32', 'default', '49.206.44.196', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', 'EPTUtr1vwiEdRdBx8gMXdIY9JcYDNrpR28ipNDejwWTiAByHjg85XcJXbmIu', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(5, NULL, '2021-05-28 11:11:05', NULL, NULL, 'keegan@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Goh', 'Keegan', '98578091', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 1, '2021-05-28 11:11:05', 'default', '49.206.44.196', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', 'knYcuXBAXLEkCdXhqr8j2W5GjlbvMiDUfQqydpHUSS6M9nhpexwUeu5xpKPd', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(6, NULL, NULL, NULL, NULL, 'adrianquek@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Quek', 'Choon Sheong, Adrian', '90291914', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 1, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(7, NULL, NULL, NULL, NULL, 'cs@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Koey', 'Chee Seng', '86682223', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(8, NULL, '2021-05-28 11:12:19', NULL, NULL, 'jlee@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Lee', 'Rui Jin', '88693466', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, '2021-05-28 11:12:19', 'default', '49.206.44.196', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', '11rzkim0ic8kTVITndFFaRdvz2LKt9pskMRQam9p13XznUjJqzS6O4hGZMiS', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(9, NULL, NULL, NULL, NULL, 'bernardong@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ong', 'Mng Yeow, Bernard', NULL, NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(10, NULL, NULL, NULL, NULL, 'ben@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Pang', 'Jun Xi', '91122958', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(11, NULL, '2021-05-28 11:12:53', NULL, NULL, 'jessgoh@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Goh', 'Liang Fen, Jessica', '91147113', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, '2021-05-28 11:12:53', 'default', '49.206.44.196', NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'open', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', '0L7ef6WRYAlnsGWoTf9baybPFt22wNdI2IrtvT2icgUxwIJF6Zf1bQLE5b8y', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(12, NULL, NULL, NULL, NULL, 'nikki@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Goh', 'Char Xin', '83146959', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(13, NULL, NULL, NULL, NULL, 'jorrence@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Fung', 'Han Xian, Jorrence', '92314513', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(14, NULL, NULL, NULL, NULL, 'james@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Tan', 'Sheau Sheng, James', '92956506', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(15, NULL, NULL, NULL, NULL, 'lisen@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Tan', 'Li Sen', '91457369', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(16, NULL, NULL, NULL, NULL, 'jedd@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ong', 'Jian Sheng, Jeffery', '84882279', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(17, NULL, NULL, NULL, NULL, 'janelle@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Lee', 'Kee Jiun', '97854072', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(18, NULL, NULL, NULL, NULL, 'queenie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Siau', 'Qin Yee', '98753669', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(19, NULL, NULL, NULL, NULL, 'jacey@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ang', 'Jieh Jun', '92473402', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(20, NULL, NULL, NULL, NULL, 'gavin@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ong', 'Hui Yong', '86851556', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(21, NULL, NULL, NULL, NULL, 'jasperlee.sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Lee', 'Cong Zhi', '84211426', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(22, NULL, NULL, NULL, NULL, 'jerry@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Tan', 'Jian Xiong', '90723112', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(23, NULL, NULL, NULL, NULL, 'ciayie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Chua', 'Cia Yie', '83748749', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(24, NULL, NULL, NULL, NULL, 'yankai@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', 'Ong', 'Yan Kai', '90260360', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', NULL, NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no'),
(25, '2021-06-25 04:34:33', NULL, NULL, 1, 'jtyh89@gmail.com', '$2y$12$O5adeqGhp3F1Jd5e80f46.gSsgWxAm/4CsxJGKOZSg.icy3DwzwV2', 'jon', 'tan', '', NULL, NULL, 'no', 'no', NULL, NULL, 'team', 'active', 2, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, 'english', 'yes', 'collapsed', 'collapsed', 'no', 'no', 'no', 'kanban', 'kanban', '3BRZtogUNMWigHhTjRfXQfp9SyXSEapLn5GzXcB936VBPYgg8QF1OCunL9wP', NULL, NULL, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', NULL, 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `webhooks_id` int(11) NOT NULL,
  `webhooks_created` datetime NOT NULL,
  `webhooks_updated` datetime NOT NULL,
  `webhooks_gateway_name` varchar(100) DEFAULT NULL COMMENT 'stripe|paypal|etc',
  `webhooks_type` varchar(100) DEFAULT NULL COMMENT 'type of call, as sent by gateway',
  `webhooks_payment_type` varchar(30) DEFAULT NULL COMMENT 'onetime|subscription',
  `webhooks_payment_amount` decimal(10,2) DEFAULT NULL COMMENT '(optional)',
  `webhooks_payment_transactionid` varchar(150) DEFAULT NULL COMMENT 'payment transaction id',
  `webhooks_matching_reference` varchar(100) DEFAULT NULL COMMENT 'e.g. Stripe (checkout session id) | Paypal ( random string) that is used to match the webhook/ipn to the initial payment_session',
  `webhooks_matching_attribute` varchar(100) DEFAULT NULL COMMENT 'mainly used to record what is happening with a subscription (e.g cancelled|renewed)',
  `webhooks_payload` text DEFAULT NULL COMMENT '(optional) json payload',
  `webhooks_comment` text DEFAULT NULL COMMENT '(optional)',
  `webhooks_started_at` datetime DEFAULT NULL COMMENT 'when the cronjob started this webhook',
  `webhooks_completed_at` datetime DEFAULT NULL COMMENT 'when the cronjob completed this webhook',
  `webhooks_status` varchar(20) DEFAULT 'new' COMMENT 'new | processing | failed | completed   (set to processing by the cronjob, to avoid duplicate processing)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Record all actionable webhooks, for later execution by a cronjob';

-- --------------------------------------------------------

--
-- Table structure for table `xin_accommodations`
--

CREATE TABLE `xin_accommodations` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `address_line_1` tinytext NOT NULL,
  `address_line_2` tinytext DEFAULT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `accommodation_type` int(11) NOT NULL,
  `annual_value` decimal(13,2) DEFAULT NULL,
  `furnished_type` int(11) DEFAULT NULL,
  `rent_value` decimal(13,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_advance_salaries`
--

CREATE TABLE `xin_advance_salaries` (
  `advance_salary_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `month_year` varchar(255) NOT NULL,
  `advance_amount` varchar(255) NOT NULL,
  `one_time_deduct` varchar(50) NOT NULL,
  `monthly_installment` varchar(255) NOT NULL,
  `total_paid` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `is_deducted_from_salary` int(11) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_announcements`
--

CREATE TABLE `xin_announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `company_id` int(111) NOT NULL,
  `location_id` int(11) NOT NULL,
  `department_id` int(111) NOT NULL,
  `published_by` int(111) DEFAULT NULL,
  `summary` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `is_active` tinyint(20) DEFAULT NULL,
  `is_notify` int(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_announcements`
--

INSERT INTO `xin_announcements` (`announcement_id`, `title`, `start_date`, `end_date`, `company_id`, `location_id`, `department_id`, `published_by`, `summary`, `description`, `is_active`, `is_notify`, `created_at`) VALUES
(8, 'TItle', '2022-05-01', '2022-05-30', 1, 1, 3, NULL, 'summary', 'Description', NULL, NULL, '2022-05-27 11:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `xin_appendix8a_submission`
--

CREATE TABLE `xin_appendix8a_submission` (
  `id` int(11) NOT NULL,
  `efiling_id` int(11) NOT NULL,
  `submission_key` varchar(256) DEFAULT NULL,
  `basis_year` year(4) NOT NULL,
  `no_of_records` int(11) DEFAULT NULL,
  `total_accommodation` decimal(13,2) DEFAULT NULL,
  `total_utilities_housekeeping` decimal(13,2) DEFAULT NULL,
  `total_hotel_accommodation` decimal(13,2) DEFAULT NULL,
  `total_other_benefits` decimal(13,2) DEFAULT NULL,
  `ap8a_file` varchar(128) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `submission_reference` varchar(256) DEFAULT NULL,
  `status_code` varchar(45) DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_appendix8b_submission`
--

CREATE TABLE `xin_appendix8b_submission` (
  `id` int(11) NOT NULL,
  `efiling_id` int(11) NOT NULL,
  `submission_key` varchar(256) NOT NULL,
  `basis_year` year(4) NOT NULL,
  `no_of_records` int(11) NOT NULL,
  `total_gross_amount_eebr` decimal(13,2) DEFAULT NULL,
  `total_gross_amount_eris_sme` decimal(13,2) DEFAULT NULL,
  `total_gross_amount_eris_corp` decimal(13,2) DEFAULT NULL,
  `total_gross_amount_eris_startup` decimal(13,2) DEFAULT NULL,
  `ap8b_file` varchar(128) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `submission_reference` varchar(256) DEFAULT NULL,
  `status_code` varchar(45) DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_assets`
--

CREATE TABLE `xin_assets` (
  `assets_id` int(111) NOT NULL,
  `assets_category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_asset_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_date` varchar(255) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `warranty_end_date` varchar(255) NOT NULL,
  `asset_note` text NOT NULL,
  `asset_image` varchar(255) NOT NULL,
  `is_working` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_assets_categories`
--

CREATE TABLE `xin_assets_categories` (
  `assets_category_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_attendance_time`
--

CREATE TABLE `xin_attendance_time` (
  `time_attendance_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `attendance_date` varchar(255) NOT NULL,
  `clock_in` varchar(255) NOT NULL,
  `clock_in_ip_address` varchar(255) NOT NULL,
  `clock_out` varchar(255) NOT NULL,
  `clock_out_ip_address` varchar(255) NOT NULL,
  `clock_in_out` varchar(255) NOT NULL,
  `clock_in_latitude` varchar(150) NOT NULL,
  `clock_in_longitude` varchar(150) NOT NULL,
  `clock_out_latitude` varchar(150) NOT NULL,
  `clock_out_longitude` varchar(150) NOT NULL,
  `time_late` varchar(255) NOT NULL,
  `early_leaving` varchar(255) NOT NULL,
  `overtime` varchar(255) NOT NULL,
  `total_work` varchar(255) NOT NULL,
  `total_rest` varchar(255) NOT NULL,
  `attendance_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_attendance_time`
--

INSERT INTO `xin_attendance_time` (`time_attendance_id`, `employee_id`, `attendance_date`, `clock_in`, `clock_in_ip_address`, `clock_out`, `clock_out_ip_address`, `clock_in_out`, `clock_in_latitude`, `clock_in_longitude`, `clock_out_latitude`, `clock_out_longitude`, `time_late`, `early_leaving`, `overtime`, `total_work`, `total_rest`, `attendance_status`) VALUES
(1, 4, '2021-01-15', '2021-01-15 15:09:09', '128.106.78.133', '', '', '1', '1.4379962', '103.8448215', '', '', '2021-01-15 15:09:09', '2021-01-15 15:09:09', '2021-01-15 15:09:09', '', '', 'Present'),
(2, 23, '2021-01-19', '2021-01-19 15:10:26', '128.106.78.133', '2021-01-19 15:11:02', '128.106.78.133', '0', '1.4380316', '103.8447581', '1.4380316', '103.8447581', '2021-01-19 15:10:26', '2021-01-19 15:11:02', '2021-01-19 15:11:02', '0:0', '', 'Present'),
(3, 17, '2021-01-19', '2021-01-19 15:10:43', '128.106.78.133', '2021-01-19 15:10:48', '128.106.78.133', '0', '1.4380316', '103.8447581', '1.4380316', '103.8447581', '2021-01-19 15:10:43', '2021-01-19 15:10:48', '2021-01-19 15:10:48', '0:0', '', 'Present'),
(4, 16, '2021-01-25', '2021-01-25 10:14:55', '128.106.78.133', '2021-01-25 10:15:24', '119.56.110.128', '0', '1.4380114748706185', '103.84495276719251', '1.4380807125470538', '103.84490180330435', '2021-01-25 10:14:55', '2021-01-25 10:15:24', '2021-01-25 10:15:24', '0:0', '', 'Present'),
(5, 16, '2021-01-25', '2021-01-25 10:15:28', '119.56.110.128', '2021-02-25 12:24:02', '119.56.96.99', '0', '1.438064638666342', '103.84485225147674', '1.438090723193624', '103.84490926245753', '2021-01-25 10:15:28', '2021-02-25 12:24:02', '2021-02-25 12:24:02', '0:0', '0:0', 'Present'),
(6, 13, '2021-01-25', '2021-01-25 10:17:40', '119.56.103.196', '2021-01-25 18:32:46', '119.56.110.16', '0', '1.4379579575452637', '103.84479176891114', '1.4379951582842272', '103.84485341913376', '2021-01-25 10:17:40', '2021-01-25 18:32:46', '2021-01-25 18:32:46', '8:15', '', 'Present'),
(7, 15, '2021-01-25', '2021-01-25 14:31:04', '128.106.78.133', '2021-01-25 14:31:27', '128.106.78.133', '0', '1.4379179733183034', '103.8449634709237', '1.4379220003261188', '103.84497154306672', '2021-01-25 14:31:04', '2021-01-25 14:31:27', '2021-01-25 14:31:27', '0:0', '', 'Present'),
(8, 10, '2021-01-25', '2021-01-25 16:34:14', '128.106.78.133', '2021-01-25 16:34:20', '128.106.78.133', '0', '1.4380224', '103.8447721', '1.4380224', '103.8447721', '2021-01-25 16:34:14', '2021-01-25 16:34:20', '2021-01-25 16:34:20', '0:0', '', 'Present'),
(9, 10, '2021-01-25', '2021-01-25 17:59:09', '128.106.78.133', '2021-01-25 17:59:31', '128.106.78.133', '0', '1.4380265', '103.8447778', '1.4379988', '103.8448379', '2021-01-25 17:59:09', '2021-01-25 17:59:31', '2021-01-25 17:59:31', '0:0', '1:24', 'Present'),
(10, 11, '2021-01-25', '2021-01-25 18:38:01', '128.106.78.133', '2021-01-25 18:38:11', '128.106.78.133', '0', '1.4378161741687554', '103.84491523331214', '1.437791567129832', '103.84489944151792', '2021-01-25 18:38:01', '2021-01-25 18:38:11', '2021-01-25 18:38:11', '0:0', '', 'Present'),
(11, 11, '2021-01-25', '2021-01-25 18:38:26', '128.106.78.133', '2021-01-25 18:38:30', '128.106.78.133', '0', '1.4378769025612248', '103.84486754070606', '1.4379922750097145', '103.8449543670808', '2021-01-25 18:38:26', '2021-01-25 18:38:30', '2021-01-25 18:38:30', '0:0', '0:0', 'Present'),
(12, 11, '2021-01-25', '2021-01-25 18:57:50', '111.65.46.132', '2021-01-25 18:57:52', '111.65.46.132', '0', '1.438706501626358', '103.84467900137065', '1.438706501626358', '103.84467900137065', '2021-01-25 18:57:50', '2021-01-25 18:57:52', '2021-01-25 18:57:52', '0:0', '0:19', 'Present'),
(13, 11, '2021-01-25', '2021-01-25 19:00:53', '128.106.78.133', '2021-01-25 19:00:57', '128.106.78.133', '0', '1.4375723157450773', '103.84472111922034', '1.437857436102552', '103.84503309538401', '2021-01-25 19:00:53', '2021-01-25 19:00:57', '2021-01-25 19:00:57', '0:0', '0:3', 'Present'),
(14, 18, '2021-01-26', '2021-01-26 09:12:50', '128.106.78.133', '2021-01-26 22:18:37', '128.106.78.133', '0', '1.4381209571264284', '103.84480641496668', '1.437930901511118', '103.84499939768342', '2021-01-26 09:12:50', '2021-01-26 22:18:37', '2021-01-26 22:18:37', '13:5', '', 'Present'),
(15, 10, '2021-01-26', '2021-01-26 09:15:01', '128.106.78.133', '2021-01-26 18:39:31', '128.106.78.133', '0', '1.3781803', '103.7365833', '1.4380241', '103.8447469', '2021-01-26 09:15:01', '2021-01-26 18:39:31', '2021-01-26 18:39:31', '9:24', '', 'Present'),
(16, 19, '2021-01-26', '2021-01-26 09:33:40', '128.106.78.133', '2021-01-27 17:37:11', '111.65.46.105', '0', '1.437921274056391', '103.84499186337455', '1.4379343171359316', '103.8450052020277', '2021-01-26 09:33:40', '2021-01-27 17:37:11', '2021-01-27 17:37:11', '0:0', '', 'Present'),
(17, 23, '2021-01-26', '2021-01-26 09:48:48', '128.106.78.133', '2021-01-26 22:18:29', '128.106.78.133', '0', '1.438013', '103.8447491', '1.4380005', '103.8447588', '2021-01-26 09:48:48', '2021-01-26 22:18:29', '2021-01-26 22:18:29', '12:29', '', 'Present'),
(18, 11, '2021-01-26', '2021-01-26 09:51:00', '128.106.78.133', '2021-01-26 18:37:33', '128.106.78.133', '0', '1.4380484333713655', '103.84485197262069', '1.43787492745263', '103.8448989173847', '2021-01-26 09:51:00', '2021-01-26 18:37:33', '2021-01-26 18:37:33', '8:46', '', 'Present'),
(19, 13, '2021-01-26', '2021-01-26 09:52:11', '119.56.96.217', '2021-02-23 15:11:29', '119.56.97.87', '0', '1.438005689991622', '103.84468113891376', '1.4380072068681473', '103.84484086071339', '2021-01-26 09:52:11', '2021-02-23 15:11:29', '2021-02-23 15:11:29', '0:0', '', 'Present'),
(20, 24, '2021-01-26', '2021-01-26 09:58:15', '122.11.212.170', '2021-01-26 09:58:28', '122.11.212.170', '0', '1.4386071751394602', '103.84482255892894', '1.4385636463903202', '103.84466153843415', '2021-01-26 09:58:15', '2021-01-26 09:58:28', '2021-01-26 09:58:28', '0:0', '', 'Present'),
(21, 24, '2021-01-26', '2021-01-26 09:58:50', '122.11.212.170', '2021-01-26 09:59:05', '122.11.212.170', '0', '1.4385541405579214', '103.8444425989796', '1.4384421009933464', '103.84455984360552', '2021-01-26 09:58:50', '2021-01-26 09:59:05', '2021-01-26 09:59:05', '0:0', '0:0', 'Present'),
(22, 24, '2021-01-26', '2021-01-26 09:59:10', '122.11.212.170', '2021-01-26 09:59:49', '122.11.212.170', '0', '1.4384421009933464', '103.84455984360552', '1.4384421009933464', '103.84455984360552', '2021-01-26 09:59:10', '2021-01-26 09:59:49', '2021-01-26 09:59:49', '0:0', '0:0', 'Present'),
(23, 24, '2021-01-26', '2021-01-26 09:59:53', '122.11.212.170', '2021-01-26 10:04:04', '128.106.78.133', '0', '1.4385226761268504', '103.84491366065123', '1.438563900810453', '103.84485915898877', '2021-01-26 09:59:53', '2021-01-26 10:04:04', '2021-01-26 10:04:04', '0:4', '0:0', 'Present'),
(24, 24, '2021-01-26', '2021-01-26 10:04:09', '128.106.78.133', '2021-01-26 10:04:12', '128.106.78.133', '0', '1.437697282346606', '103.84482733662058', '1.4381447223238413', '103.84471281641474', '2021-01-26 10:04:09', '2021-01-26 10:04:12', '2021-01-26 10:04:12', '0:0', '0:0', 'Present'),
(25, 24, '2021-01-26', '2021-01-26 10:04:19', '128.106.78.133', '2021-01-26 10:04:23', '128.106.78.133', '0', '1.4381583895191183', '103.84470792061121', '1.4380214796274353', '103.8448808891766', '2021-01-26 10:04:19', '2021-01-26 10:04:23', '2021-01-26 10:04:23', '0:0', '0:0', 'Present'),
(26, 15, '2021-01-26', '2021-01-26 18:17:21', '183.90.36.111', '2021-01-26 18:17:26', '183.90.36.111', '0', '1.4381818329708802', '103.84477401799447', '1.4381818329708802', '103.84477401799447', '2021-01-26 18:17:21', '2021-01-26 18:17:26', '2021-01-26 18:17:26', '0:0', '', 'Present'),
(27, 10, '2021-01-27', '2021-01-27 09:21:33', '128.106.78.133', '2021-01-28 09:22:58', '128.106.78.133', '0', '1.4363188', '103.8446322', '1.43802', '103.8447444', '2021-01-27 09:21:33', '2021-01-28 09:22:58', '2021-01-28 09:22:58', '0:0', '', 'Present'),
(28, 18, '2021-01-27', '2021-01-27 09:23:02', '128.106.78.133', '2021-01-27 23:09:55', '128.106.78.133', '0', '1.4380294535993308', '103.84488819445876', '1.437943678720804', '103.84505799550033', '2021-01-27 09:23:02', '2021-01-27 23:09:55', '2021-01-27 23:09:55', '13:46', '', 'Present'),
(29, 21, '2021-01-27', '2021-01-27 09:29:03', '119.56.99.147', '2021-03-11 16:42:27', '118.200.94.12', '0', '1.437166', '103.8445735', '1.438061750682546', '103.84492755911748', '2021-01-27 09:29:03', '2021-03-11 16:42:27', '2021-03-11 16:42:27', '0:0', '', 'Present'),
(30, 23, '2021-01-27', '2021-01-27 09:57:43', '111.65.61.143', '2021-01-27 23:09:14', '128.106.78.133', '0', '1.4407128', '103.8387575', '1.4380045', '103.8447596', '2021-01-27 09:57:43', '2021-01-27 23:09:14', '2021-01-27 23:09:14', '13:11', '', 'Present'),
(31, 24, '2021-01-27', '2021-01-27 14:55:27', '128.106.78.133', '2021-02-19 18:27:45', '128.106.78.133', '0', '1.4381124097132731', '103.84484383504707', '1.4381636662656776', '103.84486405469877', '2021-01-27 14:55:27', '2021-02-19 18:27:45', '2021-02-19 18:27:45', '0:0', '', 'Present'),
(32, 11, '2021-01-27', '2021-01-27 18:41:05', '128.106.78.133', '2021-01-27 18:41:10', '128.106.78.133', '0', '1.438032195898549', '103.8449572299308', '1.4380208725869101', '103.84494790761413', '2021-01-27 18:41:05', '2021-01-27 18:41:10', '2021-01-27 18:41:10', '0:0', '', 'Present'),
(33, 10, '2021-01-28', '2021-01-28 09:23:14', '128.106.78.133', '2021-01-28 18:41:16', '128.106.78.133', '0', '1.4380286', '103.8447517', '1.4379997', '103.8447708', '2021-01-28 09:23:14', '2021-01-28 18:41:16', '2021-01-28 18:41:16', '9:18', '', 'Present'),
(34, 10, '2021-01-29', '2021-01-29 09:29:44', '128.106.78.133', '2021-01-29 20:44:10', '111.65.47.124', '0', '1.4374048', '103.8443656', '1.3669728', '103.8396126', '2021-01-29 09:29:44', '2021-01-29 20:44:10', '2021-01-29 20:44:10', '11:14', '', 'Present'),
(35, 24, '2021-02-19', '2021-02-19 20:39:17', '116.89.99.113', '2021-02-19 20:39:21', '116.89.99.113', '0', '1.3616376997327713', '103.95785174892646', '1.3616614024381264', '103.95788999203621', '2021-02-19 20:39:17', '2021-02-19 20:39:21', '2021-02-19 20:39:21', '0:0', '', 'Present'),
(36, 24, '2021-02-19', '2021-02-19 20:40:52', '116.89.99.113', '2021-02-19 20:40:56', '116.89.99.113', '0', '1.3616493035932258', '103.95787033446831', '1.3616395714644818', '103.95783429415236', '2021-02-19 20:40:52', '2021-02-19 20:40:56', '2021-02-19 20:40:56', '0:0', '0:1', 'Present'),
(37, 24, '2021-02-20', '2021-02-20 15:58:03', '128.106.78.133', '2021-02-20 15:58:15', '128.106.78.133', '0', '1.4379007853307275', '103.84493053179914', '1.4378912601734628', '103.84491503541716', '2021-02-20 15:58:03', '2021-02-20 15:58:15', '2021-02-20 15:58:15', '0:0', '', 'Present'),
(38, 24, '2021-02-20', '2021-02-20 15:58:17', '128.106.78.133', '2021-02-25 12:41:48', '122.11.212.166', '0', '1.4379034364813525', '103.84493425028667', '1.3043045967761406', '103.83652274088797', '2021-02-20 15:58:17', '2021-02-25 12:41:48', '2021-02-25 12:41:48', '0:0', '0:0', 'Present'),
(39, 11, '2021-02-23', '2021-02-23 15:01:09', '128.106.78.133', '2021-02-24 09:37:33', '111.65.32.206', '0', '1.4381782055022423', '103.84478286330493', '1.4378641068441453', '103.84500358818661', '2021-02-23 15:01:09', '2021-02-24 09:37:33', '2021-02-24 09:37:33', '0:0', '', 'Present'),
(40, 15, '2021-02-23', '2021-02-23 15:02:22', '183.90.36.193', '2021-02-23 22:45:20', '115.66.193.51', '0', '1.4380887182680782', '103.84489423959654', '1.4129225763413764', '103.83723411806966', '2021-02-23 15:02:22', '2021-02-23 22:45:20', '2021-02-23 22:45:20', '7:42', '', 'Present'),
(41, 13, '2021-02-23', '2021-02-23 15:11:40', '119.56.97.87', '2021-02-23 15:11:49', '119.56.97.87', '0', '1.438048313865452', '103.84478723257416', '1.4380888744820033', '103.8447443882065', '2021-02-23 15:11:40', '2021-02-23 15:11:49', '2021-02-23 15:11:49', '0:0', '', 'Present'),
(42, 13, '2021-02-23', '2021-02-23 15:11:57', '119.56.97.87', '2021-02-23 15:12:05', '119.56.97.87', '0', '1.4380407066077567', '103.84492593710041', '1.4380451301944457', '103.84483824714775', '2021-02-23 15:11:57', '2021-02-23 15:12:05', '2021-02-23 15:12:05', '0:0', '0:0', 'Present'),
(43, 13, '2021-02-23', '2021-02-23 15:12:12', '119.56.97.87', '2021-02-25 09:28:19', '119.56.103.148', '0', '1.4380162198643869', '103.84485098102184', '1.437687835263414', '103.84443355867171', '2021-02-23 15:12:12', '2021-02-25 09:28:19', '2021-02-25 09:28:19', '0:0', '0:0', 'Present'),
(44, 15, '2021-02-24', '2021-02-24 09:24:28', '183.90.36.193', '2021-02-24 18:46:11', '183.90.36.193', '0', '1.4361593981005072', '103.84215423400143', '1.4340691981336553', '103.841974901047', '2021-02-24 09:24:28', '2021-02-24 18:46:11', '2021-02-24 18:46:11', '9:21', '', 'Present'),
(45, 10, '2021-02-24', '2021-02-24 09:25:56', '118.200.94.12', '2021-02-24 18:56:30', '118.200.94.12', '0', '1.4374907', '103.8449945', '1.4379791', '103.8447436', '2021-02-24 09:25:56', '2021-02-24 18:56:30', '2021-02-24 18:56:30', '9:30', '', 'Present'),
(46, 11, '2021-02-24', '2021-02-24 09:37:58', '118.200.94.12', '2021-02-24 09:38:03', '118.200.94.12', '0', '1.4381295204081765', '103.84481900227043', '1.4380243107752941', '103.84491612680047', '2021-02-24 09:37:58', '2021-02-24 09:38:03', '2021-02-24 09:38:03', '0:0', '', 'Present'),
(47, 11, '2021-02-24', '2021-02-24 09:38:06', '118.200.94.12', '2021-02-24 15:02:52', '118.200.94.12', '0', '1.4380424891562842', '103.84490582297553', '1.4379685929192703', '103.84504066020594', '2021-02-24 09:38:06', '2021-02-24 15:02:52', '2021-02-24 15:02:52', '5:24', '0:0', 'Present'),
(48, 14, '2021-02-24', '2021-02-24 13:45:54', '111.65.45.245', '2021-02-24 18:32:43', '111.65.45.245', '0', '1.4379995', '103.8448305', '1.4380067', '103.8447442', '2021-02-24 13:45:54', '2021-02-24 18:32:43', '2021-02-24 18:32:43', '4:46', '', 'Present'),
(49, 11, '2021-02-24', '2021-02-24 15:02:55', '118.200.94.12', '2021-02-24 18:43:42', '118.200.94.12', '0', '1.437677146333139', '103.84510237474154', '1.4376908137785573', '103.84493626236213', '2021-02-24 15:02:55', '2021-02-24 18:43:42', '2021-02-24 18:43:42', '3:40', '0:0', 'Present'),
(50, 12, '2021-02-24', '2021-02-24 17:00:59', '118.200.241.224', '2021-02-24 17:01:06', '118.200.241.224', '0', '1.4150076', '103.827063', '1.4150076', '103.827063', '2021-02-24 17:00:59', '2021-02-24 17:01:06', '2021-02-24 17:01:06', '0:0', '', 'Present'),
(51, 12, '2021-02-24', '2021-02-24 17:01:08', '118.200.241.224', '2021-03-04 15:18:02', '118.200.94.12', '0', '1.4150076', '103.827063', '1.4380798426947896', '103.84485318513923', '2021-02-24 17:01:08', '2021-03-04 15:18:02', '2021-03-04 15:18:02', '0:0', '0:0', 'Present'),
(52, 14, '2021-02-25', '2021-02-25 08:53:10', '111.65.45.245', '2021-02-26 08:50:15', '111.65.45.245', '0', '1.4374083', '103.842515', '1.4350426', '103.8431822', '2021-02-25 08:53:10', '2021-02-26 08:50:15', '2021-02-26 08:50:15', '0:0', '', 'Present'),
(53, 11, '2021-02-25', '2021-02-25 09:15:33', '118.200.94.12', '2021-02-25 18:45:57', '118.200.94.12', '0', '1.4377888639061533', '103.84491119198668', '1.4377660462308468', '103.84485494142585', '2021-02-25 09:15:33', '2021-02-25 18:45:57', '2021-02-25 18:45:57', '9:30', '', 'Present'),
(54, 10, '2021-02-25', '2021-02-25 09:19:03', '118.200.94.12', '2021-02-25 18:45:38', '118.200.94.12', '0', '1.4379986', '103.8448537', '1.4379979', '103.8448027', '2021-02-25 09:19:03', '2021-02-25 18:45:38', '2021-02-25 18:45:38', '9:26', '', 'Present'),
(55, 15, '2021-02-25', '2021-02-25 09:21:59', '118.200.94.12', '2021-02-25 18:54:22', '183.90.36.193', '0', '1.4381710869502964', '103.84482995731487', '1.4300327748018153', '103.83544270797996', '2021-02-25 09:21:59', '2021-02-25 18:54:22', '2021-02-25 18:54:22', '9:32', '', 'Present'),
(56, 13, '2021-02-25', '2021-02-25 09:28:29', '119.56.103.148', '2021-02-27 10:04:15', '119.56.99.32', '0', '1.437687835263414', '103.84443355867171', '1.4379958656650174', '103.84484980867299', '2021-02-25 09:28:29', '2021-02-27 10:04:15', '2021-02-27 10:04:15', '0:0', '', 'Present'),
(57, 16, '2021-02-25', '2021-02-25 12:24:24', '119.56.96.99', '2021-02-25 18:54:19', '119.56.97.17', '0', '1.4379247213034263', '103.84496752250328', '1.4303033846199613', '103.83560209515966', '2021-02-25 12:24:24', '2021-02-25 18:54:19', '2021-02-25 18:54:19', '6:29', '', 'Present'),
(58, 14, '2021-02-26', '2021-02-26 08:50:25', '111.65.45.245', '2021-02-26 18:43:49', '111.65.45.245', '0', '1.4350426', '103.8431822', '1.4379992', '103.8447703', '2021-02-26 08:50:25', '2021-02-26 18:43:49', '2021-02-26 18:43:49', '9:53', '', 'Present'),
(59, 10, '2021-02-26', '2021-02-26 08:52:26', '111.65.45.245', '2021-03-01 09:16:45', '118.200.94.12', '0', '1.4379983', '103.8448695', '1.4380014', '103.8447521', '2021-02-26 08:52:26', '2021-03-01 09:16:45', '2021-03-01 09:16:45', '0:0', '', 'Present'),
(60, 16, '2021-02-26', '2021-02-26 09:12:45', '118.200.94.12', '2021-03-01 09:16:01', '118.200.94.12', '0', '1.4380905547179361', '103.84487533777747', '1.4378739185443676', '103.84488308960555', '2021-02-26 09:12:45', '2021-03-01 09:16:01', '2021-03-01 09:16:01', '0:0', '', 'Present'),
(61, 11, '2021-02-26', '2021-02-26 09:22:22', '118.200.94.12', '2021-02-26 09:24:08', '118.200.94.12', '0', '1.437751362004191', '103.84508613684564', '1.4378976800139682', '103.8449225750355', '2021-02-26 09:22:22', '2021-02-26 09:24:08', '2021-02-26 09:24:08', '0:1', '', 'Present'),
(62, 11, '2021-02-26', '2021-02-26 09:24:14', '118.200.94.12', '2021-02-26 10:07:43', '118.200.94.12', '0', '1.437864682813346', '103.84489720364202', '1.4380360469421332', '103.84492559138734', '2021-02-26 09:24:14', '2021-02-26 10:07:43', '2021-02-26 10:07:43', '0:43', '0:0', 'Present'),
(63, 15, '2021-02-26', '2021-02-26 10:07:24', '118.200.94.12', '2021-02-27 09:57:50', '118.200.94.12', '0', '1.4380686385371317', '103.84491174957446', '1.4380673634352237', '103.84483649912718', '2021-02-26 10:07:24', '2021-02-27 09:57:50', '2021-02-27 09:57:50', '0:0', '', 'Present'),
(64, 11, '2021-02-26', '2021-02-26 10:07:49', '118.200.94.12', '2021-02-26 18:36:41', '118.200.94.12', '0', '1.4380971017641124', '103.84490596113443', '1.437954993907008', '103.84502735609284', '2021-02-26 10:07:49', '2021-02-26 18:36:41', '2021-02-26 18:36:41', '8:28', '0:0', 'Present'),
(65, 18, '2021-02-26', '2021-02-26 14:18:42', '119.56.106.0', '2021-02-26 23:59:09', '138.75.160.96', '0', '1.433593957159895', '103.84159251074088', '1.3806589740194102', '103.90353492845087', '2021-02-26 14:18:42', '2021-02-26 23:59:09', '2021-02-26 23:59:09', '9:40', '', 'Present'),
(66, 23, '2021-02-26', '2021-02-26 14:19:41', '111.65.61.85', '2021-02-26 23:58:22', '116.89.2.170', '0', '1.4335612', '103.8419157', '1.4467607', '103.800405', '2021-02-26 14:19:41', '2021-02-26 23:58:22', '2021-02-26 23:58:22', '9:38', '', 'Present'),
(67, 14, '2021-02-27', '2021-02-27 09:29:25', '111.65.45.245', '2021-03-01 08:58:03', '111.65.45.221', '0', '1.4374398', '103.8433221', '1.4375117', '103.8430883', '2021-02-27 09:29:25', '2021-03-01 08:58:03', '2021-03-01 08:58:03', '0:0', '', 'Present'),
(68, 11, '2021-02-27', '2021-02-27 09:45:25', '118.200.94.12', '2021-03-01 09:27:28', '118.200.94.12', '0', '1.4381374043599098', '103.84484868908186', '1.437825448019605', '103.84486806014118', '2021-02-27 09:45:25', '2021-03-01 09:27:28', '2021-03-01 09:27:28', '0:0', '', 'Present'),
(69, 15, '2021-02-27', '2021-02-27 09:57:53', '118.200.94.12', '2021-02-28 09:37:23', '115.66.193.51', '0', '1.4380099079584143', '103.84487537014094', '1.4130780095671345', '103.83757378612883', '2021-02-27 09:57:53', '2021-02-28 09:37:23', '2021-02-28 09:37:23', '0:0', '', 'Present'),
(70, 13, '2021-02-27', '2021-02-27 10:04:37', '119.56.99.32', '2021-03-01 09:19:43', '119.56.97.148', '0', '1.4380817015909322', '103.8448251727281', '1.4379346085902798', '103.84485440529056', '2021-02-27 10:04:37', '2021-03-01 09:19:43', '2021-03-01 09:19:43', '0:0', '', 'Present'),
(71, 14, '2021-03-01', '2021-03-01 08:58:16', '111.65.45.221', '2021-03-01 18:49:00', '111.65.45.221', '0', '1.4375117', '103.8430883', '1.4357889', '103.8427253', '2021-03-01 08:58:16', '2021-03-01 18:49:00', '2021-03-01 18:49:00', '9:50', '', 'Present'),
(72, 16, '2021-03-01', '2021-03-01 09:16:06', '118.200.94.12', '2021-03-02 09:19:55', '119.56.110.56', '0', '1.4378566032478812', '103.84493514865804', '1.4371416059399311', '103.84310173957427', '2021-03-01 09:16:06', '2021-03-02 09:19:55', '2021-03-02 09:19:55', '0:0', '', 'Present'),
(73, 10, '2021-03-01', '2021-03-01 09:16:52', '118.200.94.12', '2021-03-01 19:30:45', '111.65.58.205', '0', '1.4380014', '103.8447521', '1.42942', '103.8731146', '2021-03-01 09:16:52', '2021-03-01 19:30:45', '2021-03-01 19:30:45', '10:13', '', 'Present'),
(74, 13, '2021-03-01', '2021-03-01 09:19:47', '119.56.97.148', '2021-03-02 09:18:50', '119.56.98.238', '0', '1.4379068692396735', '103.84482802292206', '1.437924219824512', '103.84480020933196', '2021-03-01 09:19:47', '2021-03-02 09:18:50', '2021-03-02 09:18:50', '0:0', '', 'Present'),
(75, 15, '2021-03-01', '2021-03-01 09:20:19', '118.200.94.12', '2021-03-02 09:19:55', '122.11.212.156', '0', '1.4379815872925403', '103.84488303329915', '1.436994274019372', '103.84292201742808', '2021-03-01 09:20:19', '2021-03-02 09:19:55', '2021-03-02 09:19:55', '0:0', '', 'Present'),
(76, 11, '2021-03-01', '2021-03-01 09:27:38', '118.200.94.12', '2021-03-01 09:28:14', '118.200.94.12', '0', '1.4377803861922478', '103.84490297589907', '1.4379310061917667', '103.84502313865528', '2021-03-01 09:27:38', '2021-03-01 09:28:14', '2021-03-01 09:28:14', '0:0', '', 'Present'),
(77, 11, '2021-03-01', '2021-03-01 09:28:17', '118.200.94.12', '2021-03-01 18:36:54', '118.200.94.12', '0', '1.4378820573961673', '103.84486218609013', '1.4380686821531379', '103.84483602811885', '2021-03-01 09:28:17', '2021-03-01 18:36:54', '2021-03-01 18:36:54', '9:8', '0:0', 'Present'),
(78, 19, '2021-03-01', '2021-03-01 09:30:11', '118.200.94.12', '2021-03-02 00:35:10', '115.66.108.153', '0', '1.4379300928267356', '103.84495640362798', '1.433370590035223', '103.78720874294126', '2021-03-01 09:30:11', '2021-03-02 00:35:10', '2021-03-02 00:35:10', '0:0', '', 'Present'),
(79, 23, '2021-03-01', '2021-03-01 09:40:41', '118.200.94.12', '2021-03-01 23:26:36', '118.200.94.12', '0', '1.437988', '103.8448867', '1.4379828', '103.8448962', '2021-03-01 09:40:41', '2021-03-01 23:26:36', '2021-03-01 23:26:36', '13:45', '', 'Present'),
(80, 18, '2021-03-01', '2021-03-01 09:44:24', '119.56.110.189', '2021-03-01 23:26:44', '118.200.94.12', '0', '1.4373741307308776', '103.84444489209046', '1.4379170478561405', '103.84496545146058', '2021-03-01 09:44:24', '2021-03-01 23:26:44', '2021-03-01 23:26:44', '13:42', '', 'Present'),
(81, 14, '2021-03-02', '2021-03-02 08:49:46', '111.65.46.70', '2021-03-02 18:30:19', '111.65.46.70', '0', '1.4373135', '103.8431979', '1.4379773', '103.84476', '2021-03-02 08:49:46', '2021-03-02 18:30:19', '2021-03-02 18:30:19', '9:40', '', 'Present'),
(82, 13, '2021-03-02', '2021-03-02 09:18:55', '119.56.98.238', '2021-03-03 09:27:06', '119.56.96.92', '0', '1.437963006686511', '103.84487906389006', '1.4380727703119112', '103.84487334763358', '2021-03-02 09:18:55', '2021-03-03 09:27:06', '2021-03-03 09:27:06', '0:0', '', 'Present'),
(83, 16, '2021-03-02', '2021-03-02 09:20:03', '119.56.110.56', '2021-03-08 09:26:28', '118.200.94.12', '0', '1.4370878555153999', '103.84315890832004', '1.4381885581655849', '103.84479913640553', '2021-03-02 09:20:03', '2021-03-08 09:26:28', '2021-03-08 09:26:28', '0:0', '', 'Present'),
(84, 10, '2021-03-02', '2021-03-02 09:21:49', '118.200.94.12', '2021-03-03 09:18:32', '118.200.94.12', '0', '1.4360041', '103.8440569', '1.4366303', '103.8417336', '2021-03-02 09:21:49', '2021-03-03 09:18:32', '2021-03-03 09:18:32', '0:0', '', 'Present'),
(85, 11, '2021-03-02', '2021-03-02 09:21:50', '118.200.94.12', '2021-03-02 20:39:16', '118.200.94.12', '0', '1.4380283832413554', '103.84500542933955', '1.437933670936462', '103.84493886630138', '2021-03-02 09:21:50', '2021-03-02 20:39:16', '2021-03-02 20:39:16', '11:17', '', 'Present'),
(86, 15, '2021-03-02', '2021-03-02 09:22:32', '122.11.212.156', '2021-03-03 09:26:15', '118.200.94.12', '0', '1.4371472156589722', '103.84334131983996', '1.438041861067377', '103.84487557054307', '2021-03-02 09:22:32', '2021-03-03 09:26:15', '2021-03-03 09:26:15', '0:0', '', 'Present'),
(87, 19, '2021-03-02', '2021-03-02 09:30:14', '118.200.94.12', '2021-03-02 18:22:46', '111.65.32.228', '0', '1.4380963662698134', '103.84488383753472', '1.4340853538550744', '103.84201700980599', '2021-03-02 09:30:14', '2021-03-02 18:22:46', '2021-03-02 18:22:46', '8:52', '', 'Present'),
(88, 23, '2021-03-02', '2021-03-02 09:38:18', '111.65.36.140', '2021-03-02 23:29:19', '118.200.94.12', '0', '1.4373322', '103.8430181', '1.4379768', '103.8448061', '2021-03-02 09:38:18', '2021-03-02 23:29:19', '2021-03-02 23:29:19', '13:51', '', 'Present'),
(89, 18, '2021-03-02', '2021-03-02 09:38:47', '119.56.111.237', '2021-03-02 23:29:31', '118.200.94.12', '0', '1.4376388041502115', '103.84470208522261', '1.437820759569059', '103.84490961568287', '2021-03-02 09:38:47', '2021-03-02 23:29:31', '2021-03-02 23:29:31', '13:50', '', 'Present'),
(90, 14, '2021-03-03', '2021-03-03 08:26:03', '111.65.46.69', '2021-03-04 08:51:23', '111.65.46.69', '0', '1.4364028', '103.8427931', '1.4379602', '103.8447911', '2021-03-03 08:26:03', '2021-03-04 08:51:23', '2021-03-04 08:51:23', '0:0', '', 'Present'),
(91, 11, '2021-03-03', '2021-03-03 09:10:11', '118.200.94.12', '2021-03-04 09:20:51', '118.200.94.12', '0', '1.438100099526248', '103.84485154708915', '1.4381432103156693', '103.84482518013928', '2021-03-03 09:10:11', '2021-03-04 09:20:51', '2021-03-04 09:20:51', '0:0', '', 'Present'),
(92, 10, '2021-03-03', '2021-03-03 09:18:45', '118.200.94.12', '2021-03-03 18:39:49', '111.65.57.49', '0', '1.4366303', '103.8417336', '1.4379758', '103.8448497', '2021-03-03 09:18:45', '2021-03-03 18:39:49', '2021-03-03 18:39:49', '9:21', '', 'Present'),
(93, 15, '2021-03-03', '2021-03-03 09:26:22', '118.200.94.12', '2021-03-03 22:36:01', '115.66.193.51', '0', '1.438041861067377', '103.84487557054307', '1.4128738221578805', '103.83729960594992', '2021-03-03 09:26:22', '2021-03-03 22:36:01', '2021-03-03 22:36:01', '13:9', '', 'Present'),
(94, 13, '2021-03-03', '2021-03-03 09:27:14', '119.56.96.92', '2021-03-03 19:18:51', '119.56.96.40', '0', '1.4380657963623082', '103.84481707413948', '1.3031399473903638', '103.86522843347271', '2021-03-03 09:27:14', '2021-03-03 19:18:51', '2021-03-03 19:18:51', '9:51', '', 'Present'),
(95, 18, '2021-03-03', '2021-03-03 09:28:13', '118.200.94.12', '2021-03-03 22:41:48', '119.56.111.161', '0', '1.43782776218415', '103.84500383822693', '1.4377409498816047', '103.8437370514408', '2021-03-03 09:28:13', '2021-03-03 22:41:48', '2021-03-03 22:41:48', '13:13', '', 'Present'),
(96, 23, '2021-03-03', '2021-03-03 09:29:50', '118.200.94.12', '2021-03-03 22:42:21', '111.65.36.164', '0', '1.4403528', '103.8390329', '1.4379908', '103.8447674', '2021-03-03 09:29:50', '2021-03-03 22:42:21', '2021-03-03 22:42:21', '13:12', '', 'Present'),
(97, 19, '2021-03-03', '2021-03-03 09:33:28', '118.200.94.12', '2021-03-03 18:02:35', '111.65.32.228', '0', '1.438032616058403', '103.84490507061865', '1.437818688394692', '103.84486997570058', '2021-03-03 09:33:28', '2021-03-03 18:02:35', '2021-03-03 18:02:35', '8:29', '', 'Present'),
(98, 14, '2021-03-04', '2021-03-04 08:51:38', '111.65.46.69', '2021-03-04 18:30:44', '111.65.46.69', '0', '1.4379602', '103.8447911', '1.4379748', '103.8448639', '2021-03-04 08:51:38', '2021-03-04 18:30:44', '2021-03-04 18:30:44', '9:39', '', 'Present'),
(99, 10, '2021-03-04', '2021-03-04 09:10:41', '118.200.94.12', '2021-03-04 19:33:23', '118.200.94.12', '0', '1.4371994', '103.8446322', '1.4379757', '103.8448974', '2021-03-04 09:10:41', '2021-03-04 19:33:23', '2021-03-04 19:33:23', '10:22', '', 'Present'),
(100, 11, '2021-03-04', '2021-03-04 09:20:53', '118.200.94.12', '2021-03-04 15:15:40', '118.200.94.12', '0', '1.43813358148524', '103.84478508910696', '1.4381245254185504', '103.84482147558246', '2021-03-04 09:20:53', '2021-03-04 15:15:40', '2021-03-04 15:15:40', '5:54', '', 'Present'),
(101, 13, '2021-03-04', '2021-03-04 09:22:58', '119.56.103.65', '2021-03-05 09:27:05', '119.56.109.132', '0', '1.4380598761313723', '103.84497175762638', '1.4380480839170033', '103.84482827860452', '2021-03-04 09:22:58', '2021-03-05 09:27:05', '2021-03-05 09:27:05', '0:0', '', 'Present'),
(102, 15, '2021-03-04', '2021-03-04 09:23:19', '122.11.212.137', '2021-03-04 15:23:34', '118.200.94.12', '0', '1.437511793483585', '103.84427265281919', '1.429794', '103.83327589999999', '2021-03-04 09:23:19', '2021-03-04 15:23:34', '2021-03-04 15:23:34', '6:0', '', 'Present'),
(103, 19, '2021-03-04', '2021-03-04 09:28:58', '118.200.94.12', '2021-03-04 18:03:39', '118.200.94.12', '0', '1.4378405563871102', '103.84489797558217', '1.4380409326073258', '103.84483330587956', '2021-03-04 09:28:58', '2021-03-04 18:03:39', '2021-03-04 18:03:39', '8:34', '', 'Present'),
(104, 18, '2021-03-04', '2021-03-04 09:31:53', '119.56.105.195', '2021-03-04 22:52:26', '118.200.94.12', '0', '1.4365613278407465', '103.8443020774993', '1.4380627835082842', '103.84496017425856', '2021-03-04 09:31:53', '2021-03-04 22:52:26', '2021-03-04 22:52:26', '13:20', '', 'Present'),
(105, 23, '2021-03-04', '2021-03-04 10:59:14', '118.200.94.12', '2021-03-04 22:52:26', '118.200.94.12', '0', '1.4379799', '103.84488', '1.4379762', '103.8449063', '2021-03-04 10:59:14', '2021-03-04 22:52:26', '2021-03-04 22:52:26', '11:53', '', 'Present'),
(106, 24, '2021-03-04', '2021-03-04 15:03:12', '118.200.94.12', '2021-03-04 15:03:26', '118.200.94.12', '0', '1.4379615050084595', '103.84496936126874', '1.4379685875695332', '103.84497838724106', '2021-03-04 15:03:12', '2021-03-04 15:03:26', '2021-03-04 15:03:26', '0:0', '', 'Present'),
(107, 24, '2021-03-04', '2021-03-04 15:03:32', '118.200.94.12', '2021-03-04 15:03:45', '118.200.94.12', '0', '1.4381072944235165', '103.8448189654414', '1.438198460802755', '103.84469728834247', '2021-03-04 15:03:32', '2021-03-04 15:03:45', '2021-03-04 15:03:45', '0:0', '0:0', 'Present'),
(108, 24, '2021-03-04', '2021-03-04 15:04:09', '118.200.94.12', '2021-03-04 15:04:27', '118.200.94.12', '0', '1.438198460802755', '103.84469728834247', '1.437969482056413', '103.84498970609347', '2021-03-04 15:04:09', '2021-03-04 15:04:27', '2021-03-04 15:04:27', '0:0', '0:0', 'Present'),
(109, 11, '2021-03-04', '2021-03-04 15:15:43', '118.200.94.12', '2021-03-04 19:30:18', '118.200.94.12', '0', '1.4381749783871067', '103.84475459710956', '1.4380646388077447', '103.84491479123623', '2021-03-04 15:15:43', '2021-03-04 19:30:18', '2021-03-04 19:30:18', '4:14', '0:0', 'Present'),
(110, 12, '2021-03-04', '2021-03-04 15:18:16', '118.200.94.12', '2021-03-04 15:18:22', '118.200.94.12', '0', '1.4381844772633718', '103.84472345215694', '1.4381955208524602', '103.84469494708513', '2021-03-04 15:18:16', '2021-03-04 15:18:22', '2021-03-04 15:18:22', '0:0', '', 'Present'),
(111, 12, '2021-03-04', '2021-03-04 15:18:25', '118.200.94.12', '2021-03-04 15:43:45', '118.200.94.12', '0', '1.4382104931713577', '103.84468188931305', '1.4380593848848138', '103.8448909005341', '2021-03-04 15:18:25', '2021-03-04 15:43:45', '2021-03-04 15:43:45', '0:25', '0:0', 'Present'),
(112, 15, '2021-03-04', '2021-03-04 15:23:36', '118.200.94.12', '2021-03-05 09:19:47', '118.200.94.12', '0', '1.429794', '103.83327589999999', '1.438048036020638', '103.84482056659594', '2021-03-04 15:23:36', '2021-03-05 09:19:47', '2021-03-05 09:19:47', '0:0', '0:0', 'Present'),
(113, 12, '2021-03-04', '2021-03-04 15:43:50', '118.200.94.12', '2021-03-04 15:45:14', '118.200.94.12', '0', '1.4381844532050416', '103.84473314476031', '1.4381844532050416', '103.84473314476031', '2021-03-04 15:43:50', '2021-03-04 15:45:14', '2021-03-04 15:45:14', '0:1', '0:0', 'Present'),
(114, 12, '2021-03-04', '2021-03-04 15:45:17', '118.200.94.12', '2021-03-04 20:06:10', '111.65.59.162', '0', '1.4380965406511659', '103.84484146902689', '1.4367264606055672', '103.83208306294856', '2021-03-04 15:45:17', '2021-03-04 20:06:10', '2021-03-04 20:06:10', '4:20', '0:0', 'Present'),
(115, 15, '2021-03-05', '2021-03-05 09:19:52', '118.200.94.12', '2021-03-06 09:59:36', '122.11.212.129', '0', '1.438048036020638', '103.84482056659594', '1.4364764315476142', '103.84224649127786', '2021-03-05 09:19:52', '2021-03-06 09:59:36', '2021-03-06 09:59:36', '0:0', '', 'Present'),
(116, 11, '2021-03-05', '2021-03-05 09:24:04', '118.200.94.12', '2021-03-08 09:14:03', '118.200.94.12', '0', '1.4379878027404933', '103.84508436807704', '1.43794908553949', '103.84485914850285', '2021-03-05 09:24:04', '2021-03-08 09:14:03', '2021-03-08 09:14:03', '0:0', '', 'Present'),
(117, 12, '2021-03-05', '2021-03-05 09:24:48', '118.200.94.12', '2021-03-05 09:28:17', '111.65.35.68', '0', '1.4379580122991777', '103.84496772003482', '1.4380563300819607', '103.84494243050165', '2021-03-05 09:24:48', '2021-03-05 09:28:17', '2021-03-05 09:28:17', '0:3', '', 'Present'),
(118, 13, '2021-03-05', '2021-03-05 09:27:19', '119.56.109.132', '2021-03-06 10:01:47', '119.56.101.52', '0', '1.4381151512742312', '103.8448873172107', '1.438067055493852', '103.84483358513762', '2021-03-05 09:27:19', '2021-03-06 10:01:47', '2021-03-06 10:01:47', '0:0', '', 'Present'),
(119, 10, '2021-03-05', '2021-03-05 09:28:15', '118.200.94.12', '2021-03-05 19:02:57', '111.65.58.4', '0', '1.4379758', '103.8448009', '1.4381124', '103.8450425', '2021-03-05 09:28:15', '2021-03-05 19:02:57', '2021-03-05 19:02:57', '9:34', '', 'Present'),
(120, 12, '2021-03-05', '2021-03-05 09:28:20', '111.65.35.68', '2021-03-08 09:29:12', '111.65.35.102', '0', '1.438037647481928', '103.84494184795675', '1.4373150538357866', '103.84371885858612', '2021-03-05 09:28:20', '2021-03-08 09:29:12', '2021-03-08 09:29:12', '0:0', '0:0', 'Present'),
(121, 14, '2021-03-05', '2021-03-05 09:30:04', '111.65.46.119', '2021-03-05 19:28:48', '111.65.46.119', '0', '1.4304404', '103.8382065', '1.4374937', '103.8443568', '2021-03-05 09:30:04', '2021-03-05 19:28:48', '2021-03-05 19:28:48', '9:58', '', 'Present'),
(122, 19, '2021-03-05', '2021-03-05 09:32:19', '118.200.94.12', '2021-03-05 18:02:38', '118.200.94.12', '0', '1.4379734572701794', '103.84502736060202', '1.4379560209621456', '103.84496716021461', '2021-03-05 09:32:19', '2021-03-05 18:02:38', '2021-03-05 18:02:38', '8:30', '', 'Present'),
(123, 18, '2021-03-05', '2021-03-05 09:35:07', '118.200.94.12', '2021-03-05 20:27:02', '119.56.109.163', '0', '1.437944494312822', '103.84499975642196', '1.4295030535763897', '103.83592333633561', '2021-03-05 09:35:07', '2021-03-05 20:27:02', '2021-03-05 20:27:02', '10:51', '', 'Present'),
(124, 23, '2021-03-05', '2021-03-05 09:35:23', '118.200.94.12', '2021-03-05 20:27:00', '111.65.36.174', '0', '1.4379766', '103.8448405', '1.4331705', '103.8410808', '2021-03-05 09:35:23', '2021-03-05 20:27:00', '2021-03-05 20:27:00', '10:51', '', 'Present'),
(125, 14, '2021-03-06', '2021-03-06 09:25:47', '111.65.46.119', '2021-03-06 18:28:38', '111.65.46.119', '0', '1.4362323', '103.8419983', '1.3197574', '103.8790581', '2021-03-06 09:25:47', '2021-03-06 18:28:38', '2021-03-06 18:28:38', '9:2', '', 'Present'),
(126, 15, '2021-03-06', '2021-03-06 09:59:39', '122.11.212.129', '2021-03-07 22:03:08', '115.66.193.51', '0', '1.4379675633536815', '103.84398150422226', '1.4128883280971485', '103.83735042871417', '2021-03-06 09:59:39', '2021-03-07 22:03:08', '2021-03-07 22:03:08', '0:0', '', 'Present'),
(127, 13, '2021-03-06', '2021-03-06 10:01:57', '119.56.101.52', '2021-03-08 09:16:31', '119.56.101.12', '0', '1.4380790419014828', '103.84477595785387', '1.4381025156498373', '103.8449377692599', '2021-03-06 10:01:57', '2021-03-08 09:16:31', '2021-03-08 09:16:31', '0:0', '', 'Present'),
(128, 22, '2021-03-06', '2021-03-06 16:16:16', '119.56.107.39', '2021-03-06 16:16:39', '119.56.107.39', '0', '1.4379094799999996', '103.84478758999995', '1.4379094799999996', '103.84478758999995', '2021-03-06 16:16:16', '2021-03-06 16:16:39', '2021-03-06 16:16:39', '0:0', '', 'Present'),
(129, 22, '2021-03-06', '2021-03-06 16:17:11', '119.56.107.39', '2021-03-06 16:17:16', '119.56.107.39', '0', '1.4379094799999996', '103.84478758999995', '1.4379094799999996', '103.84478758999995', '2021-03-06 16:17:11', '2021-03-06 16:17:16', '2021-03-06 16:17:16', '0:0', '0:0', 'Present'),
(130, 14, '2021-03-08', '2021-03-08 08:45:34', '111.65.46.119', '2021-03-08 20:30:36', '111.65.46.119', '0', '1.4304104', '103.8356553', '1.4379759', '103.8448179', '2021-03-08 08:45:34', '2021-03-08 20:30:36', '2021-03-08 20:30:36', '11:45', '', 'Present'),
(131, 23, '2021-03-08', '2021-03-08 09:10:51', '118.200.94.12', '2021-03-08 22:39:41', '118.200.94.12', '0', '1.4379751', '103.8448874', '1.4379622', '103.84484', '2021-03-08 09:10:51', '2021-03-08 22:39:41', '2021-03-08 22:39:41', '13:28', '', 'Present'),
(132, 11, '2021-03-08', '2021-03-08 09:14:07', '118.200.94.12', '2021-03-08 18:37:28', '118.200.94.12', '0', '1.4378702411655826', '103.84491231467148', '1.4377894377733191', '103.84490070883636', '2021-03-08 09:14:07', '2021-03-08 18:37:28', '2021-03-08 18:37:28', '9:23', '', 'Present'),
(133, 10, '2021-03-08', '2021-03-08 09:15:46', '118.200.94.12', '2021-03-08 18:57:02', '111.65.57.252', '0', '1.4374952', '103.8442699', '1.4380053', '103.8449606', '2021-03-08 09:15:46', '2021-03-08 18:57:02', '2021-03-08 18:57:02', '9:41', '', 'Present'),
(134, 13, '2021-03-08', '2021-03-08 09:16:35', '119.56.101.12', '2021-03-08 18:33:21', '119.56.106.191', '0', '1.4380945493636246', '103.8447966001751', '1.4380996189707518', '103.84500289251598', '2021-03-08 09:16:35', '2021-03-08 18:33:21', '2021-03-08 18:33:21', '9:16', '', 'Present'),
(135, 22, '2021-03-08', '2021-03-08 09:23:49', '119.56.106.77', '2021-03-08 19:03:49', '119.56.109.171', '0', '1.4145436696837874', '103.80711884622342', '1.430473301072158', '103.8368549174901', '2021-03-08 09:23:49', '2021-03-08 19:03:49', '2021-03-08 19:03:49', '9:40', '', 'Present'),
(136, 19, '2021-03-08', '2021-03-08 09:24:06', '111.65.59.153', '2021-03-08 18:03:15', '118.200.94.12', '0', '1.4371076670076222', '103.84432819291531', '1.4380473019928326', '103.84496623219924', '2021-03-08 09:24:06', '2021-03-08 18:03:15', '2021-03-08 18:03:15', '8:39', '', 'Present'),
(137, 15, '2021-03-08', '2021-03-08 09:24:24', '122.11.212.132', '2021-03-08 19:03:37', '122.11.212.132', '0', '1.4379290074232607', '103.8448215387606', '1.4300930306484543', '103.83859897351826', '2021-03-08 09:24:24', '2021-03-08 19:03:37', '2021-03-08 19:03:37', '9:39', '', 'Present'),
(138, 16, '2021-03-08', '2021-03-08 09:26:34', '118.200.94.12', '2021-03-08 19:03:42', '119.56.98.2', '0', '1.4380749277990355', '103.84484598890715', '1.4302354993187296', '103.83884922690004', '2021-03-08 09:26:34', '2021-03-08 19:03:42', '2021-03-08 19:03:42', '9:37', '', 'Present'),
(139, 12, '2021-03-08', '2021-03-08 09:29:23', '111.65.35.102', '2021-03-08 19:46:06', '111.65.35.102', '0', '1.4373150538357866', '103.84371885858612', '1.4380272655950326', '103.84519288852212', '2021-03-08 09:29:23', '2021-03-08 19:46:06', '2021-03-08 19:46:06', '10:16', '', 'Present'),
(140, 18, '2021-03-08', '2021-03-08 09:30:58', '118.200.94.12', '2021-03-08 22:39:52', '118.200.94.12', '0', '1.4379981256006402', '103.84509443625367', '1.438154091004695', '103.84478648305283', '2021-03-08 09:30:58', '2021-03-08 22:39:52', '2021-03-08 22:39:52', '13:8', '', 'Present'),
(141, 14, '2021-03-09', '2021-03-09 08:48:15', '111.65.46.80', '2021-03-09 18:38:41', '111.65.46.80', '0', '1.437371', '103.8440575', '1.4379733', '103.8447559', '2021-03-09 08:48:15', '2021-03-09 18:38:41', '2021-03-09 18:38:41', '9:50', '', 'Present'),
(142, 12, '2021-03-09', '2021-03-09 09:11:25', '111.65.47.219', '2021-03-09 22:14:58', '111.65.47.219', '0', '1.4379660372547023', '103.84503520476942', '1.3435372596021928', '103.8607913069628', '2021-03-09 09:11:25', '2021-03-09 22:14:58', '2021-03-09 22:14:58', '13:3', '', 'Present'),
(143, 11, '2021-03-09', '2021-03-09 09:15:26', '118.200.94.12', '2021-03-09 17:33:32', '118.200.94.12', '0', '1.437940424345907', '103.84503996839217', '1.4377955730559369', '103.84498221373414', '2021-03-09 09:15:26', '2021-03-09 17:33:32', '2021-03-09 17:33:32', '8:18', '', 'Present'),
(144, 13, '2021-03-09', '2021-03-09 09:15:28', '119.56.110.245', '2021-03-09 18:30:46', '119.56.110.245', '0', '1.438128817702784', '103.8449987238989', '1.4380469337428348', '103.84500413918121', '2021-03-09 09:15:28', '2021-03-09 18:30:46', '2021-03-09 18:30:46', '9:15', '', 'Present'),
(145, 10, '2021-03-09', '2021-03-09 09:16:02', '118.200.94.12', '2021-03-10 09:17:02', '118.200.94.12', '0', '1.4368203', '103.8441914', '1.4379026', '103.845009', '2021-03-09 09:16:02', '2021-03-10 09:17:02', '2021-03-10 09:17:02', '0:0', '', 'Present'),
(146, 15, '2021-03-09', '2021-03-09 09:26:26', '118.200.94.12', '2021-03-09 18:37:17', '118.200.94.12', '0', '1.4380000823864014', '103.8449310960237', '1.437741183473873', '103.84477714963214', '2021-03-09 09:26:26', '2021-03-09 18:37:17', '2021-03-09 18:37:17', '9:10', '', 'Present'),
(147, 16, '2021-03-09', '2021-03-09 09:26:39', '119.56.107.148', '2021-03-15 09:22:30', '119.56.109.120', '0', '1.4379029070646432', '103.84497757633878', '1.4379716311267445', '103.84506812103346', '2021-03-09 09:26:39', '2021-03-15 09:22:30', '2021-03-15 09:22:30', '0:0', '', 'Present'),
(148, 19, '2021-03-09', '2021-03-09 09:27:03', '118.200.94.12', '2021-03-09 18:07:39', '111.65.59.146', '0', '1.437958549523131', '103.84502822302595', '1.4367869111852045', '103.84169068328444', '2021-03-09 09:27:03', '2021-03-09 18:07:39', '2021-03-09 18:07:39', '8:40', '', 'Present'),
(149, 18, '2021-03-09', '2021-03-09 09:36:04', '118.200.94.12', '2021-03-09 23:20:53', '118.200.94.12', '0', '1.4377491920680083', '103.84501001124596', '1.4380161772492215', '103.84507902295283', '2021-03-09 09:36:04', '2021-03-09 23:20:53', '2021-03-09 23:20:53', '13:44', '', 'Present'),
(150, 23, '2021-03-09', '2021-03-09 09:38:57', '118.200.94.12', '2021-03-09 23:20:51', '111.65.63.170', '0', '1.4379965', '103.8447752', '1.4384377', '103.8446404', '2021-03-09 09:38:57', '2021-03-09 23:20:51', '2021-03-09 23:20:51', '13:41', '', 'Present'),
(151, 14, '2021-03-10', '2021-03-10 08:55:47', '111.65.46.116', '2021-03-10 18:59:38', '111.65.46.80', '0', '1.4380355', '103.8447109', '1.3948409', '103.905724', '2021-03-10 08:55:47', '2021-03-10 18:59:38', '2021-03-10 18:59:38', '10:3', '', 'Present'),
(152, 11, '2021-03-10', '2021-03-10 09:11:34', '118.200.94.12', '2021-03-10 20:56:15', '118.200.94.12', '0', '1.4379496741750288', '103.84496005000612', '1.4380032134536227', '103.84498282819857', '2021-03-10 09:11:34', '2021-03-10 20:56:15', '2021-03-10 20:56:15', '11:44', '', 'Present'),
(153, 10, '2021-03-10', '2021-03-10 09:17:15', '118.200.94.12', '2021-03-10 19:24:28', '111.65.69.33', '0', '1.4379026', '103.845009', '1.3690674', '103.8837369', '2021-03-10 09:17:15', '2021-03-10 19:24:28', '2021-03-10 19:24:28', '10:7', '', 'Present'),
(154, 22, '2021-03-10', '2021-03-10 09:20:04', '119.56.104.173', '2021-03-11 09:29:47', '119.56.110.235', '0', '1.4371982556529155', '103.83020726472083', '1.4410246441172236', '103.83919752108253', '2021-03-10 09:20:04', '2021-03-11 09:29:47', '2021-03-11 09:29:47', '0:0', '', 'Present'),
(155, 15, '2021-03-10', '2021-03-10 09:21:09', '183.90.36.161', '2021-03-10 19:44:48', '115.66.193.51', '0', '1.4362800770464716', '103.84222848114123', '1.412873256135111', '103.83730007073295', '2021-03-10 09:21:09', '2021-03-10 19:44:48', '2021-03-10 19:44:48', '10:23', '', 'Present'),
(156, 13, '2021-03-10', '2021-03-10 09:23:34', '119.56.109.73', '2021-03-10 18:32:07', '119.56.104.60', '0', '1.4381197499634517', '103.84478503038429', '1.438046825271649', '103.84491083236486', '2021-03-10 09:23:34', '2021-03-10 18:32:07', '2021-03-10 18:32:07', '9:8', '', 'Present'),
(157, 19, '2021-03-10', '2021-03-10 09:30:25', '111.65.59.146', '2021-03-10 18:05:57', '111.65.59.146', '0', '1.437334493186045', '103.84440432793163', '1.4371481386496896', '103.84349023867499', '2021-03-10 09:30:25', '2021-03-10 18:05:57', '2021-03-10 18:05:57', '8:35', '', 'Present'),
(158, 23, '2021-03-10', '2021-03-10 09:33:27', '118.200.94.12', '2021-03-10 23:02:33', '111.65.63.151', '0', '1.4365526', '103.834045', '1.4379972', '103.8448032', '2021-03-10 09:33:27', '2021-03-10 23:02:33', '2021-03-10 23:02:33', '13:29', '', 'Present'),
(159, 18, '2021-03-10', '2021-03-10 09:35:11', '118.200.94.12', '2021-03-10 23:02:32', '118.200.94.12', '0', '1.4379886889323037', '103.84507899426315', '1.4376967375684597', '103.84482101108448', '2021-03-10 09:35:11', '2021-03-10 23:02:32', '2021-03-10 23:02:32', '13:27', '', 'Present'),
(160, 12, '2021-03-10', '2021-03-10 11:00:17', '118.200.94.12', '2021-03-10 23:15:34', '121.6.126.18', '0', '1.4380306907201008', '103.84497500523648', '1.337196121348793', '103.92243821594434', '2021-03-10 11:00:17', '2021-03-10 23:15:34', '2021-03-10 23:15:34', '12:15', '', 'Present'),
(161, 14, '2021-03-11', '2021-03-11 08:52:49', '111.65.46.91', '2021-03-11 21:16:41', '111.65.46.91', '0', '1.4376389', '103.8436731', '1.4376769', '103.8445073', '2021-03-11 08:52:49', '2021-03-11 21:16:41', '2021-03-11 21:16:41', '12:23', '', 'Present'),
(162, 11, '2021-03-11', '2021-03-11 09:07:59', '118.200.94.12', '2021-03-11 21:20:18', '118.200.94.12', '0', '1.4375294721846636', '103.84456972533867', '1.4380426430218594', '103.84491318030197', '2021-03-11 09:07:59', '2021-03-11 21:20:18', '2021-03-11 21:20:18', '12:12', '', 'Present'),
(163, 13, '2021-03-11', '2021-03-11 09:13:27', '119.56.105.176', '2021-03-13 09:56:48', '119.56.106.128', '0', '1.437978752442236', '103.84481259706226', '1.4379503788657284', '103.84485684749691', '2021-03-11 09:13:27', '2021-03-13 09:56:48', '2021-03-13 09:56:48', '0:0', '', 'Present'),
(164, 10, '2021-03-11', '2021-03-11 09:15:52', '118.200.94.12', '2021-03-12 09:19:10', '118.200.94.12', '0', '1.4379285', '103.8447418', '1.437883', '103.8446922', '2021-03-11 09:15:52', '2021-03-12 09:19:10', '2021-03-12 09:19:10', '0:0', '', 'Present'),
(165, 12, '2021-03-11', '2021-03-11 09:18:40', '111.65.47.223', '2021-03-11 19:05:48', '111.65.47.223', '0', '1.4375761850295106', '103.84460146833528', '1.3729994260441611', '103.86002478174431', '2021-03-11 09:18:40', '2021-03-11 19:05:48', '2021-03-11 19:05:48', '9:47', '', 'Present'),
(166, 15, '2021-03-11', '2021-03-11 09:22:04', '118.200.94.12', '2021-03-12 09:23:55', '183.90.37.32', '0', '1.438211270059338', '103.84465760073206', '1.4383163054750658', '103.84429793961174', '2021-03-11 09:22:04', '2021-03-12 09:23:55', '2021-03-12 09:23:55', '0:0', '', 'Present'),
(167, 23, '2021-03-11', '2021-03-11 09:27:04', '118.200.94.12', '2021-03-11 22:59:09', '111.65.63.179', '0', '1.4379888', '103.8447718', '1.4380065', '103.8447664', '2021-03-11 09:27:04', '2021-03-11 22:59:09', '2021-03-11 22:59:09', '13:32', '', 'Present'),
(168, 19, '2021-03-11', '2021-03-11 09:29:18', '111.65.59.146', '2021-03-11 18:36:07', '118.200.94.12', '0', '1.4370805109236446', '103.8436619063943', '1.4376739554703921', '103.84499231381432', '2021-03-11 09:29:18', '2021-03-11 18:36:07', '2021-03-11 18:36:07', '9:6', '', 'Present'),
(169, 22, '2021-03-11', '2021-03-11 09:29:52', '119.56.110.235', '2021-03-12 09:26:22', '119.56.109.11', '0', '1.4410246441172236', '103.83919752108253', '1.440895392524666', '103.83901850383029', '2021-03-11 09:29:52', '2021-03-12 09:26:22', '2021-03-12 09:26:22', '0:0', '', 'Present'),
(170, 18, '2021-03-11', '2021-03-11 09:35:24', '118.200.94.12', '2021-03-11 22:59:08', '118.200.94.12', '0', '1.4379581542542095', '103.84495572077138', '1.4379507629584092', '103.8449979687709', '2021-03-11 09:35:24', '2021-03-11 22:59:08', '2021-03-11 22:59:08', '13:23', '', 'Present'),
(171, 21, '2021-03-11', '2021-03-11 19:08:19', '118.200.94.12', '2021-03-11 19:08:22', '118.200.94.12', '0', '1.4379489705659283', '103.84495921507221', '1.4379789469158442', '103.84493323567038', '2021-03-11 19:08:19', '2021-03-11 19:08:22', '2021-03-11 19:08:22', '0:0', '', 'Present'),
(172, 14, '2021-03-12', '2021-03-12 09:13:29', '111.65.46.79', '2021-03-12 18:30:12', '111.65.46.79', '0', '1.4379955', '103.8447696', '1.4379906', '103.8447741', '2021-03-12 09:13:29', '2021-03-12 18:30:12', '2021-03-12 18:30:12', '9:16', '', 'Present'),
(173, 11, '2021-03-12', '2021-03-12 09:19:13', '118.200.94.12', '2021-03-12 18:39:25', '118.200.94.12', '0', '1.437568352772767', '103.84473453611186', '1.4379520829459187', '103.84497906180724', '2021-03-12 09:19:13', '2021-03-12 18:39:25', '2021-03-12 18:39:25', '9:20', '', 'Present'),
(174, 10, '2021-03-12', '2021-03-12 09:19:15', '118.200.94.12', '2021-03-12 18:39:44', '118.200.94.12', '0', '1.437883', '103.8446922', '1.4380157', '103.8447933', '2021-03-12 09:19:15', '2021-03-12 18:39:44', '2021-03-12 18:39:44', '9:20', '', 'Present'),
(175, 21, '2021-03-12', '2021-03-12 09:21:12', '118.200.94.12', '2021-03-15 09:30:49', '118.200.94.12', '0', '1.4379419740052828', '103.84499830773106', '1.4381713801321667', '103.84475675097205', '2021-03-12 09:21:12', '2021-03-15 09:30:49', '2021-03-15 09:30:49', '0:0', '', 'Present'),
(176, 15, '2021-03-12', '2021-03-12 09:24:17', '183.90.37.32', '2021-03-12 19:08:39', '183.90.37.32', '0', '1.438263836436939', '103.8444429615282', '1.442775065506207', '103.8049805152284', '2021-03-12 09:24:17', '2021-03-12 19:08:39', '2021-03-12 19:08:39', '9:44', '', 'Present'),
(177, 22, '2021-03-12', '2021-03-12 09:26:33', '119.56.109.11', '2021-03-13 10:03:33', '119.56.97.161', '0', '1.440895392524666', '103.83901850383029', '1.4100822785436047', '103.77341640211598', '2021-03-12 09:26:33', '2021-03-13 10:03:33', '2021-03-13 10:03:33', '0:0', '', 'Present'),
(178, 19, '2021-03-12', '2021-03-12 09:30:51', '111.65.56.133', '2021-03-15 09:38:27', '118.200.94.12', '0', '1.4370298936183519', '103.84421157712511', '1.4380334829183992', '103.8449613863159', '2021-03-12 09:30:51', '2021-03-15 09:38:27', '2021-03-15 09:38:27', '0:0', '', 'Present');
INSERT INTO `xin_attendance_time` (`time_attendance_id`, `employee_id`, `attendance_date`, `clock_in`, `clock_in_ip_address`, `clock_out`, `clock_out_ip_address`, `clock_in_out`, `clock_in_latitude`, `clock_in_longitude`, `clock_out_latitude`, `clock_out_longitude`, `time_late`, `early_leaving`, `overtime`, `total_work`, `total_rest`, `attendance_status`) VALUES
(179, 23, '2021-03-12', '2021-03-12 09:32:09', '111.65.63.174', '2021-03-12 23:28:03', '118.200.94.12', '0', '1.4371342', '103.8415848', '1.4380203', '103.8447947', '2021-03-12 09:32:09', '2021-03-12 23:28:03', '2021-03-12 23:28:03', '13:55', '', 'Present'),
(180, 18, '2021-03-12', '2021-03-12 09:49:39', '118.200.94.12', '2021-03-15 09:38:44', '118.200.94.12', '0', '1.4379656058468773', '103.84503118857955', '1.4380219364968136', '103.84496974992314', '2021-03-12 09:49:39', '2021-03-15 09:38:44', '2021-03-15 09:38:44', '0:0', '', 'Present'),
(181, 10, '2021-03-13', '2021-03-13 09:47:40', '118.200.94.12', '2021-03-15 09:15:07', '118.200.94.12', '0', '1.4380669', '103.8450837', '1.4313113', '103.8475309', '2021-03-13 09:47:40', '2021-03-15 09:15:07', '2021-03-15 09:15:07', '0:0', '', 'Present'),
(182, 13, '2021-03-13', '2021-03-13 09:57:02', '119.56.106.128', '2021-03-15 09:30:40', '119.56.111.184', '0', '1.4380332259863773', '103.84489234494305', '1.438072822027759', '103.84471594470034', '2021-03-13 09:57:02', '2021-03-15 09:30:40', '2021-03-15 09:30:40', '0:0', '', 'Present'),
(183, 13, '2021-03-13', '2021-03-13 09:57:02', '119.56.106.128', '2021-03-15 09:30:20', '119.56.111.184', '0', '1.4380332259863773', '103.84489234494305', '1.438040273910276', '103.84474374584927', '2021-03-13 09:57:02', '2021-03-15 09:30:20', '2021-03-15 09:30:20', '0:0', '0:0', 'Present'),
(184, 22, '2021-03-13', '2021-03-13 10:03:37', '119.56.97.161', '2021-03-15 09:24:33', '119.56.99.69', '0', '1.4379405254071114', '103.8408893169907', '1.4355542614844112', '103.84322494498824', '2021-03-13 10:03:37', '2021-03-15 09:24:33', '2021-03-15 09:24:33', '0:0', '', 'Present'),
(185, 14, '2021-03-15', '2021-03-15 09:09:53', '111.65.46.190', '2021-03-15 21:17:16', '111.65.46.190', '0', '1.4374656', '103.8435236', '1.4304686', '103.837345', '2021-03-15 09:09:53', '2021-03-15 21:17:16', '2021-03-15 21:17:16', '12:7', '', 'Present'),
(186, 15, '2021-03-15', '2021-03-15 09:13:42', '183.90.36.116', '2021-03-15 18:43:47', '183.90.36.116', '0', '1.4131984957170345', '103.83931008158393', '1.4350395256211095', '103.84302137602029', '2021-03-15 09:13:42', '2021-03-15 18:43:47', '2021-03-15 18:43:47', '9:30', '', 'Present'),
(187, 11, '2021-03-15', '2021-03-15 09:14:30', '118.200.94.12', '2021-03-15 19:13:09', '118.200.94.12', '0', '1.4377860662990474', '103.84509963340423', '1.437635028663646', '103.84472965648217', '2021-03-15 09:14:30', '2021-03-15 19:13:09', '2021-03-15 19:13:09', '9:58', '', 'Present'),
(188, 10, '2021-03-15', '2021-03-15 09:15:18', '118.200.94.12', '2021-03-15 19:13:04', '118.200.94.12', '0', '1.4313113', '103.8475309', '1.4380019', '103.8448706', '2021-03-15 09:15:18', '2021-03-15 19:13:04', '2021-03-15 19:13:04', '9:57', '', 'Present'),
(189, 12, '2021-03-15', '2021-03-15 09:16:31', '111.65.47.147', '2021-03-15 21:00:29', '111.65.47.147', '0', '1.4369379914030473', '103.84444704177214', '1.3378931738172803', '103.89632331973934', '2021-03-15 09:16:31', '2021-03-15 21:00:29', '2021-03-15 21:00:29', '11:43', '', 'Present'),
(190, 16, '2021-03-15', '2021-03-15 09:22:35', '119.56.109.120', '2021-03-15 09:22:58', '119.56.109.120', '0', '1.437947725472451', '103.84495826648671', '1.4376335293738653', '103.84485178837605', '2021-03-15 09:22:35', '2021-03-15 09:22:58', '2021-03-15 09:22:58', '0:0', '', 'Present'),
(191, 16, '2021-03-15', '2021-03-15 09:23:01', '119.56.109.120', '2021-03-16 09:24:46', '119.56.110.178', '0', '1.437951060148339', '103.84504078064704', '1.4376890704340488', '103.84491160133362', '2021-03-15 09:23:01', '2021-03-16 09:24:46', '2021-03-16 09:24:46', '0:0', '0:0', 'Present'),
(192, 22, '2021-03-15', '2021-03-15 09:24:42', '119.56.99.69', '2021-03-16 08:48:46', '119.56.103.47', '0', '1.4378006717786953', '103.8445934058613', '1.4359020606476132', '103.84274936203182', '2021-03-15 09:24:42', '2021-03-16 08:48:46', '2021-03-16 08:48:46', '0:0', '', 'Present'),
(193, 13, '2021-03-15', '2021-03-15 09:30:45', '119.56.111.184', '2021-03-16 09:21:29', '119.56.109.204', '0', '1.4380761014477712', '103.84473869949419', '1.4380485263384444', '103.84472975742027', '2021-03-15 09:30:45', '2021-03-16 09:21:29', '2021-03-16 09:21:29', '0:0', '', 'Present'),
(194, 13, '2021-03-15', '2021-03-15 09:30:45', '119.56.111.184', '2021-03-16 09:21:15', '119.56.109.204', '0', '1.4380761014477712', '103.84473869949419', '1.4380974836214349', '103.8448007327245', '2021-03-15 09:30:45', '2021-03-16 09:21:15', '2021-03-16 09:21:15', '0:0', '0:0', 'Present'),
(195, 21, '2021-03-15', '2021-03-15 09:31:01', '118.200.94.12', '2021-03-15 18:27:22', '118.200.94.12', '0', '1.4381785148419077', '103.84475350405839', '1.4381579307827308', '103.8447564173964', '2021-03-15 09:31:01', '2021-03-15 18:27:22', '2021-03-15 18:27:22', '8:56', '', 'Present'),
(196, 23, '2021-03-15', '2021-03-15 09:34:02', '111.65.36.188', '2021-03-15 23:44:39', '118.200.94.12', '0', '1.4364633', '103.834156', '1.438023', '103.8448016', '2021-03-15 09:34:02', '2021-03-15 23:44:39', '2021-03-15 23:44:39', '14:10', '', 'Present'),
(197, 19, '2021-03-15', '2021-03-15 09:38:36', '118.200.94.12', '2021-03-15 18:31:22', '118.200.94.12', '0', '1.4380533050826896', '103.84495134149616', '1.4379449371380832', '103.8450055194366', '2021-03-15 09:38:36', '2021-03-15 18:31:22', '2021-03-15 18:31:22', '8:52', '', 'Present'),
(198, 18, '2021-03-15', '2021-03-15 09:38:52', '118.200.94.12', '2021-03-15 23:44:42', '118.200.94.12', '0', '1.438028603338224', '103.8449519121908', '1.4379701607304465', '103.84502593578199', '2021-03-15 09:38:52', '2021-03-15 23:44:42', '2021-03-15 23:44:42', '14:5', '', 'Present'),
(199, 22, '2021-03-16', '2021-03-16 08:48:50', '119.56.103.47', '2021-03-17 09:27:16', '119.56.100.170', '0', '1.4376635285771182', '103.84439332027414', '1.4352213794436377', '103.82592410098837', '2021-03-16 08:48:50', '2021-03-17 09:27:16', '2021-03-17 09:27:16', '0:0', '', 'Present'),
(200, 14, '2021-03-16', '2021-03-16 09:00:50', '111.65.46.172', '2021-03-16 20:25:30', '111.65.46.172', '0', '1.4313889', '103.8392221', '1.4379716', '103.8448337', '2021-03-16 09:00:50', '2021-03-16 20:25:30', '2021-03-16 20:25:30', '11:24', '', 'Present'),
(201, 11, '2021-03-16', '2021-03-16 09:16:36', '118.200.94.12', '2021-03-16 19:23:12', '118.200.94.12', '0', '1.4375685136820282', '103.84513446106044', '1.4381634461292567', '103.84476800920848', '2021-03-16 09:16:36', '2021-03-16 19:23:12', '2021-03-16 19:23:12', '10:6', '', 'Present'),
(202, 10, '2021-03-16', '2021-03-16 09:16:53', '118.200.94.12', '2021-03-17 09:22:11', '118.200.94.12', '0', '1.437976', '103.844815', '1.4373833', '103.8444047', '2021-03-16 09:16:53', '2021-03-17 09:22:11', '2021-03-17 09:22:11', '0:0', '', 'Present'),
(203, 21, '2021-03-16', '2021-03-16 09:20:00', '118.200.94.12', '2021-03-16 19:27:51', '116.15.174.60', '0', '1.4380623726657005', '103.84482081318949', '1.4342164238178372', '103.83940110987328', '2021-03-16 09:20:00', '2021-03-16 19:27:51', '2021-03-16 19:27:51', '10:7', '', 'Present'),
(204, 18, '2021-03-16', '2021-03-16 09:20:43', '118.200.94.12', '2021-03-16 23:39:45', '118.200.94.12', '0', '1.437908690019348', '103.84492180379884', '1.4379493370973986', '103.84499442388201', '2021-03-16 09:20:43', '2021-03-16 23:39:45', '2021-03-16 23:39:45', '14:19', '', 'Present'),
(205, 13, '2021-03-16', '2021-03-16 09:21:44', '119.56.109.204', '2021-03-17 09:27:13', '119.56.106.112', '0', '1.4380382778440683', '103.84470321343835', '1.4380723640681183', '103.84468448344182', '2021-03-16 09:21:44', '2021-03-17 09:27:13', '2021-03-17 09:27:13', '0:0', '', 'Present'),
(206, 23, '2021-03-16', '2021-03-16 09:23:57', '118.200.94.12', '2021-03-16 23:39:59', '118.200.94.12', '0', '1.4379922', '103.8448478', '1.4379806', '103.8448225', '2021-03-16 09:23:57', '2021-03-16 23:39:59', '2021-03-16 23:39:59', '14:16', '', 'Present'),
(207, 15, '2021-03-16', '2021-03-16 09:23:57', '183.90.36.116', '2021-03-16 22:35:48', '183.90.36.116', '0', '1.4347659189065198', '103.84278986575454', '1.4143456932969745', '103.83740812474976', '2021-03-16 09:23:57', '2021-03-16 22:35:48', '2021-03-16 22:35:48', '13:11', '', 'Present'),
(208, 16, '2021-03-16', '2021-03-16 09:24:49', '119.56.110.178', '2021-03-17 09:24:23', '118.200.94.12', '0', '1.4378220198877099', '103.84493316980563', '1.4378035260329838', '103.84482597792841', '2021-03-16 09:24:49', '2021-03-17 09:24:23', '2021-03-17 09:24:23', '0:0', '', 'Present'),
(209, 19, '2021-03-16', '2021-03-16 09:25:29', '111.65.46.34', '2021-03-16 18:09:25', '111.65.46.34', '0', '1.4370922517983955', '103.84401548833243', '1.4370906429449517', '103.8432994290734', '2021-03-16 09:25:29', '2021-03-16 18:09:25', '2021-03-16 18:09:25', '8:43', '', 'Present'),
(210, 12, '2021-03-16', '2021-03-16 09:25:51', '111.65.47.147', '2021-03-16 18:52:03', '111.65.47.147', '0', '1.4362756667050551', '103.84439139774996', '1.4375918539904395', '103.8446028921606', '2021-03-16 09:25:51', '2021-03-16 18:52:03', '2021-03-16 18:52:03', '9:26', '', 'Present'),
(211, 14, '2021-03-17', '2021-03-17 08:52:03', '111.65.46.174', '2021-03-17 21:35:19', '111.65.46.174', '0', '1.4371208', '103.8427741', '1.4379794', '103.8448353', '2021-03-17 08:52:03', '2021-03-17 21:35:19', '2021-03-17 21:35:19', '12:43', '', 'Present'),
(212, 11, '2021-03-17', '2021-03-17 09:21:05', '118.200.94.12', '2021-03-17 18:50:16', '111.65.44.110', '0', '1.4379023352992097', '103.84467642030953', '1.4378834541269587', '103.84498674642172', '2021-03-17 09:21:05', '2021-03-17 18:50:16', '2021-03-17 18:50:16', '9:29', '', 'Present'),
(213, 19, '2021-03-17', '2021-03-17 09:22:08', '111.65.47.248', '2021-03-17 18:45:07', '111.65.47.248', '0', '1.4371506916823884', '103.84384024172795', '1.419021494886993', '103.86253574894096', '2021-03-17 09:22:08', '2021-03-17 18:45:07', '2021-03-17 18:45:07', '9:22', '', 'Present'),
(214, 10, '2021-03-17', '2021-03-17 09:22:22', '118.200.94.12', '2021-03-17 20:15:46', '111.65.32.148', '0', '1.4373833', '103.8444047', '1.4029021', '103.9133419', '2021-03-17 09:22:22', '2021-03-17 20:15:46', '2021-03-17 20:15:46', '10:53', '', 'Present'),
(215, 16, '2021-03-17', '2021-03-17 09:24:31', '118.200.94.12', '2021-03-18 09:25:54', '118.200.94.12', '0', '1.4378549102892404', '103.84482736211604', '1.438134691694253', '103.84489946071481', '2021-03-17 09:24:31', '2021-03-18 09:25:54', '2021-03-18 09:25:54', '0:0', '', 'Present'),
(216, 12, '2021-03-17', '2021-03-17 09:26:41', '111.65.47.147', '2021-03-17 19:42:45', '111.65.47.147', '0', '1.4370085529610663', '103.84295110737516', '1.4378285662277226', '103.84486408717427', '2021-03-17 09:26:41', '2021-03-17 19:42:45', '2021-03-17 19:42:45', '10:16', '', 'Present'),
(217, 13, '2021-03-17', '2021-03-17 09:27:19', '119.56.106.112', '2021-03-17 18:46:53', '119.56.105.18', '0', '1.4380756889554542', '103.84471414598072', '1.4380163430301507', '103.84475343851861', '2021-03-17 09:27:19', '2021-03-17 18:46:53', '2021-03-17 18:46:53', '9:19', '', 'Present'),
(218, 13, '2021-03-17', '2021-03-17 09:27:20', '119.56.106.112', '2021-03-17 18:46:46', '119.56.105.18', '0', '1.4380756889554542', '103.84471414598072', '1.4380163430301507', '103.84475343851861', '2021-03-17 09:27:20', '2021-03-17 18:46:46', '2021-03-17 18:46:46', '9:19', '0:0', 'Present'),
(219, 15, '2021-03-17', '2021-03-17 09:27:38', '118.200.94.12', '2021-03-17 18:40:32', '118.200.94.12', '0', '1.4379977124646277', '103.84492759326416', '1.4380100369822562', '103.84489649354269', '2021-03-17 09:27:38', '2021-03-17 18:40:32', '2021-03-17 18:40:32', '9:12', '', 'Present'),
(220, 22, '2021-03-17', '2021-03-17 09:27:42', '119.56.100.170', '2021-03-18 09:30:44', '119.56.101.62', '0', '1.4365426716506067', '103.84219644566065', '1.4350849583427752', '103.82596052727644', '2021-03-17 09:27:42', '2021-03-18 09:30:44', '2021-03-18 09:30:44', '0:0', '', 'Present'),
(221, 21, '2021-03-17', '2021-03-17 09:30:46', '118.200.94.12', '2021-03-18 09:25:59', '118.200.94.12', '0', '1.4380678170392', '103.8448207905337', '1.4381282285023236', '103.8447803428934', '2021-03-17 09:30:46', '2021-03-18 09:25:59', '2021-03-18 09:25:59', '0:0', '', 'Present'),
(222, 18, '2021-03-17', '2021-03-17 09:34:11', '118.200.94.12', '2021-03-17 23:06:14', '119.56.103.189', '0', '1.4379476974413496', '103.84494549839674', '1.4290792650496769', '103.85259037232186', '2021-03-17 09:34:11', '2021-03-17 23:06:14', '2021-03-17 23:06:14', '13:32', '', 'Present'),
(223, 23, '2021-03-17', '2021-03-17 09:34:14', '111.65.36.182', '2021-03-17 23:05:44', '118.200.94.12', '0', '1.4399161', '103.8395572', '1.4379805', '103.844786', '2021-03-17 09:34:14', '2021-03-17 23:05:44', '2021-03-17 23:05:44', '13:31', '', 'Present'),
(224, 14, '2021-03-18', '2021-03-18 08:58:56', '111.65.46.138', '2021-03-18 23:21:29', '103.6.150.160', '0', '1.4370792', '103.8426577', '1.4444662', '103.807784', '2021-03-18 08:58:56', '2021-03-18 23:21:29', '2021-03-18 23:21:29', '14:22', '', 'Present'),
(225, 18, '2021-03-18', '2021-03-18 09:18:54', '118.200.94.12', '2021-03-18 22:03:02', '119.56.99.229', '0', '1.438206826201399', '103.844808115753', '1.438160221561747', '103.84512565689437', '2021-03-18 09:18:54', '2021-03-18 22:03:02', '2021-03-18 22:03:02', '12:44', '', 'Present'),
(226, 11, '2021-03-18', '2021-03-18 09:19:03', '111.65.44.126', '2021-03-19 09:15:05', '118.200.94.12', '0', '1.4377727756484684', '103.84467815986991', '1.437411797882768', '103.84468415033125', '2021-03-18 09:19:03', '2021-03-19 09:15:05', '2021-03-19 09:15:05', '0:0', '', 'Present'),
(227, 10, '2021-03-18', '2021-03-18 09:23:14', '118.200.94.12', '2021-03-18 19:01:32', '111.65.32.156', '0', '1.4364816', '103.8444306', '1.4379775', '103.8448403', '2021-03-18 09:23:14', '2021-03-18 19:01:32', '2021-03-18 19:01:32', '9:38', '', 'Present'),
(228, 12, '2021-03-18', '2021-03-18 09:24:23', '111.65.47.156', '2021-03-18 19:45:19', '111.65.47.156', '0', '1.4364284478602927', '103.84218401870815', '1.3403036515706952', '103.89390887131495', '2021-03-18 09:24:23', '2021-03-18 19:45:19', '2021-03-18 19:45:19', '10:20', '', 'Present'),
(229, 13, '2021-03-18', '2021-03-18 09:24:29', '119.56.105.168', '2021-03-18 18:38:05', '119.56.105.168', '0', '1.4380598074665727', '103.84470368307692', '1.438044755937197', '103.84472567151738', '2021-03-18 09:24:29', '2021-03-18 18:38:05', '2021-03-18 18:38:05', '9:13', '', 'Present'),
(230, 23, '2021-03-18', '2021-03-18 09:25:11', '118.200.94.12', '2021-03-18 18:29:10', '118.200.94.12', '0', '1.4379919', '103.844886', '1.4379861', '103.8448809', '2021-03-18 09:25:11', '2021-03-18 18:29:10', '2021-03-18 18:29:10', '9:3', '', 'Present'),
(231, 15, '2021-03-18', '2021-03-18 09:25:55', '183.90.36.116', '2021-03-19 00:23:32', '115.66.193.51', '0', '1.4373870288539423', '103.84468683223366', '1.412895434755464', '103.83738055866189', '2021-03-18 09:25:55', '2021-03-19 00:23:32', '2021-03-19 00:23:32', '0:0', '', 'Present'),
(232, 16, '2021-03-18', '2021-03-18 09:26:01', '118.200.94.12', '2021-03-19 09:09:22', '119.56.102.244', '0', '1.4378979199999995', '103.84474944999995', '1.4381114512613846', '103.84478759875641', '2021-03-18 09:26:01', '2021-03-19 09:09:22', '2021-03-19 09:09:22', '0:0', '', 'Present'),
(233, 21, '2021-03-18', '2021-03-18 09:26:09', '118.200.94.12', '2021-03-19 09:31:20', '118.200.94.12', '0', '1.438070535956326', '103.84487722243685', '1.4339262972825322', '103.83936286399246', '2021-03-18 09:26:09', '2021-03-19 09:31:20', '2021-03-19 09:31:20', '0:0', '', 'Present'),
(234, 19, '2021-03-18', '2021-03-18 09:27:40', '111.65.47.248', '2021-03-19 09:29:15', '118.200.94.12', '0', '1.4371047069095395', '103.8442662956613', '1.4379724003399734', '103.84496046030137', '2021-03-18 09:27:40', '2021-03-19 09:29:15', '2021-03-19 09:29:15', '0:0', '', 'Present'),
(235, 22, '2021-03-18', '2021-03-18 09:30:58', '119.56.101.62', '2021-03-18 21:43:22', '119.56.100.103', '0', '1.4350849583427752', '103.82596052727644', '1.4379446499999993', '103.84481810999996', '2021-03-18 09:30:58', '2021-03-18 21:43:22', '2021-03-18 21:43:22', '12:12', '', 'Present'),
(236, 14, '2021-03-19', '2021-03-19 07:50:05', '111.65.45.158', '2021-03-19 23:22:00', '111.65.45.158', '0', '1.4370953', '103.8431228', '1.4374204', '103.8431913', '2021-03-19 07:50:05', '2021-03-19 23:22:00', '2021-03-19 23:22:00', '15:31', '', 'Present'),
(237, 10, '2021-03-19', '2021-03-19 09:08:34', '118.200.94.12', '2021-03-22 09:15:21', '118.200.94.12', '0', '1.4378132', '103.8446036', '1.4380287', '103.84492', '2021-03-19 09:08:34', '2021-03-22 09:15:21', '2021-03-22 09:15:21', '0:0', '', 'Present'),
(238, 16, '2021-03-19', '2021-03-19 09:09:26', '119.56.102.244', '2021-03-22 09:24:51', '119.56.107.200', '0', '1.4379159609845935', '103.84494270964079', '1.437336294481565', '103.8448231450816', '2021-03-19 09:09:26', '2021-03-22 09:24:51', '2021-03-22 09:24:51', '0:0', '', 'Present'),
(239, 11, '2021-03-19', '2021-03-19 09:15:10', '118.200.94.12', '2021-03-20 10:20:28', '118.200.94.12', '0', '1.437584363173136', '103.8447549678418', '1.4378625645063066', '103.8449063219477', '2021-03-19 09:15:10', '2021-03-20 10:20:28', '2021-03-20 10:20:28', '0:0', '', 'Present'),
(240, 12, '2021-03-19', '2021-03-19 09:18:03', '111.65.47.156', '2021-03-19 19:04:49', '111.65.47.156', '0', '1.436834396638995', '103.8440664851802', '1.3586291112290112', '103.90281536148858', '2021-03-19 09:18:03', '2021-03-19 19:04:49', '2021-03-19 19:04:49', '9:46', '', 'Present'),
(241, 13, '2021-03-19', '2021-03-19 09:26:00', '119.56.105.48', '2021-03-20 09:57:28', '119.56.101.209', '0', '1.438080787277762', '103.84506119945333', '1.4379186076389405', '103.84489433282883', '2021-03-19 09:26:00', '2021-03-20 09:57:28', '2021-03-20 09:57:28', '0:0', '', 'Present'),
(242, 13, '2021-03-19', '2021-03-19 09:26:01', '119.56.105.48', '2021-03-20 09:57:23', '119.56.101.209', '0', '1.438080787277762', '103.84506119945333', '1.4378208235767374', '103.8447856880077', '2021-03-19 09:26:01', '2021-03-20 09:57:23', '2021-03-20 09:57:23', '0:0', '0:0', 'Present'),
(243, 22, '2021-03-19', '2021-03-19 09:28:06', '119.56.104.139', '2021-03-22 09:27:19', '119.56.109.215', '0', '1.4379843224160487', '103.8450455260651', '1.4383806513846342', '103.83247379710986', '2021-03-19 09:28:06', '2021-03-22 09:27:19', '2021-03-22 09:27:19', '0:0', '', 'Present'),
(244, 19, '2021-03-19', '2021-03-19 09:29:22', '118.200.94.12', '2021-03-19 18:25:50', '118.200.94.12', '0', '1.4380388424020856', '103.84486293592474', '1.4381242715627585', '103.8447676321187', '2021-03-19 09:29:22', '2021-03-19 18:25:50', '2021-03-19 18:25:50', '8:56', '', 'Present'),
(245, 18, '2021-03-19', '2021-03-19 09:30:20', '118.200.94.12', '2021-03-20 00:15:44', '119.56.103.243', '0', '1.4379281131542805', '103.84494413591662', '1.43794517495234', '103.84489498782311', '2021-03-19 09:30:20', '2021-03-20 00:15:44', '2021-03-20 00:15:44', '0:0', '', 'Present'),
(246, 21, '2021-03-19', '2021-03-19 09:31:39', '118.200.94.12', '2021-03-22 09:28:03', '118.200.94.12', '0', '1.4369767514175347', '103.84412460846457', '1.4383027325229008', '103.8445864301157', '2021-03-19 09:31:39', '2021-03-22 09:28:03', '2021-03-22 09:28:03', '0:0', '', 'Present'),
(247, 23, '2021-03-19', '2021-03-19 09:34:39', '118.200.94.12', '2021-03-20 00:17:52', '111.65.36.22', '0', '1.4379614', '103.844775', '1.4379573', '103.8447542', '2021-03-19 09:34:39', '2021-03-20 00:17:52', '2021-03-20 00:17:52', '0:0', '', 'Present'),
(248, 14, '2021-03-20', '2021-03-20 08:56:41', '111.65.45.176', '2021-03-20 18:23:00', '111.65.45.176', '0', '1.4360471', '103.8421053', '1.4292377', '103.8351121', '2021-03-20 08:56:41', '2021-03-20 18:23:00', '2021-03-20 18:23:00', '9:26', '', 'Present'),
(249, 15, '2021-03-20', '2021-03-20 09:56:24', '183.90.37.49', '2021-03-22 09:25:33', '118.200.94.12', '0', '1.4365250355068864', '103.84246327990517', '1.4377195059694319', '103.84476655513889', '2021-03-20 09:56:24', '2021-03-22 09:25:33', '2021-03-22 09:25:33', '0:0', '', 'Present'),
(250, 13, '2021-03-20', '2021-03-20 09:57:42', '119.56.101.209', '2021-03-22 09:20:54', '119.56.103.191', '0', '1.4380744159992176', '103.84485483909758', '1.4380754229699242', '103.84473320500891', '2021-03-20 09:57:42', '2021-03-22 09:20:54', '2021-03-22 09:20:54', '0:0', '', 'Present'),
(251, 12, '2021-03-20', '2021-03-20 09:59:58', '111.65.47.143', '2021-03-20 20:47:03', '111.65.47.143', '0', '1.430968442612098', '103.8500940473841', '1.3246196034575772', '103.92978504827357', '2021-03-20 09:59:58', '2021-03-20 20:47:03', '2021-03-20 20:47:03', '10:47', '', 'Present'),
(252, 11, '2021-03-20', '2021-03-20 10:20:36', '118.200.94.12', '2021-03-22 09:05:35', '118.200.94.12', '0', '1.4375268166188373', '103.84459811876823', '1.43795719904127', '103.84503130578328', '2021-03-20 10:20:36', '2021-03-22 09:05:35', '2021-03-22 09:05:35', '0:0', '', 'Present'),
(253, 14, '2021-03-22', '2021-03-22 08:50:35', '111.65.45.188', '2021-03-22 21:00:25', '111.65.45.188', '0', '1.4343783', '103.8421117', '1.4379743', '103.8448051', '2021-03-22 08:50:35', '2021-03-22 21:00:25', '2021-03-22 21:00:25', '12:9', '', 'Present'),
(254, 11, '2021-03-22', '2021-03-22 09:05:49', '118.200.94.12', '2021-03-23 09:22:15', '118.200.94.12', '0', '1.438073783610463', '103.84486253256986', '1.4379341272032518', '103.84499088226816', '2021-03-22 09:05:49', '2021-03-23 09:22:15', '2021-03-23 09:22:15', '0:0', '', 'Present'),
(255, 10, '2021-03-22', '2021-03-22 09:15:26', '118.200.94.12', '2021-03-22 19:49:34', '111.65.34.207', '0', '1.4380287', '103.84492', '1.4158769', '103.8957703', '2021-03-22 09:15:26', '2021-03-22 19:49:34', '2021-03-22 19:49:34', '10:34', '', 'Present'),
(256, 19, '2021-03-22', '2021-03-22 09:19:28', '111.65.46.131', '2021-03-22 09:23:07', '118.200.94.12', '0', '1.4372544178608861', '103.84324658130497', '1.4380425855226147', '103.84492258403323', '2021-03-22 09:19:28', '2021-03-22 09:23:07', '2021-03-22 09:23:07', '0:3', '', 'Present'),
(257, 13, '2021-03-22', '2021-03-22 09:20:57', '119.56.103.191', '2021-03-22 18:32:15', '119.56.109.104', '0', '1.4380754229699242', '103.84473320500891', '1.4379038572620157', '103.84480950717648', '2021-03-22 09:20:57', '2021-03-22 18:32:15', '2021-03-22 18:32:15', '9:11', '', 'Present'),
(258, 12, '2021-03-22', '2021-03-22 09:22:59', '111.65.47.187', '2021-03-23 08:25:48', '111.65.34.73', '0', '1.4375429997056453', '103.8445739957577', '1.3370321304154769', '103.9211102062931', '2021-03-22 09:22:59', '2021-03-23 08:25:48', '2021-03-23 08:25:48', '0:0', '', 'Present'),
(259, 19, '2021-03-22', '2021-03-22 09:23:10', '118.200.94.12', '2021-03-23 00:07:40', '118.189.208.2', '0', '1.4379769698789397', '103.84498356969195', '1.4208620845351414', '103.83166991256464', '2021-03-22 09:23:10', '2021-03-23 00:07:40', '2021-03-23 00:07:40', '0:0', '0:0', 'Present'),
(260, 18, '2021-03-22', '2021-03-22 09:23:23', '118.200.94.12', '2021-03-22 23:43:43', '119.56.96.35', '0', '1.4379660498964517', '103.8450257601176', '1.4380272428888006', '103.84495439584683', '2021-03-22 09:23:23', '2021-03-22 23:43:43', '2021-03-22 23:43:43', '14:20', '', 'Present'),
(261, 16, '2021-03-22', '2021-03-22 09:24:55', '119.56.107.200', '2021-03-23 09:27:48', '119.56.110.246', '0', '1.4377046659010113', '103.84498591229377', '1.438208618808361', '103.84479269372386', '2021-03-22 09:24:55', '2021-03-23 09:27:48', '2021-03-23 09:27:48', '0:0', '', 'Present'),
(262, 15, '2021-03-22', '2021-03-22 09:25:38', '118.200.94.12', '2021-03-23 09:27:44', '183.90.37.173', '0', '1.4377195059694319', '103.84476655513889', '1.4371743414256588', '103.84249796669151', '2021-03-22 09:25:38', '2021-03-23 09:27:44', '2021-03-23 09:27:44', '0:0', '', 'Present'),
(263, 22, '2021-03-22', '2021-03-22 09:27:30', '119.56.109.215', '2021-03-22 18:32:40', '119.56.103.131', '0', '1.4383806513846342', '103.83247379710986', '1.4355982289569518', '103.84316482755948', '2021-03-22 09:27:30', '2021-03-22 18:32:40', '2021-03-22 18:32:40', '9:5', '', 'Present'),
(264, 21, '2021-03-22', '2021-03-22 09:28:08', '118.200.94.12', '2021-03-22 18:16:12', '119.56.97.194', '0', '1.438096954790561', '103.8447951848735', '1.4382670894384966', '103.84465797204831', '2021-03-22 09:28:08', '2021-03-22 18:16:12', '2021-03-22 18:16:12', '8:48', '', 'Present'),
(265, 23, '2021-03-22', '2021-03-22 09:36:40', '111.65.36.57', '2021-03-22 23:43:27', '111.65.36.55', '0', '1.4372741', '103.8416735', '1.4380277', '103.8448857', '2021-03-22 09:36:40', '2021-03-22 23:43:27', '2021-03-22 23:43:27', '14:6', '', 'Present'),
(266, 14, '2021-03-23', '2021-03-23 08:42:17', '111.65.45.189', '2021-03-23 21:00:41', '111.65.44.163', '0', '1.4376226', '103.843733', '1.4324159', '103.8401871', '2021-03-23 08:42:17', '2021-03-23 21:00:41', '2021-03-23 21:00:41', '12:18', '', 'Present'),
(267, 12, '2021-03-23', '2021-03-23 09:18:28', '111.65.34.73', '2021-03-24 07:32:22', '121.6.126.18', '0', '1.4381922530309434', '103.844411740572', '1.3373241792713146', '103.92222051283507', '2021-03-23 09:18:28', '2021-03-24 07:32:22', '2021-03-24 07:32:22', '0:0', '', 'Present'),
(268, 11, '2021-03-23', '2021-03-23 09:22:20', '118.200.94.12', '2021-03-23 19:00:07', '118.200.94.12', '0', '1.4379970657380812', '103.84502423005097', '1.4379701912258596', '103.84500728727713', '2021-03-23 09:22:20', '2021-03-23 19:00:07', '2021-03-23 19:00:07', '9:37', '', 'Present'),
(269, 10, '2021-03-23', '2021-03-23 09:24:37', '118.200.94.12', '2021-03-23 19:21:48', '111.65.70.233', '0', '1.4377533', '103.8445174', '1.4380096', '103.8446917', '2021-03-23 09:24:37', '2021-03-23 19:21:48', '2021-03-23 19:21:48', '9:57', '', 'Present'),
(270, 22, '2021-03-23', '2021-03-23 09:26:11', '119.56.100.113', '2021-03-24 09:28:14', '118.200.94.12', '0', '1.4394775962825446', '103.8355355807765', '1.4380857808554324', '103.84485671778904', '2021-03-23 09:26:11', '2021-03-24 09:28:14', '2021-03-24 09:28:14', '0:0', '', 'Present'),
(271, 15, '2021-03-23', '2021-03-23 09:27:48', '183.90.37.173', '2021-03-24 09:24:06', '183.90.37.173', '0', '1.4371743414256588', '103.84249796669151', '1.4383451987328713', '103.84451524520863', '2021-03-23 09:27:48', '2021-03-24 09:24:06', '2021-03-24 09:24:06', '0:0', '', 'Present'),
(272, 16, '2021-03-23', '2021-03-23 09:27:52', '119.56.110.246', '2021-03-24 09:23:39', '119.56.110.167', '0', '1.4382284106195697', '103.84472397358518', '1.43824516344277', '103.84424867013828', '2021-03-23 09:27:52', '2021-03-24 09:23:39', '2021-03-24 09:23:39', '0:0', '', 'Present'),
(273, 21, '2021-03-23', '2021-03-23 09:30:36', '118.200.94.12', '2021-03-25 09:26:33', '118.200.94.12', '0', '1.4379373098019559', '103.84492183138592', '1.4379541444672874', '103.84515233140624', '2021-03-23 09:30:36', '2021-03-25 09:26:33', '2021-03-25 09:26:33', '0:0', '', 'Present'),
(274, 19, '2021-03-23', '2021-03-23 09:30:38', '118.200.94.12', '2021-03-23 18:24:27', '111.65.46.131', '0', '1.4379465912064306', '103.84500128217576', '1.4371376899935822', '103.84297794510488', '2021-03-23 09:30:38', '2021-03-23 18:24:27', '2021-03-23 18:24:27', '8:53', '', 'Present'),
(275, 13, '2021-03-23', '2021-03-23 09:32:45', '119.56.108.0', '2021-03-24 09:21:56', '119.56.98.250', '0', '1.4367176547175942', '103.84491566235928', '1.4380896843744186', '103.84476674564772', '2021-03-23 09:32:45', '2021-03-24 09:21:56', '2021-03-24 09:21:56', '0:0', '', 'Present'),
(276, 23, '2021-03-23', '2021-03-23 23:20:21', '111.65.36.46', '2021-03-23 23:20:24', '111.65.36.46', '0', '1.4379903', '103.8448488', '1.4379903', '103.8448488', '2021-03-23 23:20:21', '2021-03-23 23:20:24', '2021-03-23 23:20:24', '0:0', '', 'Present'),
(277, 18, '2021-03-23', '2021-03-23 23:20:48', '118.200.94.12', '2021-03-23 23:20:50', '118.200.94.12', '0', '1.4379504631697138', '103.84507512564787', '1.4370535471009582', '103.84426032589636', '2021-03-23 23:20:48', '2021-03-23 23:20:50', '2021-03-23 23:20:50', '0:0', '', 'Present'),
(278, 14, '2021-03-24', '2021-03-24 08:55:14', '111.65.44.178', '2021-03-24 21:22:17', '111.65.44.178', '0', '1.4362619', '103.8421766', '1.43798', '103.8447639', '2021-03-24 08:55:14', '2021-03-24 21:22:17', '2021-03-24 21:22:17', '12:27', '', 'Present'),
(279, 11, '2021-03-24', '2021-03-24 09:13:40', '118.200.94.12', '2021-03-24 18:20:48', '118.200.94.12', '0', '1.4380119565716676', '103.84499947715705', '1.4380859263485533', '103.84485269645339', '2021-03-24 09:13:40', '2021-03-24 18:20:48', '2021-03-24 18:20:48', '9:7', '', 'Present'),
(280, 13, '2021-03-24', '2021-03-24 09:22:01', '119.56.98.250', '2021-03-26 09:26:01', '119.56.99.72', '0', '1.4380723988593098', '103.84474919909539', '1.4380441572719687', '103.84483402024566', '2021-03-24 09:22:01', '2021-03-26 09:26:01', '2021-03-26 09:26:01', '0:0', '', 'Present'),
(281, 13, '2021-03-24', '2021-03-24 09:22:01', '119.56.98.250', '2021-03-26 09:25:46', '119.56.99.72', '0', '1.4380723988593098', '103.84474919909539', '1.4379207674587837', '103.84486941635632', '2021-03-24 09:22:01', '2021-03-26 09:25:46', '2021-03-26 09:25:46', '0:0', '0:0', 'Present'),
(282, 13, '2021-03-24', '2021-03-24 09:22:02', '119.56.98.250', '2021-03-25 09:22:54', '119.56.97.142', '0', '1.4380723988593098', '103.84474919909539', '1.4380881115816535', '103.84481108526204', '2021-03-24 09:22:02', '2021-03-25 09:22:54', '2021-03-25 09:22:54', '0:0', '0:0', 'Present'),
(283, 13, '2021-03-24', '2021-03-24 09:22:02', '119.56.98.250', '2021-03-25 09:22:43', '119.56.97.142', '0', '1.4380723988593098', '103.84474919909539', '1.4380989974216591', '103.84472133323347', '2021-03-24 09:22:02', '2021-03-25 09:22:43', '2021-03-25 09:22:43', '0:0', '0:0', 'Present'),
(284, 13, '2021-03-24', '2021-03-24 09:22:02', '119.56.98.250', '2021-03-24 18:30:45', '119.56.96.86', '0', '1.4380723988593098', '103.84474919909539', '1.4380337290820555', '103.84483962923481', '2021-03-24 09:22:02', '2021-03-24 18:30:45', '2021-03-24 18:30:45', '9:8', '0:0', 'Present'),
(285, 16, '2021-03-24', '2021-03-24 09:23:42', '119.56.110.167', '2021-03-25 09:28:24', '118.200.94.12', '0', '1.438395045653594', '103.84432723128454', '1.4380080272022713', '103.84503482172498', '2021-03-24 09:23:42', '2021-03-25 09:28:24', '2021-03-25 09:28:24', '0:0', '', 'Present'),
(286, 15, '2021-03-24', '2021-03-24 09:24:10', '183.90.37.173', '2021-03-24 18:49:46', '118.200.94.12', '0', '1.4381808175005883', '103.84464745560784', '1.4378065034528025', '103.84475547607396', '2021-03-24 09:24:10', '2021-03-24 18:49:46', '2021-03-24 18:49:46', '9:25', '', 'Present'),
(287, 12, '2021-03-24', '2021-03-24 09:24:42', '111.65.34.120', '2021-03-25 09:11:41', '111.65.34.119', '0', '1.4373501498510222', '103.84444129050121', '1.4358193693612047', '103.83626146562433', '2021-03-24 09:24:42', '2021-03-25 09:11:41', '2021-03-25 09:11:41', '0:0', '', 'Present'),
(288, 19, '2021-03-24', '2021-03-24 09:27:30', '111.65.46.131', '2021-03-24 19:15:25', '111.65.68.170', '0', '1.4368819774451695', '103.84434102175372', '1.3754761869115806', '103.82848513001426', '2021-03-24 09:27:30', '2021-03-24 19:15:25', '2021-03-24 19:15:25', '9:47', '', 'Present'),
(289, 22, '2021-03-24', '2021-03-24 09:28:19', '118.200.94.12', '2021-03-24 18:50:22', '119.56.102.135', '0', '1.4380887933275126', '103.84485298056136', '1.4379202114706122', '103.84478181558673', '2021-03-24 09:28:19', '2021-03-24 18:50:22', '2021-03-24 18:50:22', '9:22', '', 'Present'),
(290, 10, '2021-03-24', '2021-03-24 09:29:15', '111.65.47.188', '2021-03-25 09:19:29', '111.65.47.139', '0', '1.4378553', '103.8452046', '1.4366781', '103.8441934', '2021-03-24 09:29:15', '2021-03-25 09:19:29', '2021-03-25 09:19:29', '0:0', '', 'Present'),
(291, 18, '2021-03-24', '2021-03-24 09:34:47', '119.56.104.255', '2021-03-24 18:32:18', '118.200.94.12', '0', '1.4377161965793097', '103.84483706445481', '1.43805394120503', '103.84492304745054', '2021-03-24 09:34:47', '2021-03-24 18:32:18', '2021-03-24 18:32:18', '8:57', '', 'Present'),
(292, 23, '2021-03-24', '2021-03-24 09:35:35', '118.200.94.12', '2021-03-24 22:55:24', '111.65.36.9', '0', '1.4379853', '103.844824', '1.4379016', '103.8447133', '2021-03-24 09:35:35', '2021-03-24 22:55:24', '2021-03-24 22:55:24', '13:19', '', 'Present'),
(293, 14, '2021-03-25', '2021-03-25 09:02:43', '111.65.44.164', '2021-03-25 21:46:00', '118.200.94.12', '0', '1.4373833', '103.8436093', '1.4379825', '103.8448128', '2021-03-25 09:02:43', '2021-03-25 21:46:00', '2021-03-25 21:46:00', '12:43', '', 'Present'),
(294, 10, '2021-03-25', '2021-03-25 09:19:42', '118.200.94.12', '2021-03-29 09:17:46', '118.200.94.12', '0', '1.437979', '103.8447697', '1.4360253', '103.8446322', '2021-03-25 09:19:42', '2021-03-29 09:17:46', '2021-03-29 09:17:46', '0:0', '', 'Present'),
(295, 18, '2021-03-25', '2021-03-25 09:20:45', '119.56.110.110', '2021-03-25 23:59:38', '118.200.94.12', '0', '1.4377242596138056', '103.84508554500655', '1.4379691749633547', '103.8450054853865', '2021-03-25 09:20:45', '2021-03-25 23:59:38', '2021-03-25 23:59:38', '14:38', '', 'Present'),
(296, 12, '2021-03-25', '2021-03-25 09:22:17', '111.65.34.119', '2021-03-26 08:24:45', '111.65.34.119', '0', '1.4374980152126702', '103.84452784487837', '1.336986692138114', '103.92109220273214', '2021-03-25 09:22:17', '2021-03-26 08:24:45', '2021-03-26 08:24:45', '0:0', '', 'Present'),
(297, 15, '2021-03-25', '2021-03-25 09:23:19', '183.90.37.173', '2021-03-26 09:32:39', '183.90.37.49', '0', '1.4380174108508985', '103.8447808959606', '1.437530844729622', '103.84333934736821', '2021-03-25 09:23:19', '2021-03-26 09:32:39', '2021-03-26 09:32:39', '0:0', '', 'Present'),
(298, 21, '2021-03-25', '2021-03-25 09:26:39', '118.200.94.12', '2021-03-26 09:25:53', '118.200.94.12', '0', '1.4380458022920435', '103.84487122097069', '1.438119359382947', '103.8448403245532', '2021-03-25 09:26:39', '2021-03-26 09:25:53', '2021-03-26 09:25:53', '0:0', '', 'Present'),
(299, 16, '2021-03-25', '2021-03-25 09:28:28', '118.200.94.12', '2021-03-26 09:22:30', '119.56.109.182', '0', '1.4380080272022713', '103.84503482172498', '1.4383990635802237', '103.84461027914493', '2021-03-25 09:28:28', '2021-03-26 09:22:30', '2021-03-26 09:22:30', '0:0', '', 'Present'),
(300, 22, '2021-03-25', '2021-03-25 09:28:33', '119.56.96.105', '2021-03-26 09:27:26', '119.56.96.119', '0', '1.4372053517544692', '103.83015203656281', '1.4351096428599142', '103.82595554359264', '2021-03-25 09:28:33', '2021-03-26 09:27:26', '2021-03-26 09:27:26', '0:0', '', 'Present'),
(301, 19, '2021-03-25', '2021-03-25 09:29:28', '111.65.68.170', '2021-03-26 09:32:23', '118.200.94.12', '0', '1.4372168876804907', '103.84424949289428', '1.4379870857649282', '103.84500053089985', '2021-03-25 09:29:28', '2021-03-26 09:32:23', '2021-03-26 09:32:23', '0:0', '', 'Present'),
(302, 11, '2021-03-25', '2021-03-25 09:29:49', '118.200.94.12', '2021-03-26 09:14:31', '118.200.94.12', '0', '1.438073922218258', '103.8448333345057', '1.4380218141005183', '103.84489255866593', '2021-03-25 09:29:49', '2021-03-26 09:14:31', '2021-03-26 09:14:31', '0:0', '', 'Present'),
(303, 14, '2021-03-26', '2021-03-26 08:16:24', '111.65.44.172', '2021-03-27 08:01:52', '111.65.44.143', '0', '1.437313', '103.8439196', '1.4379557', '103.8440365', '2021-03-26 08:16:24', '2021-03-27 08:01:52', '2021-03-27 08:01:52', '0:0', '', 'Present'),
(304, 11, '2021-03-26', '2021-03-26 09:14:44', '118.200.94.12', '2021-03-27 13:39:11', '118.200.94.12', '0', '1.4379872750546123', '103.84497931925776', '1.4379786969646577', '103.8450113168384', '2021-03-26 09:14:44', '2021-03-27 13:39:11', '2021-03-27 13:39:11', '0:0', '', 'Present'),
(305, 18, '2021-03-26', '2021-03-26 09:20:54', '119.56.104.30', '2021-03-26 22:20:13', '119.56.111.72', '0', '1.4377412254622446', '103.84489090509227', '1.4382264414508514', '103.84511139493698', '2021-03-26 09:20:54', '2021-03-26 22:20:13', '2021-03-26 22:20:13', '12:59', '', 'Present'),
(306, 16, '2021-03-26', '2021-03-26 09:22:33', '118.200.94.12', '2021-03-27 09:56:18', '118.200.94.12', '0', '1.438386629020691', '103.84472802739533', '1.438040492769366', '103.84492574293635', '2021-03-26 09:22:33', '2021-03-27 09:56:18', '2021-03-27 09:56:18', '0:0', '', 'Present'),
(307, 21, '2021-03-26', '2021-03-26 09:26:06', '118.200.94.12', '2021-03-31 09:29:39', '118.200.94.12', '0', '1.438119359382947', '103.8448403245532', '1.4380504835773937', '103.84488155657543', '2021-03-26 09:26:06', '2021-03-31 09:29:39', '2021-03-31 09:29:39', '0:0', '', 'Present'),
(308, 13, '2021-03-26', '2021-03-26 09:26:13', '119.56.99.72', '2021-03-26 19:04:50', '119.56.102.102', '0', '1.4380448521834162', '103.84477996514939', '1.4379539504078882', '103.84484603556692', '2021-03-26 09:26:13', '2021-03-26 19:04:50', '2021-03-26 19:04:50', '9:38', '', 'Present'),
(309, 22, '2021-03-26', '2021-03-26 09:27:33', '119.56.96.119', '2021-03-26 18:38:25', '119.56.97.91', '0', '1.4351096428599142', '103.82595554359264', '1.4371646151114492', '103.84363294420072', '2021-03-26 09:27:33', '2021-03-26 18:38:25', '2021-03-26 18:38:25', '9:10', '', 'Present'),
(310, 12, '2021-03-26', '2021-03-26 09:28:54', '111.65.34.119', '2021-03-29 08:41:51', '111.65.45.24', '0', '1.4357711076178057', '103.84394504401594', '1.4399732764155664', '103.83956604780724', '2021-03-26 09:28:54', '2021-03-29 08:41:51', '2021-03-29 08:41:51', '0:0', '', 'Present'),
(311, 19, '2021-03-26', '2021-03-26 09:32:26', '118.200.94.12', '2021-03-26 19:22:57', '111.65.69.51', '0', '1.4379645433479498', '103.84497742843352', '1.305344857634947', '103.84017368062983', '2021-03-26 09:32:26', '2021-03-26 19:22:57', '2021-03-26 19:22:57', '9:50', '', 'Present'),
(312, 15, '2021-03-26', '2021-03-26 09:32:44', '183.90.37.49', '2021-03-26 18:30:29', '118.200.94.12', '0', '1.437530844729622', '103.84333934736821', '1.4379490462495985', '103.84497942112395', '2021-03-26 09:32:44', '2021-03-26 18:30:29', '2021-03-26 18:30:29', '8:57', '', 'Present'),
(313, 23, '2021-03-26', '2021-03-26 09:32:53', '118.200.94.12', '2021-03-26 22:15:18', '111.65.36.57', '0', '1.4379813', '103.8447771', '1.437987', '103.8448274', '2021-03-26 09:32:53', '2021-03-26 22:15:18', '2021-03-26 22:15:18', '12:42', '', 'Present'),
(314, 14, '2021-03-27', '2021-03-27 08:02:07', '111.65.44.143', '2021-03-27 20:25:42', '111.65.44.143', '0', '1.4379557', '103.8440365', '1.4379988', '103.844856', '2021-03-27 08:02:07', '2021-03-27 20:25:42', '2021-03-27 20:25:42', '12:23', '', 'Present'),
(315, 16, '2021-03-27', '2021-03-27 09:56:21', '118.200.94.12', '2021-03-29 09:26:07', '118.200.94.12', '0', '1.4380337279381454', '103.84493708983662', '1.4379391027299786', '103.84487851814322', '2021-03-27 09:56:21', '2021-03-29 09:26:07', '2021-03-29 09:26:07', '0:0', '', 'Present'),
(316, 22, '2021-03-27', '2021-03-27 10:04:13', '119.56.102.73', '2021-04-12 09:26:53', '118.200.94.12', '0', '1.4409907129212853', '103.83916982432977', '1.4376624253689225', '103.84468442592181', '2021-03-27 10:04:13', '2021-04-12 09:26:53', '2021-04-12 09:26:53', '0:0', '', 'Present'),
(317, 14, '2021-03-29', '2021-03-29 08:30:36', '111.65.44.189', '2021-03-29 19:28:38', '111.65.44.189', '0', '1.4371342', '103.8430787', '1.4379765', '103.8447624', '2021-03-29 08:30:36', '2021-03-29 19:28:38', '2021-03-29 19:28:38', '10:58', '', 'Present'),
(318, 12, '2021-03-29', '2021-03-29 09:15:39', '111.65.45.24', '2021-03-29 22:45:24', '121.6.126.18', '0', '1.4374428413721538', '103.84445805107934', '1.3373554285978346', '103.92228002955953', '2021-03-29 09:15:39', '2021-03-29 22:45:24', '2021-03-29 22:45:24', '13:29', '', 'Present'),
(319, 11, '2021-03-29', '2021-03-29 09:16:07', '118.200.94.12', '2021-03-30 09:15:43', '118.200.94.12', '0', '1.4378076994432025', '103.84502463704258', '1.4380186821982408', '103.84494945769762', '2021-03-29 09:16:07', '2021-03-30 09:15:43', '2021-03-30 09:15:43', '0:0', '', 'Present'),
(320, 10, '2021-03-29', '2021-03-29 09:17:53', '118.200.94.12', '2021-03-30 09:24:08', '118.200.94.12', '0', '1.4360253', '103.8446322', '1.4379627', '103.844735', '2021-03-29 09:17:53', '2021-03-30 09:24:08', '2021-03-30 09:24:08', '0:0', '', 'Present'),
(321, 13, '2021-03-29', '2021-03-29 09:18:42', '119.56.101.52', '2021-03-30 09:17:08', '119.56.97.98', '0', '1.4381032443845903', '103.84479600853871', '1.4378365620148985', '103.84472621774441', '2021-03-29 09:18:42', '2021-03-30 09:17:08', '2021-03-30 09:17:08', '0:0', '', 'Present'),
(322, 13, '2021-03-29', '2021-03-29 09:18:42', '119.56.101.52', '2021-03-29 18:32:01', '119.56.100.230', '0', '1.4381032443845903', '103.84479600853871', '1.4377729629002645', '103.84465868049624', '2021-03-29 09:18:42', '2021-03-29 18:32:01', '2021-03-29 18:32:01', '9:13', '0:0', 'Present'),
(323, 18, '2021-03-29', '2021-03-29 09:21:52', '118.200.94.12', '2021-03-29 23:47:22', '118.200.94.12', '0', '1.437644977136351', '103.84470856823248', '1.4376389652678634', '103.84468830409823', '2021-03-29 09:21:52', '2021-03-29 23:47:22', '2021-03-29 23:47:22', '14:25', '', 'Present'),
(324, 16, '2021-03-29', '2021-03-29 09:26:11', '118.200.94.12', '2021-03-30 09:24:36', '119.56.98.79', '0', '1.4379741320723889', '103.84504495132555', '1.4375768630334047', '103.84511231026107', '2021-03-29 09:26:11', '2021-03-30 09:24:36', '2021-03-30 09:24:36', '0:0', '', 'Present'),
(325, 23, '2021-03-29', '2021-03-29 09:28:32', '118.200.94.12', '2021-03-29 23:47:30', '111.65.36.52', '0', '1.4371994', '103.8446322', '1.4379877', '103.8447664', '2021-03-29 09:28:32', '2021-03-29 23:47:30', '2021-03-29 23:47:30', '14:18', '', 'Present'),
(326, 19, '2021-03-29', '2021-03-29 09:36:59', '111.65.45.105', '2021-03-29 18:32:26', '111.65.45.105', '0', '1.4372126632002908', '103.84432192047692', '1.4143471370181906', '103.82362015255494', '2021-03-29 09:36:59', '2021-03-29 18:32:26', '2021-03-29 18:32:26', '8:55', '', 'Present'),
(327, 15, '2021-03-29', '2021-03-29 10:05:32', '183.90.37.37', '2021-03-29 18:39:41', '183.90.37.37', '0', '1.4372933098980107', '103.84507492238929', '1.4344442588848763', '103.84244631706558', '2021-03-29 10:05:32', '2021-03-29 18:39:41', '2021-03-29 18:39:41', '8:34', '', 'Present'),
(328, 11, '2021-03-30', '2021-03-30 09:15:55', '118.200.94.12', '2021-03-31 09:12:23', '118.200.94.12', '0', '1.4379918413635409', '103.84491276591748', '1.4379484626034156', '103.84495070980375', '2021-03-30 09:15:55', '2021-03-31 09:12:23', '2021-03-31 09:12:23', '0:0', '', 'Present'),
(329, 13, '2021-03-30', '2021-03-30 09:17:13', '119.56.97.98', '2021-03-31 09:27:18', '119.56.97.120', '0', '1.4380388082204965', '103.84483484467945', '1.438059539305492', '103.84480257065798', '2021-03-30 09:17:13', '2021-03-31 09:27:18', '2021-03-31 09:27:18', '0:0', '', 'Present'),
(330, 13, '2021-03-30', '2021-03-30 09:17:13', '119.56.97.98', '2021-03-31 09:25:38', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4380578943058384', '103.84482794953138', '2021-03-30 09:17:13', '2021-03-31 09:25:38', '2021-03-31 09:25:38', '0:0', '0:0', 'Present'),
(331, 13, '2021-03-30', '2021-03-30 09:17:13', '119.56.97.98', '2021-03-31 09:25:22', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.438113083782251', '103.84493214942138', '2021-03-30 09:17:13', '2021-03-31 09:25:22', '2021-03-31 09:25:22', '0:0', '0:0', 'Present'),
(332, 13, '2021-03-30', '2021-03-30 09:17:13', '119.56.97.98', '2021-03-31 09:25:08', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.438113083782251', '103.84493214942138', '2021-03-30 09:17:13', '2021-03-31 09:25:08', '2021-03-31 09:25:08', '0:0', '0:0', 'Present'),
(333, 13, '2021-03-30', '2021-03-30 09:17:14', '119.56.97.98', '2021-03-31 09:24:52', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4377721892043618', '103.84467352575848', '2021-03-30 09:17:14', '2021-03-31 09:24:52', '2021-03-31 09:24:52', '0:0', '0:0', 'Present'),
(334, 13, '2021-03-30', '2021-03-30 09:17:14', '119.56.97.98', '2021-03-31 09:24:37', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.437725047489608', '103.84464951921495', '2021-03-30 09:17:14', '2021-03-31 09:24:37', '2021-03-31 09:24:37', '0:0', '0:0', 'Present'),
(335, 13, '2021-03-30', '2021-03-30 09:17:14', '119.56.97.98', '2021-03-31 09:24:19', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4380327725486393', '103.84480478265083', '2021-03-30 09:17:14', '2021-03-31 09:24:19', '2021-03-31 09:24:19', '0:0', '0:0', 'Present'),
(336, 13, '2021-03-30', '2021-03-30 09:17:14', '119.56.97.98', '2021-03-31 09:24:04', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4379889169333184', '103.84473196583036', '2021-03-30 09:17:14', '2021-03-31 09:24:04', '2021-03-31 09:24:04', '0:0', '0:0', 'Present'),
(337, 13, '2021-03-30', '2021-03-30 09:17:15', '119.56.97.98', '2021-03-31 09:23:51', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4379793155100313', '103.84478267702578', '2021-03-30 09:17:15', '2021-03-31 09:23:51', '2021-03-31 09:23:51', '0:0', '0:0', 'Present'),
(338, 13, '2021-03-30', '2021-03-30 09:17:15', '119.56.97.98', '2021-03-31 09:23:29', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4380212810358213', '103.8447944638734', '2021-03-30 09:17:15', '2021-03-31 09:23:29', '2021-03-31 09:23:29', '0:0', '0:0', 'Present'),
(339, 13, '2021-03-30', '2021-03-30 09:17:15', '119.56.97.98', '2021-03-31 09:23:23', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.4380508959775367', '103.84478932352246', '2021-03-30 09:17:15', '2021-03-31 09:23:23', '2021-03-31 09:23:23', '0:0', '0:0', 'Present'),
(340, 13, '2021-03-30', '2021-03-30 09:17:15', '119.56.97.98', '2021-03-31 09:23:13', '119.56.111.131', '0', '1.4380388082204965', '103.84483484467945', '1.438014613487528', '103.84475992830755', '2021-03-30 09:17:15', '2021-03-31 09:23:13', '2021-03-31 09:23:13', '0:0', '0:0', 'Present'),
(341, 12, '2021-03-30', '2021-03-30 09:22:15', '111.65.45.24', '2021-03-31 07:51:48', '121.6.126.18', '0', '1.4374487704062753', '103.84450027373153', '1.3373064690612881', '103.92241155596831', '2021-03-30 09:22:15', '2021-03-31 07:51:48', '2021-03-31 07:51:48', '0:0', '', 'Present'),
(342, 10, '2021-03-30', '2021-03-30 09:24:14', '118.200.94.12', '2021-03-31 09:13:53', '111.65.70.130', '0', '1.4379627', '103.844735', '1.4106026', '103.9003091', '2021-03-30 09:24:14', '2021-03-31 09:13:53', '2021-03-31 09:13:53', '0:0', '', 'Present'),
(343, 18, '2021-03-30', '2021-03-30 09:24:32', '118.200.94.12', '2021-03-30 23:50:06', '118.200.94.12', '0', '1.4379307006644084', '103.84486662517082', '1.437707671982848', '103.84487680435655', '2021-03-30 09:24:32', '2021-03-30 23:50:06', '2021-03-30 23:50:06', '14:25', '', 'Present'),
(344, 16, '2021-03-30', '2021-03-30 09:24:39', '119.56.98.79', '2021-04-01 11:41:47', '119.56.97.212', '0', '1.4378528147915328', '103.84488845320521', '1.4380788356593959', '103.84483603151195', '2021-03-30 09:24:39', '2021-04-01 11:41:47', '2021-04-01 11:41:47', '0:0', '', 'Present'),
(345, 15, '2021-03-30', '2021-03-30 09:25:08', '118.200.94.12', '2021-03-30 18:32:06', '122.11.212.21', '0', '1.4379135954383264', '103.84481761612305', '1.4374410733356109', '103.84454935610685', '2021-03-30 09:25:08', '2021-03-30 18:32:06', '2021-03-30 18:32:06', '9:6', '', 'Present'),
(346, 14, '2021-03-30', '2021-03-30 09:26:13', '111.65.44.178', '2021-03-30 22:51:09', '111.65.44.169', '0', '1.4362184', '103.8421915', '1.4379931', '103.8447442', '2021-03-30 09:26:13', '2021-03-30 22:51:09', '2021-03-30 22:51:09', '13:24', '', 'Present'),
(347, 19, '2021-03-30', '2021-03-30 09:27:57', '118.200.94.12', '2021-03-30 18:26:00', '111.65.45.105', '0', '1.4379490694918435', '103.84484863941731', '1.4340844643504278', '103.84196387396891', '2021-03-30 09:27:57', '2021-03-30 18:26:00', '2021-03-30 18:26:00', '8:58', '', 'Present'),
(348, 23, '2021-03-30', '2021-03-30 09:45:11', '118.200.94.12', '2021-03-31 23:35:52', '111.65.36.41', '0', '1.4379576', '103.8448387', '1.4379946', '103.844771', '2021-03-30 09:45:11', '2021-03-31 23:35:52', '2021-03-31 23:35:52', '0:0', '', 'Present'),
(349, 23, '2021-03-30', '2021-03-30 09:45:12', '118.200.94.12', '2021-03-30 23:50:07', '111.65.36.42', '0', '1.4379576', '103.8448387', '1.4379852', '103.8447849', '2021-03-30 09:45:12', '2021-03-30 23:50:07', '2021-03-30 23:50:07', '14:4', '0:0', 'Present'),
(350, 14, '2021-03-31', '2021-03-31 08:57:03', '111.65.44.161', '2021-03-31 21:50:14', '111.65.44.161', '0', '1.4372668', '103.8431557', '1.4379885', '103.8447864', '2021-03-31 08:57:03', '2021-03-31 21:50:14', '2021-03-31 21:50:14', '12:53', '', 'Present'),
(351, 11, '2021-03-31', '2021-03-31 09:12:28', '118.200.94.12', '2021-03-31 19:23:37', '111.65.35.217', '0', '1.4379484626034156', '103.84495070980375', '1.3032463840642745', '103.8726879265514', '2021-03-31 09:12:28', '2021-03-31 19:23:37', '2021-03-31 19:23:37', '10:11', '', 'Present'),
(352, 19, '2021-03-31', '2021-03-31 09:22:30', '118.200.94.12', '2021-04-01 09:23:31', '118.200.94.12', '0', '1.4379973468762621', '103.84490530289825', '1.438074382268589', '103.84487933581028', '2021-03-31 09:22:30', '2021-04-01 09:23:31', '2021-04-01 09:23:31', '0:0', '', 'Present'),
(353, 15, '2021-03-31', '2021-03-31 09:26:18', '118.200.94.12', '2021-03-31 18:55:37', '118.200.94.12', '0', '1.4380600005826747', '103.8448759982827', '1.4379993488986211', '103.8448926865588', '2021-03-31 09:26:18', '2021-03-31 18:55:37', '2021-03-31 18:55:37', '9:29', '', 'Present'),
(354, 10, '2021-03-31', '2021-03-31 09:27:17', '118.200.94.12', '2021-03-31 19:17:13', '111.65.47.235', '0', '1.4379918', '103.8447613', '1.4379958', '103.8447606', '2021-03-31 09:27:17', '2021-03-31 19:17:13', '2021-03-31 19:17:13', '9:49', '', 'Present'),
(355, 13, '2021-03-31', '2021-03-31 09:27:23', '119.56.97.120', '2021-04-01 09:26:37', '119.56.101.236', '0', '1.4381015866566216', '103.84480577312532', '1.4380412126234816', '103.84486547479011', '2021-03-31 09:27:23', '2021-04-01 09:26:37', '2021-04-01 09:26:37', '0:0', '', 'Present');
INSERT INTO `xin_attendance_time` (`time_attendance_id`, `employee_id`, `attendance_date`, `clock_in`, `clock_in_ip_address`, `clock_out`, `clock_out_ip_address`, `clock_in_out`, `clock_in_latitude`, `clock_in_longitude`, `clock_out_latitude`, `clock_out_longitude`, `time_late`, `early_leaving`, `overtime`, `total_work`, `total_rest`, `attendance_status`) VALUES
(356, 13, '2021-03-31', '2021-03-31 09:27:23', '119.56.97.120', '2021-04-01 09:26:27', '119.56.101.236', '0', '1.4381015866566216', '103.84480577312532', '1.4380122304010716', '103.84484105590582', '2021-03-31 09:27:23', '2021-04-01 09:26:27', '2021-04-01 09:26:27', '0:0', '0:0', 'Present'),
(357, 21, '2021-03-31', '2021-03-31 09:29:46', '118.200.94.12', '2021-04-01 09:28:47', '118.200.94.12', '0', '1.4380586920138565', '103.84487951352018', '1.4379349022128696', '103.84493088733046', '2021-03-31 09:29:46', '2021-04-01 09:28:47', '2021-04-01 09:28:47', '0:0', '', 'Present'),
(358, 18, '2021-03-31', '2021-03-31 09:39:16', '119.56.109.160', '2021-03-31 23:34:57', '119.56.104.147', '0', '1.4374902899724518', '103.84446736092403', '1.438421590907306', '103.84476921250199', '2021-03-31 09:39:16', '2021-03-31 23:34:57', '2021-03-31 23:34:57', '13:55', '', 'Present'),
(359, 12, '2021-03-31', '2021-03-31 11:09:09', '118.200.94.12', '2021-04-01 08:02:36', '121.6.126.18', '0', '1.4378318929088068', '103.84493160212678', '1.3373206292813145', '103.9222424910305', '2021-03-31 11:09:09', '2021-04-01 08:02:36', '2021-04-01 08:02:36', '0:0', '', 'Present'),
(360, 14, '2021-04-01', '2021-04-01 08:57:11', '111.65.44.155', '2021-04-01 21:06:52', '103.6.150.160', '0', '1.4381823', '103.8443812', '1.4444457', '103.8077746', '2021-04-01 08:57:11', '2021-04-01 21:06:52', '2021-04-01 21:06:52', '12:9', '', 'Present'),
(361, 11, '2021-04-01', '2021-04-01 09:12:53', '111.65.35.59', '2021-04-05 09:19:51', '118.200.94.12', '0', '1.4374089386400752', '103.8445004613206', '1.4380024259155073', '103.84492207718469', '2021-04-01 09:12:53', '2021-04-05 09:19:51', '2021-04-05 09:19:51', '0:0', '', 'Present'),
(362, 19, '2021-04-01', '2021-04-01 09:23:38', '118.200.94.12', '2021-04-05 09:20:29', '118.200.94.12', '0', '1.437975973223473', '103.84493912166751', '1.4380384131929203', '103.84493826044452', '2021-04-01 09:23:38', '2021-04-05 09:20:29', '2021-04-05 09:20:29', '0:0', '', 'Present'),
(363, 10, '2021-04-01', '2021-04-01 09:24:20', '118.200.94.12', '2021-04-03 09:58:29', '118.200.94.12', '0', '1.4374952', '103.8442699', '1.4379386', '103.8447691', '2021-04-01 09:24:20', '2021-04-03 09:58:29', '2021-04-03 09:58:29', '0:0', '', 'Present'),
(364, 12, '2021-04-01', '2021-04-01 09:24:32', '118.200.94.12', '2021-04-01 20:55:02', '111.65.45.20', '0', '1.4374717259624201', '103.84450199750047', '1.328833969711295', '103.93090014328006', '2021-04-01 09:24:32', '2021-04-01 20:55:02', '2021-04-01 20:55:02', '11:30', '', 'Present'),
(365, 15, '2021-04-01', '2021-04-01 09:26:33', '118.200.94.12', '2021-04-01 18:30:32', '183.90.37.119', '0', '1.4380669416825549', '103.84482300101816', '1.437107476064882', '103.84429822697423', '2021-04-01 09:26:33', '2021-04-01 18:30:32', '2021-04-01 18:30:32', '9:3', '', 'Present'),
(366, 13, '2021-04-01', '2021-04-01 09:26:47', '119.56.101.236', '2021-04-03 10:02:05', '119.56.103.2', '0', '1.4380524865602828', '103.84472180852492', '1.437957788960256', '103.84487428904534', '2021-04-01 09:26:47', '2021-04-03 10:02:05', '2021-04-03 10:02:05', '0:0', '', 'Present'),
(367, 21, '2021-04-01', '2021-04-01 09:28:49', '118.200.94.12', '2021-04-01 21:20:51', '118.200.94.12', '0', '1.4380204261767084', '103.84497175061166', '1.4379822942334315', '103.84503956043649', '2021-04-01 09:28:49', '2021-04-01 21:20:51', '2021-04-01 21:20:51', '11:52', '', 'Present'),
(368, 23, '2021-04-01', '2021-04-01 09:30:28', '118.200.94.12', '2021-04-05 23:39:38', '111.65.36.33', '0', '1.4367768', '103.8336856', '1.4383801', '103.8446032', '2021-04-01 09:30:28', '2021-04-05 23:39:38', '2021-04-05 23:39:38', '0:0', '', 'Present'),
(369, 18, '2021-04-01', '2021-04-01 09:33:22', '118.200.94.12', '2021-04-01 22:57:02', '119.56.107.191', '0', '1.4379778267668515', '103.8449373338932', '1.4379548616853155', '103.84502446506681', '2021-04-01 09:33:22', '2021-04-01 22:57:02', '2021-04-01 22:57:02', '13:23', '', 'Present'),
(370, 14, '2021-04-02', '2021-04-02 08:40:41', '111.65.45.129', '2021-04-02 19:30:56', '111.65.45.129', '0', '1.4378919', '103.8439997', '1.4379767', '103.8448165', '2021-04-02 08:40:41', '2021-04-02 19:30:56', '2021-04-02 19:30:56', '10:50', '', 'Present'),
(371, 10, '2021-04-03', '2021-04-03 09:58:35', '118.200.94.12', '2021-04-05 09:24:48', '118.200.94.12', '0', '1.4379386', '103.8447691', '1.4310178', '103.8475309', '2021-04-03 09:58:35', '2021-04-05 09:24:48', '2021-04-05 09:24:48', '0:0', '', 'Present'),
(372, 13, '2021-04-03', '2021-04-03 10:02:08', '119.56.103.2', '2021-04-05 09:26:53', '119.56.100.10', '0', '1.4380535070883247', '103.84481179653147', '1.4380353588650574', '103.84489887165844', '2021-04-03 10:02:08', '2021-04-05 09:26:53', '2021-04-05 09:26:53', '0:0', '', 'Present'),
(373, 14, '2021-04-05', '2021-04-05 08:14:23', '111.65.45.142', '2021-04-05 19:37:54', '111.65.45.142', '0', '1.4363965', '103.8435566', '1.4444514', '103.8077771', '2021-04-05 08:14:23', '2021-04-05 19:37:54', '2021-04-05 19:37:54', '11:23', '', 'Present'),
(374, 11, '2021-04-05', '2021-04-05 09:19:59', '118.200.94.12', '2021-04-06 09:21:52', '118.200.94.12', '0', '1.437985394159888', '103.84494843073358', '1.4380248990186693', '103.84492172078343', '2021-04-05 09:19:59', '2021-04-06 09:21:52', '2021-04-06 09:21:52', '0:0', '', 'Present'),
(375, 19, '2021-04-05', '2021-04-05 09:20:40', '118.200.94.12', '2021-04-05 21:36:28', '111.65.70.106', '0', '1.4379521801697457', '103.84496491189223', '1.4352977713096347', '103.78099003484554', '2021-04-05 09:20:40', '2021-04-05 21:36:28', '2021-04-05 21:36:28', '12:15', '', 'Present'),
(376, 12, '2021-04-05', '2021-04-05 09:22:31', '111.65.57.50', '2021-04-06 09:04:55', '111.65.57.56', '0', '1.4376913281102393', '103.84476993045399', '1.3770901094311072', '103.85836681751799', '2021-04-05 09:22:31', '2021-04-06 09:04:55', '2021-04-06 09:04:55', '0:0', '', 'Present'),
(377, 16, '2021-04-05', '2021-04-05 09:24:33', '119.56.111.21', '2021-04-06 09:24:18', '118.200.94.12', '0', '1.4380418849657315', '103.84486824959431', '1.437951088428517', '103.8449583453206', '2021-04-05 09:24:33', '2021-04-06 09:24:18', '2021-04-06 09:24:18', '0:0', '', 'Present'),
(378, 15, '2021-04-05', '2021-04-05 09:24:53', '183.90.37.22', '2021-04-05 18:35:14', '118.200.94.12', '0', '1.4361562057638777', '103.84218207969668', '1.4379659038720587', '103.84498089183137', '2021-04-05 09:24:53', '2021-04-05 18:35:14', '2021-04-05 18:35:14', '9:10', '', 'Present'),
(379, 10, '2021-04-05', '2021-04-05 09:24:56', '118.200.94.12', '2021-04-05 20:35:45', '111.65.68.2', '0', '1.4310178', '103.8475309', '1.3590125', '103.8854464', '2021-04-05 09:24:56', '2021-04-05 20:35:45', '2021-04-05 20:35:45', '11:10', '', 'Present'),
(380, 21, '2021-04-05', '2021-04-05 09:25:44', '118.200.94.12', '2021-04-06 09:29:31', '118.200.94.12', '0', '1.43793971180646', '103.84494109222206', '1.4380498030653288', '103.84482208666137', '2021-04-05 09:25:44', '2021-04-06 09:29:31', '2021-04-06 09:29:31', '0:0', '', 'Present'),
(381, 13, '2021-04-05', '2021-04-05 09:26:56', '119.56.100.10', '2021-04-06 09:30:11', '119.56.102.33', '0', '1.4380353588650574', '103.84489887165844', '1.4379147638684315', '103.84481655307837', '2021-04-05 09:26:56', '2021-04-06 09:30:11', '2021-04-06 09:30:11', '0:0', '', 'Present'),
(382, 18, '2021-04-05', '2021-04-05 09:46:54', '118.200.94.12', '2021-04-05 23:40:22', '119.56.104.186', '0', '1.4374720147859257', '103.8445016274212', '1.4365591873207988', '103.84517696009321', '2021-04-05 09:46:54', '2021-04-05 23:40:22', '2021-04-05 23:40:22', '13:53', '', 'Present'),
(383, 14, '2021-04-06', '2021-04-06 08:58:00', '111.65.45.171', '2021-04-06 20:22:43', '111.65.45.171', '0', '1.4380294', '103.8442046', '1.4378031', '103.8445619', '2021-04-06 08:58:00', '2021-04-06 20:22:43', '2021-04-06 20:22:43', '11:24', '', 'Present'),
(384, 12, '2021-04-06', '2021-04-06 09:17:11', '118.200.94.12', '2021-04-06 22:48:46', '121.6.126.18', '0', '1.4379909639676234', '103.844891169838', '1.337336855086916', '103.92222097042482', '2021-04-06 09:17:11', '2021-04-06 22:48:46', '2021-04-06 22:48:46', '13:31', '', 'Present'),
(385, 19, '2021-04-06', '2021-04-06 09:19:47', '118.200.94.12', '2021-04-06 18:04:27', '111.65.47.31', '0', '1.4379938618094807', '103.84489844018373', '1.4378354378286753', '103.84491825574516', '2021-04-06 09:19:47', '2021-04-06 18:04:27', '2021-04-06 18:04:27', '8:44', '', 'Present'),
(386, 10, '2021-04-06', '2021-04-06 09:21:47', '118.200.94.12', '2021-04-07 09:19:50', '111.65.56.189', '0', '1.4377571', '103.8445347', '1.4377875', '103.8445077', '2021-04-06 09:21:47', '2021-04-07 09:19:50', '2021-04-07 09:19:50', '0:0', '', 'Present'),
(387, 11, '2021-04-06', '2021-04-06 09:21:58', '118.200.94.12', '2021-04-06 18:51:52', '111.65.34.1', '0', '1.4380195446754735', '103.84492840948013', '1.4348507541439717', '103.84559812593987', '2021-04-06 09:21:58', '2021-04-06 18:51:52', '2021-04-06 18:51:52', '9:29', '', 'Present'),
(388, 16, '2021-04-06', '2021-04-06 09:24:22', '118.200.94.12', '2021-04-07 09:25:35', '119.56.102.27', '0', '1.4385323060618147', '103.84551153477811', '1.4380958694756147', '103.8448619198928', '2021-04-06 09:24:22', '2021-04-07 09:25:35', '2021-04-07 09:25:35', '0:0', '', 'Present'),
(389, 21, '2021-04-06', '2021-04-06 09:29:35', '118.200.94.12', '2021-04-07 09:38:35', '118.200.94.12', '0', '1.4380498030653288', '103.84482208666137', '1.4380363203508568', '103.84491971963963', '2021-04-06 09:29:35', '2021-04-07 09:38:35', '2021-04-07 09:38:35', '0:0', '', 'Present'),
(390, 13, '2021-04-06', '2021-04-06 09:30:15', '119.56.102.33', '2021-04-07 09:19:53', '119.56.97.2', '0', '1.4379940455854854', '103.84489490910222', '1.438078941662516', '103.84481789316405', '2021-04-06 09:30:15', '2021-04-07 09:19:53', '2021-04-07 09:19:53', '0:0', '', 'Present'),
(391, 15, '2021-04-06', '2021-04-06 09:31:17', '118.200.94.12', '2021-04-06 18:32:45', '183.90.37.22', '0', '1.4380438188017686', '103.84485431073347', '1.438212553587784', '103.84482617335073', '2021-04-06 09:31:17', '2021-04-06 18:32:45', '2021-04-06 18:32:45', '9:1', '', 'Present'),
(392, 18, '2021-04-06', '2021-04-06 09:35:57', '119.56.110.128', '2021-04-06 23:59:19', '119.56.106.43', '0', '1.4372006597418678', '103.84440033259867', '1.4379727933757833', '103.84500955651689', '2021-04-06 09:35:57', '2021-04-06 23:59:19', '2021-04-06 23:59:19', '14:23', '', 'Present'),
(393, 14, '2021-04-07', '2021-04-07 08:58:30', '111.65.45.184', '2021-04-07 18:54:50', '111.65.45.184', '0', '1.4304035', '103.8364288', '1.4379882', '103.8447671', '2021-04-07 08:58:30', '2021-04-07 18:54:50', '2021-04-07 18:54:50', '9:56', '', 'Present'),
(394, 19, '2021-04-07', '2021-04-07 09:14:42', '118.200.94.12', '2021-04-07 18:04:59', '111.65.47.31', '0', '1.4378439461040617', '103.84501099293533', '1.4379122350508184', '103.84393433000311', '2021-04-07 09:14:42', '2021-04-07 18:04:59', '2021-04-07 18:04:59', '8:50', '', 'Present'),
(395, 10, '2021-04-07', '2021-04-07 09:19:55', '111.65.56.189', '2021-04-07 19:11:59', '111.65.46.53', '0', '1.4377875', '103.8445077', '1.4380019', '103.8447494', '2021-04-07 09:19:55', '2021-04-07 19:11:59', '2021-04-07 19:11:59', '9:52', '', 'Present'),
(396, 13, '2021-04-07', '2021-04-07 09:20:02', '119.56.97.2', '2021-04-08 09:31:45', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.4380732009974557', '103.84479517465073', '2021-04-07 09:20:02', '2021-04-08 09:31:45', '2021-04-08 09:31:45', '0:0', '', 'Present'),
(397, 13, '2021-04-07', '2021-04-07 09:20:03', '119.56.97.2', '2021-04-08 09:31:42', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.437942357860178', '103.84477656832422', '2021-04-07 09:20:03', '2021-04-08 09:31:42', '2021-04-08 09:31:42', '0:0', '0:0', 'Present'),
(398, 13, '2021-04-07', '2021-04-07 09:20:04', '119.56.97.2', '2021-04-08 09:30:49', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.4380877157281065', '103.84477466687432', '2021-04-07 09:20:04', '2021-04-08 09:30:49', '2021-04-08 09:30:49', '0:0', '0:0', 'Present'),
(399, 13, '2021-04-07', '2021-04-07 09:20:04', '119.56.97.2', '2021-04-08 09:30:37', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.438104444750713', '103.84483019450035', '2021-04-07 09:20:04', '2021-04-08 09:30:37', '2021-04-08 09:30:37', '0:0', '0:0', 'Present'),
(400, 13, '2021-04-07', '2021-04-07 09:20:04', '119.56.97.2', '2021-04-08 09:30:24', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.4380825832200619', '103.84469654449626', '2021-04-07 09:20:04', '2021-04-08 09:30:24', '2021-04-08 09:30:24', '0:0', '0:0', 'Present'),
(401, 13, '2021-04-07', '2021-04-07 09:20:04', '119.56.97.2', '2021-04-08 09:30:09', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.4380825832200619', '103.84469654449626', '2021-04-07 09:20:04', '2021-04-08 09:30:09', '2021-04-08 09:30:09', '0:0', '0:0', 'Present'),
(402, 13, '2021-04-07', '2021-04-07 09:20:05', '119.56.97.2', '2021-04-08 09:29:51', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.438040537294616', '103.84477466492947', '2021-04-07 09:20:05', '2021-04-08 09:29:51', '2021-04-08 09:29:51', '0:0', '0:0', 'Present'),
(403, 13, '2021-04-07', '2021-04-07 09:20:05', '119.56.97.2', '2021-04-08 09:29:47', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.4380440052014118', '103.84489401093796', '2021-04-07 09:20:05', '2021-04-08 09:29:47', '2021-04-08 09:29:47', '0:0', '0:0', 'Present'),
(404, 13, '2021-04-07', '2021-04-07 09:20:05', '119.56.97.2', '2021-04-08 09:29:18', '119.56.105.33', '0', '1.438105909251766', '103.84473798699182', '1.437849637769379', '103.8447665281162', '2021-04-07 09:20:05', '2021-04-08 09:29:18', '2021-04-08 09:29:18', '0:0', '0:0', 'Present'),
(405, 18, '2021-04-07', '2021-04-07 09:20:54', '119.56.110.211', '2021-04-08 00:01:50', '118.200.94.12', '0', '1.4379827279680055', '103.84499328575467', '1.437809917862793', '103.84490424449487', '2021-04-07 09:20:54', '2021-04-08 00:01:50', '2021-04-08 00:01:50', '0:0', '', 'Present'),
(406, 11, '2021-04-07', '2021-04-07 09:22:39', '111.65.34.1', '2021-04-08 09:17:06', '118.200.94.12', '0', '1.4376420900460067', '103.8448445934437', '1.437803183306291', '103.84502920759878', '2021-04-07 09:22:39', '2021-04-08 09:17:06', '2021-04-08 09:17:06', '0:0', '', 'Present'),
(407, 12, '2021-04-07', '2021-04-07 09:24:52', '111.65.32.3', '2021-04-07 18:52:06', '111.65.32.3', '0', '1.4371183815286976', '103.8439592461714', '1.4380814102387354', '103.84487299319903', '2021-04-07 09:24:52', '2021-04-07 18:52:06', '2021-04-07 18:52:06', '9:27', '', 'Present'),
(408, 16, '2021-04-07', '2021-04-07 09:25:51', '119.56.102.27', '2021-04-08 09:26:13', '118.200.94.12', '0', '1.4380928364940915', '103.84486351142012', '1.4379545587229263', '103.84496542958198', '2021-04-07 09:25:51', '2021-04-08 09:26:13', '2021-04-08 09:26:13', '0:0', '', 'Present'),
(409, 15, '2021-04-07', '2021-04-07 09:26:25', '118.200.94.12', '2021-04-07 18:46:12', '183.90.37.22', '0', '1.4368301056915198', '103.84258741842555', '1.4375807293622413', '103.84459598047668', '2021-04-07 09:26:25', '2021-04-07 18:46:12', '2021-04-07 18:46:12', '9:19', '', 'Present'),
(410, 23, '2021-04-07', '2021-04-07 09:29:40', '118.200.94.12', '2021-04-08 00:00:23', '118.200.94.12', '0', '1.4379933', '103.8447612', '1.437987', '103.8447771', '2021-04-07 09:29:40', '2021-04-08 00:00:23', '2021-04-08 00:00:23', '0:0', '', 'Present'),
(411, 21, '2021-04-07', '2021-04-07 09:38:40', '118.200.94.12', '2021-04-07 18:12:54', '118.200.94.12', '0', '1.437938886973176', '103.8449378181625', '1.4379587793893498', '103.84498910142746', '2021-04-07 09:38:40', '2021-04-07 18:12:54', '2021-04-07 18:12:54', '8:34', '', 'Present'),
(412, 14, '2021-04-08', '2021-04-08 09:08:55', '111.65.45.160', '2021-04-08 19:08:23', '111.65.45.160', '0', '1.4370612', '103.8429898', '1.4377731', '103.8445962', '2021-04-08 09:08:55', '2021-04-08 19:08:23', '2021-04-08 19:08:23', '9:59', '', 'Present'),
(413, 11, '2021-04-08', '2021-04-08 09:17:09', '118.200.94.12', '2021-04-08 18:40:14', '118.200.94.12', '0', '1.4377304105445368', '103.8449960256302', '1.437958669719137', '103.84500789721658', '2021-04-08 09:17:09', '2021-04-08 18:40:14', '2021-04-08 18:40:14', '9:23', '', 'Present'),
(414, 18, '2021-04-08', '2021-04-08 09:24:17', '118.200.94.12', '2021-04-09 00:13:24', '118.200.94.12', '0', '1.4379562360289126', '103.84499733983552', '1.4379804164972625', '103.84490918764624', '2021-04-08 09:24:17', '2021-04-09 00:13:24', '2021-04-09 00:13:24', '0:0', '', 'Present'),
(415, 10, '2021-04-08', '2021-04-08 09:24:33', '118.200.94.12', '2021-04-09 09:17:46', '118.200.94.12', '0', '1.4380365', '103.8447053', '1.437776', '103.8446637', '2021-04-08 09:24:33', '2021-04-09 09:17:46', '2021-04-09 09:17:46', '0:0', '', 'Present'),
(416, 16, '2021-04-08', '2021-04-08 09:26:20', '118.200.94.12', '2021-04-09 09:23:23', '118.200.94.12', '0', '1.4379545587229263', '103.84496542958198', '1.4379157466232728', '103.84495318186006', '2021-04-08 09:26:20', '2021-04-09 09:23:23', '2021-04-09 09:23:23', '0:0', '', 'Present'),
(417, 15, '2021-04-08', '2021-04-08 09:27:42', '118.200.94.12', '2021-04-09 09:23:16', '118.200.94.12', '0', '1.4380409820532798', '103.84486334697088', '1.4381387504260175', '103.84472631246369', '2021-04-08 09:27:42', '2021-04-09 09:23:16', '2021-04-09 09:23:16', '0:0', '', 'Present'),
(418, 13, '2021-04-08', '2021-04-08 09:32:07', '119.56.105.33', '2021-04-09 09:25:05', '119.56.106.163', '0', '1.4380539043640466', '103.84483299096331', '1.4380629483415768', '103.84473619790222', '2021-04-08 09:32:07', '2021-04-09 09:25:05', '2021-04-09 09:25:05', '0:0', '', 'Present'),
(419, 21, '2021-04-08', '2021-04-08 09:32:27', '118.200.94.12', '2021-04-09 09:39:59', '118.200.94.12', '0', '1.4379623182406076', '103.84496444988807', '1.438078648407643', '103.84487609032445', '2021-04-08 09:32:27', '2021-04-09 09:39:59', '2021-04-09 09:39:59', '0:0', '', 'Present'),
(420, 23, '2021-04-08', '2021-04-08 09:36:41', '118.200.94.12', '2021-04-09 00:15:36', '118.200.94.12', '0', '1.4379693', '103.8448372', '1.4380153', '103.8447509', '2021-04-08 09:36:41', '2021-04-09 00:15:36', '2021-04-09 00:15:36', '0:0', '', 'Present'),
(421, 12, '2021-04-08', '2021-04-08 10:22:41', '111.65.32.3', '2021-04-08 19:41:13', '111.65.32.3', '0', '1.4379642754063795', '103.84411500116686', '1.321684985280196', '103.90525857002974', '2021-04-08 10:22:41', '2021-04-08 19:41:13', '2021-04-08 19:41:13', '9:18', '', 'Present'),
(422, 14, '2021-04-09', '2021-04-09 08:21:56', '111.65.45.131', '2021-04-09 18:30:25', '111.65.45.131', '0', '1.4365619', '103.844162', '1.437988', '103.8447838', '2021-04-09 08:21:56', '2021-04-09 18:30:25', '2021-04-09 18:30:25', '10:8', '', 'Present'),
(423, 10, '2021-04-09', '2021-04-09 09:17:51', '118.200.94.12', '2021-04-12 09:17:39', '118.200.94.12', '0', '1.437776', '103.8446637', '1.4379925', '103.8447638', '2021-04-09 09:17:51', '2021-04-12 09:17:39', '2021-04-12 09:17:39', '0:0', '', 'Present'),
(424, 12, '2021-04-09', '2021-04-09 09:20:36', '111.65.32.3', '2021-04-12 09:21:47', '111.65.71.106', '0', '1.4373450371200909', '103.84440731788322', '1.4371257865259957', '103.84398962939159', '2021-04-09 09:20:36', '2021-04-12 09:21:47', '2021-04-12 09:21:47', '0:0', '', 'Present'),
(425, 19, '2021-04-09', '2021-04-09 09:21:00', '118.200.94.12', '2021-04-09 18:16:14', '111.65.32.16', '0', '1.437961840420037', '103.84497121926056', '1.4364975904289132', '103.83395212097602', '2021-04-09 09:21:00', '2021-04-09 18:16:14', '2021-04-09 18:16:14', '8:55', '', 'Present'),
(426, 15, '2021-04-09', '2021-04-09 09:23:21', '118.200.94.12', '2021-04-10 21:37:27', '180.129.109.131', '0', '1.4380427728041738', '103.84478781130932', '1.4341846249470867', '103.80179808577024', '2021-04-09 09:23:21', '2021-04-10 21:37:27', '2021-04-10 21:37:27', '0:0', '', 'Present'),
(427, 16, '2021-04-09', '2021-04-09 09:23:27', '118.200.94.12', '2021-04-12 09:20:35', '119.56.110.209', '0', '1.4376283375538819', '103.84502644659239', '1.4383738951467675', '103.84462671858515', '2021-04-09 09:23:27', '2021-04-12 09:20:35', '2021-04-12 09:20:35', '0:0', '', 'Present'),
(428, 13, '2021-04-09', '2021-04-09 09:25:13', '119.56.106.163', '2021-04-12 09:27:40', '119.56.107.151', '0', '1.4380675172835318', '103.84472497673222', '1.4380876058628482', '103.84476056833803', '2021-04-09 09:25:13', '2021-04-12 09:27:40', '2021-04-12 09:27:40', '0:0', '', 'Present'),
(429, 11, '2021-04-09', '2021-04-09 09:30:51', '111.65.34.1', '2021-04-10 10:02:43', '111.65.34.1', '0', '1.4371075329333893', '103.84400157682025', '1.4370601325125067', '103.84415299776089', '2021-04-09 09:30:51', '2021-04-10 10:02:43', '2021-04-10 10:02:43', '0:0', '', 'Present'),
(430, 21, '2021-04-09', '2021-04-09 09:40:04', '118.200.94.12', '2021-04-12 09:32:26', '118.200.94.12', '0', '1.4381191035688732', '103.84484846389542', '1.4380124123136089', '103.84493570434867', '2021-04-09 09:40:04', '2021-04-12 09:32:26', '2021-04-12 09:32:26', '0:0', '', 'Present'),
(431, 18, '2021-04-09', '2021-04-09 09:45:46', '118.200.94.12', '2021-04-09 22:34:08', '118.200.94.12', '0', '1.4379619705254565', '103.84502235265649', '1.4378272013609639', '103.84489984864604', '2021-04-09 09:45:46', '2021-04-09 22:34:08', '2021-04-09 22:34:08', '12:48', '', 'Present'),
(432, 23, '2021-04-09', '2021-04-09 09:46:58', '118.200.94.12', '2021-04-09 22:34:05', '111.65.36.11', '0', '1.4379882', '103.8447854', '1.4379997', '103.8447452', '2021-04-09 09:46:58', '2021-04-09 22:34:05', '2021-04-09 22:34:05', '12:47', '', 'Present'),
(433, 11, '2021-04-10', '2021-04-10 10:02:46', '111.65.34.1', '2021-04-12 09:21:43', '118.200.94.12', '0', '1.4373877566857631', '103.84443307915025', '1.4379505944956583', '103.8449767596172', '2021-04-10 10:02:46', '2021-04-12 09:21:43', '2021-04-12 09:21:43', '0:0', '', 'Present'),
(434, 14, '2021-04-12', '2021-04-12 08:34:31', '111.65.58.118', '2021-04-12 18:30:48', '111.65.58.118', '0', '1.4379627', '103.8440886', '1.4379974', '103.8447476', '2021-04-12 08:34:31', '2021-04-12 18:30:48', '2021-04-12 18:30:48', '9:56', '', 'Present'),
(435, 15, '2021-04-12', '2021-04-12 09:09:55', '122.11.212.168', '2021-04-12 18:32:27', '118.200.94.12', '0', '1.4129818131216998', '103.83784461414163', '1.438103636127705', '103.84484549993813', '2021-04-12 09:09:55', '2021-04-12 18:32:27', '2021-04-12 18:32:27', '9:22', '', 'Present'),
(436, 10, '2021-04-12', '2021-04-12 09:17:44', '118.200.94.12', '2021-04-12 20:45:09', '111.65.58.42', '0', '1.4379925', '103.8447638', '1.3940049', '103.9159937', '2021-04-12 09:17:44', '2021-04-12 20:45:09', '2021-04-12 20:45:09', '11:27', '', 'Present'),
(437, 16, '2021-04-12', '2021-04-12 09:20:38', '119.56.110.209', '2021-04-13 14:04:51', '118.200.94.12', '0', '1.4382035547955243', '103.84468569847735', '1.4378799080410303', '103.84494719359628', '2021-04-12 09:20:38', '2021-04-13 14:04:51', '2021-04-13 14:04:51', '0:0', '', 'Present'),
(438, 11, '2021-04-12', '2021-04-12 09:21:49', '118.200.94.12', '2021-04-13 09:15:54', '118.200.94.12', '0', '1.4379569890113717', '103.84498739233456', '1.4376066574871469', '103.84493466336157', '2021-04-12 09:21:49', '2021-04-13 09:15:54', '2021-04-13 09:15:54', '0:0', '', 'Present'),
(439, 12, '2021-04-12', '2021-04-12 09:22:09', '111.65.71.106', '2021-04-12 19:49:40', '111.65.46.21', '0', '1.436647940048196', '103.84283242746491', '1.3398849877842347', '103.89434651068616', '2021-04-12 09:22:09', '2021-04-12 19:49:40', '2021-04-12 19:49:40', '10:27', '', 'Present'),
(440, 22, '2021-04-12', '2021-04-12 09:26:58', '118.200.94.12', '2021-04-13 09:25:59', '119.56.97.217', '0', '1.437605695049826', '103.84464284536767', '1.4379725897163524', '103.84501911481411', '2021-04-12 09:26:58', '2021-04-13 09:25:59', '2021-04-13 09:25:59', '0:0', '', 'Present'),
(441, 13, '2021-04-12', '2021-04-12 09:27:48', '119.56.107.151', '2021-04-13 09:14:02', '119.56.111.115', '0', '1.4380513332159826', '103.84475408138982', '1.4381016023745563', '103.84468636933215', '2021-04-12 09:27:48', '2021-04-13 09:14:02', '2021-04-13 09:14:02', '0:0', '', 'Present'),
(442, 18, '2021-04-12', '2021-04-12 09:29:59', '119.56.111.82', '2021-04-12 22:13:07', '118.200.94.12', '0', '1.4374513511793763', '103.84446916723935', '1.4379892587515024', '103.8450089849096', '2021-04-12 09:29:59', '2021-04-12 22:13:07', '2021-04-12 22:13:07', '12:43', '', 'Present'),
(443, 19, '2021-04-12', '2021-04-12 09:32:02', '111.65.44.146', '2021-04-12 09:32:20', '118.200.94.12', '0', '1.4375748344370038', '103.84458687916411', '1.4379341520716575', '103.84497519696676', '2021-04-12 09:32:02', '2021-04-12 09:32:20', '2021-04-12 09:32:20', '0:0', '', 'Present'),
(444, 19, '2021-04-12', '2021-04-12 09:32:22', '118.200.94.12', '2021-04-12 18:06:29', '111.65.44.146', '0', '1.4379704695066675', '103.84501926440606', '1.4370950029181715', '103.84432701263869', '2021-04-12 09:32:22', '2021-04-12 18:06:29', '2021-04-12 18:06:29', '8:34', '0:0', 'Present'),
(445, 21, '2021-04-12', '2021-04-12 09:32:31', '118.200.94.12', '2021-04-13 09:31:44', '118.200.94.12', '0', '1.4380412449578353', '103.84490583440156', '1.4379757281883019', '103.84502750614085', '2021-04-12 09:32:31', '2021-04-13 09:31:44', '2021-04-13 09:31:44', '0:0', '', 'Present'),
(446, 23, '2021-04-12', '2021-04-12 09:35:46', '118.200.94.12', '2021-04-12 22:13:05', '111.65.60.240', '0', '1.4371945', '103.8440346', '1.437978', '103.8447639', '2021-04-12 09:35:46', '2021-04-12 22:13:05', '2021-04-12 22:13:05', '12:37', '', 'Present'),
(447, 14, '2021-04-13', '2021-04-13 08:46:16', '111.65.58.118', '2021-04-13 18:30:50', '111.65.58.118', '0', '1.4380019', '103.8447507', '1.4380046', '103.8447466', '2021-04-13 08:46:16', '2021-04-13 18:30:50', '2021-04-13 18:30:50', '9:44', '', 'Present'),
(448, 13, '2021-04-13', '2021-04-13 09:14:05', '119.56.111.115', '2021-04-14 09:27:20', '119.56.104.229', '0', '1.4380419932028898', '103.84470693446593', '1.4380583977660484', '103.84487804522001', '2021-04-13 09:14:05', '2021-04-14 09:27:20', '2021-04-14 09:27:20', '0:0', '', 'Present'),
(449, 11, '2021-04-13', '2021-04-13 09:15:57', '118.200.94.12', '2021-04-14 09:18:51', '111.65.58.101', '0', '1.4379653728947352', '103.84499412932101', '1.4371192148370722', '103.84401747292436', '2021-04-13 09:15:57', '2021-04-14 09:18:51', '2021-04-14 09:18:51', '0:0', '', 'Present'),
(450, 10, '2021-04-13', '2021-04-13 09:23:17', '118.200.94.12', '2021-04-13 20:52:06', '39.109.130.129', '0', '1.4377131', '103.84442', '1.401674', '103.9005131', '2021-04-13 09:23:17', '2021-04-13 20:52:06', '2021-04-13 20:52:06', '11:28', '', 'Present'),
(451, 12, '2021-04-13', '2021-04-13 09:24:24', '111.65.47.200', '2021-04-14 08:45:13', '111.65.59.95', '0', '1.4372974388002457', '103.84432346713675', '1.3367885426396449', '103.92086169380406', '2021-04-13 09:24:24', '2021-04-14 08:45:13', '2021-04-14 08:45:13', '0:0', '', 'Present'),
(452, 22, '2021-04-13', '2021-04-13 09:26:14', '119.56.97.217', '2021-04-14 09:32:43', '119.56.98.161', '0', '1.4379893173847764', '103.84504474328247', '1.437285603407251', '103.844228354266', '2021-04-13 09:26:14', '2021-04-14 09:32:43', '2021-04-14 09:32:43', '0:0', '', 'Present'),
(453, 19, '2021-04-13', '2021-04-13 09:28:51', '111.65.45.32', '2021-04-13 18:04:51', '111.65.45.32', '0', '1.4371912736366208', '103.84434889202984', '1.4371138931493541', '103.84394692264594', '2021-04-13 09:28:51', '2021-04-13 18:04:51', '2021-04-13 18:04:51', '8:36', '', 'Present'),
(454, 15, '2021-04-13', '2021-04-13 09:29:44', '118.200.94.12', '2021-04-14 18:30:32', '118.200.94.12', '0', '1.4379747644961758', '103.84499048165415', '1.4379584767658848', '103.84498135201599', '2021-04-13 09:29:44', '2021-04-14 18:30:32', '2021-04-14 18:30:32', '0:0', '', 'Present'),
(455, 21, '2021-04-13', '2021-04-13 09:31:49', '118.200.94.12', '2021-04-14 09:40:42', '118.200.94.12', '0', '1.4379575711625412', '103.84500200639661', '1.438017553894142', '103.84504506207811', '2021-04-13 09:31:49', '2021-04-14 09:40:42', '2021-04-14 09:40:42', '0:0', '', 'Present'),
(456, 23, '2021-04-13', '2021-04-13 09:35:05', '118.200.94.12', '2021-04-13 23:03:44', '111.65.60.212', '0', '1.4379857', '103.844809', '1.4380568', '103.8448408', '2021-04-13 09:35:05', '2021-04-13 23:03:44', '2021-04-13 23:03:44', '13:28', '', 'Present'),
(457, 18, '2021-04-13', '2021-04-13 09:37:51', '118.200.94.12', '2021-04-13 23:03:43', '118.200.94.12', '0', '1.4378928927331838', '103.84492876874184', '1.4379041274816091', '103.84489399885713', '2021-04-13 09:37:51', '2021-04-13 23:03:43', '2021-04-13 23:03:43', '13:25', '', 'Present'),
(458, 16, '2021-04-13', '2021-04-13 14:04:56', '118.200.94.12', '2021-04-14 09:28:34', '119.56.99.207', '0', '1.4379213199915148', '103.84496148594451', '1.4369144481530385', '103.8427356121386', '2021-04-13 14:04:56', '2021-04-14 09:28:34', '2021-04-14 09:28:34', '0:0', '', 'Present'),
(459, 14, '2021-04-14', '2021-04-14 08:42:14', '111.65.58.118', '2021-04-14 18:30:50', '111.65.58.118', '0', '1.4381798', '103.8442561', '1.4379884', '103.8447798', '2021-04-14 08:42:14', '2021-04-14 18:30:50', '2021-04-14 18:30:50', '9:48', '', 'Present'),
(460, 12, '2021-04-14', '2021-04-14 09:19:39', '111.65.59.95', '2021-04-14 21:13:36', '111.65.59.95', '0', '1.437478485865417', '103.8445682924009', '1.4370000333736834', '103.84289393987962', '2021-04-14 09:19:39', '2021-04-14 21:13:36', '2021-04-14 21:13:36', '11:53', '', 'Present'),
(461, 11, '2021-04-14', '2021-04-14 09:19:43', '111.65.58.101', '2021-04-15 09:12:08', '111.65.58.101', '0', '1.4374521851498638', '103.84445591750121', '1.4375960415833156', '103.84466297364227', '2021-04-14 09:19:43', '2021-04-15 09:12:08', '2021-04-15 09:12:08', '0:0', '', 'Present'),
(462, 10, '2021-04-14', '2021-04-14 09:25:45', '118.200.94.12', '2021-04-15 09:20:58', '118.200.94.12', '0', '1.4298898', '103.8494341', '1.4379803', '103.8447959', '2021-04-14 09:25:45', '2021-04-15 09:20:58', '2021-04-15 09:20:58', '0:0', '', 'Present'),
(463, 13, '2021-04-14', '2021-04-14 09:27:24', '119.56.104.229', '2021-04-15 09:20:50', '119.56.104.63', '0', '1.4380583977660484', '103.84487804522001', '1.4380821411366713', '103.84475612940028', '2021-04-14 09:27:24', '2021-04-15 09:20:50', '2021-04-15 09:20:50', '0:0', '', 'Present'),
(464, 16, '2021-04-14', '2021-04-14 09:29:57', '119.56.99.207', '2021-04-15 09:29:31', '119.56.102.18', '0', '1.4369530635003154', '103.84273408387882', '1.4373405928893457', '103.84361403917886', '2021-04-14 09:29:57', '2021-04-15 09:29:31', '2021-04-15 09:29:31', '0:0', '', 'Present'),
(465, 23, '2021-04-14', '2021-04-14 09:35:24', '111.65.60.233', '', '', '1', '1.4372285', '103.8418887', '', '', '2021-04-14 09:35:24', '2021-04-14 09:35:24', '2021-04-14 09:35:24', '', '', 'Present'),
(466, 18, '2021-04-14', '2021-04-14 09:37:48', '119.56.107.220', '2021-04-15 09:39:00', '118.200.94.12', '0', '1.4376659946088457', '103.84481706022419', '1.437969538548186', '103.84502249805179', '2021-04-14 09:37:48', '2021-04-15 09:39:00', '2021-04-15 09:39:00', '0:0', '', 'Present'),
(467, 21, '2021-04-14', '2021-04-14 09:40:45', '118.200.94.12', '2021-04-15 09:34:27', '118.200.94.12', '0', '1.4381611850893403', '103.84479748980931', '1.4379763581238814', '103.84499084078995', '2021-04-14 09:40:45', '2021-04-15 09:34:27', '2021-04-15 09:34:27', '0:0', '', 'Present'),
(468, 19, '2021-04-14', '2021-04-14 18:17:09', '111.65.33.169', '2021-04-14 18:17:12', '111.65.33.169', '0', '1.4373698332743623', '103.84436118678317', '1.4373671010601456', '103.84435473147903', '2021-04-14 18:17:09', '2021-04-14 18:17:12', '2021-04-14 18:17:12', '0:0', '', 'Present'),
(469, 14, '2021-04-15', '2021-04-15 09:02:50', '111.65.58.68', '2021-04-15 19:08:54', '111.65.58.68', '0', '1.4379145', '103.8446829', '1.3059104', '103.8543546', '2021-04-15 09:02:50', '2021-04-15 19:08:54', '2021-04-15 19:08:54', '10:6', '', 'Present'),
(470, 11, '2021-04-15', '2021-04-15 09:12:13', '111.65.58.101', '2021-04-16 09:06:10', '111.65.58.101', '0', '1.437593994575376', '103.84464875011243', '1.4372797163927962', '103.84434183828054', '2021-04-15 09:12:13', '2021-04-16 09:06:10', '2021-04-16 09:06:10', '0:0', '', 'Present'),
(471, 12, '2021-04-15', '2021-04-15 09:20:06', '111.65.59.81', '2021-04-16 09:04:57', '111.65.59.43', '0', '1.4373407247016485', '103.84435789158442', '1.4365167898173918', '103.83549825928874', '2021-04-15 09:20:06', '2021-04-16 09:04:57', '2021-04-16 09:04:57', '0:0', '', 'Present'),
(472, 13, '2021-04-15', '2021-04-15 09:20:57', '119.56.104.63', '2021-04-16 09:32:07', '119.56.111.229', '0', '1.4380295689229403', '103.84482300336569', '1.438081772306826', '103.84482537223403', '2021-04-15 09:20:57', '2021-04-16 09:32:07', '2021-04-16 09:32:07', '0:0', '', 'Present'),
(473, 13, '2021-04-15', '2021-04-15 09:20:57', '119.56.104.63', '2021-04-16 09:31:59', '119.56.111.229', '0', '1.4380295689229403', '103.84482300336569', '1.4380504448137483', '103.84485921811518', '2021-04-15 09:20:57', '2021-04-16 09:31:59', '2021-04-16 09:31:59', '0:0', '0:0', 'Present'),
(474, 13, '2021-04-15', '2021-04-15 09:20:57', '119.56.104.63', '2021-04-16 09:31:51', '119.56.111.229', '0', '1.4380295689229403', '103.84482300336569', '1.4380842367837816', '103.84487586217041', '2021-04-15 09:20:57', '2021-04-16 09:31:51', '2021-04-16 09:31:51', '0:0', '0:0', 'Present'),
(475, 13, '2021-04-15', '2021-04-15 09:20:57', '119.56.104.63', '2021-04-16 09:31:22', '119.56.111.229', '0', '1.4380295689229403', '103.84482300336569', '1.438137', '103.8448', '2021-04-15 09:20:57', '2021-04-16 09:31:22', '2021-04-16 09:31:22', '0:0', '0:0', 'Present'),
(476, 13, '2021-04-15', '2021-04-15 09:20:57', '119.56.104.63', '2021-04-16 09:30:54', '119.56.111.229', '0', '1.4380295689229403', '103.84482300336569', '1.4379471395637424', '103.84484350543997', '2021-04-15 09:20:57', '2021-04-16 09:30:54', '2021-04-16 09:30:54', '0:0', '0:0', 'Present'),
(477, 10, '2021-04-15', '2021-04-15 09:21:03', '118.200.94.12', '2021-04-16 09:16:20', '118.200.94.12', '0', '1.4379803', '103.8447959', '1.4372017', '103.8442699', '2021-04-15 09:21:03', '2021-04-16 09:16:20', '2021-04-16 09:16:20', '0:0', '', 'Present'),
(478, 15, '2021-04-15', '2021-04-15 09:22:42', '118.200.94.12', '2021-04-15 19:53:08', '122.11.212.162', '0', '1.4382154838963044', '103.84475368113897', '1.4202543695016083', '103.83182351544293', '2021-04-15 09:22:42', '2021-04-15 19:53:08', '2021-04-15 19:53:08', '10:30', '', 'Present'),
(479, 19, '2021-04-15', '2021-04-15 09:25:29', '118.200.94.12', '2021-04-16 09:26:53', '118.200.94.12', '0', '1.4378221351918605', '103.84492168623908', '1.4380371159671186', '103.84490814340613', '2021-04-15 09:25:29', '2021-04-16 09:26:53', '2021-04-16 09:26:53', '0:0', '', 'Present'),
(480, 22, '2021-04-15', '2021-04-15 09:26:29', '119.56.102.125', '2021-04-16 09:24:15', '119.56.107.117', '0', '1.4367645671190026', '103.84185907333442', '1.437658010460475', '103.84464085718503', '2021-04-15 09:26:29', '2021-04-16 09:24:15', '2021-04-16 09:24:15', '0:0', '', 'Present'),
(481, 16, '2021-04-15', '2021-04-15 09:30:01', '119.56.102.18', '', '', '1', '1.4374244027374277', '103.84379718377934', '', '', '2021-04-15 09:30:01', '2021-04-15 09:30:01', '2021-04-15 09:30:01', '', '', 'Present'),
(482, 21, '2021-04-15', '2021-04-15 09:34:31', '118.200.94.12', '2021-04-16 09:33:18', '118.200.94.12', '0', '1.437963768113614', '103.84499994095448', '1.4380121797797272', '103.84484057156489', '2021-04-15 09:34:31', '2021-04-16 09:33:18', '2021-04-16 09:33:18', '0:0', '', 'Present'),
(483, 18, '2021-04-15', '2021-04-15 09:39:11', '118.200.94.12', '2021-04-16 09:18:38', '119.56.105.132', '0', '1.437969538548186', '103.84502249805179', '1.4359580333876332', '103.84393006427486', '2021-04-15 09:39:11', '2021-04-16 09:18:38', '2021-04-16 09:18:38', '0:0', '', 'Present'),
(484, 14, '2021-04-16', '2021-04-16 09:02:04', '111.65.56.220', '2021-04-16 22:49:10', '111.65.56.220', '0', '1.4382078', '103.8443757', '1.4377099', '103.844513', '2021-04-16 09:02:04', '2021-04-16 22:49:10', '2021-04-16 22:49:10', '13:47', '', 'Present'),
(485, 11, '2021-04-16', '2021-04-16 09:06:14', '111.65.58.101', '', '', '1', '1.4372976579454426', '103.84434946646489', '', '', '2021-04-16 09:06:14', '2021-04-16 09:06:14', '2021-04-16 09:06:14', '', '', 'Present'),
(486, 10, '2021-04-16', '2021-04-16 09:16:26', '118.200.94.12', '', '', '1', '1.4372017', '103.8442699', '', '', '2021-04-16 09:16:26', '2021-04-16 09:16:26', '2021-04-16 09:16:26', '', '', 'Present'),
(487, 18, '2021-04-16', '2021-04-16 09:20:40', '119.56.105.132', '', '', '1', '1.4375250983076535', '103.84473381512491', '', '', '2021-04-16 09:20:40', '2021-04-16 09:20:40', '2021-04-16 09:20:40', '', '', 'Present'),
(488, 22, '2021-04-16', '2021-04-16 09:25:00', '119.56.107.117', '', '', '1', '1.437685443146393', '103.84459918237863', '', '', '2021-04-16 09:25:00', '2021-04-16 09:25:00', '2021-04-16 09:25:00', '', '', 'Present'),
(489, 19, '2021-04-16', '2021-04-16 09:26:58', '118.200.94.12', '', '', '1', '1.4379703949376328', '103.84501660957113', '', '', '2021-04-16 09:26:58', '2021-04-16 09:26:58', '2021-04-16 09:26:58', '', '', 'Present'),
(490, 15, '2021-04-16', '2021-04-16 09:30:51', '122.11.212.27', '2021-04-16 18:31:33', '118.200.94.12', '0', '1.4378199290137095', '103.84469239544616', '1.437941238694458', '103.84498143961176', '2021-04-16 09:30:51', '2021-04-16 18:31:33', '2021-04-16 18:31:33', '9:0', '', 'Present'),
(491, 13, '2021-04-16', '2021-04-16 09:32:12', '119.56.111.229', '', '', '1', '1.4380518959956108', '103.84485177876661', '', '', '2021-04-16 09:32:12', '2021-04-16 09:32:12', '2021-04-16 09:32:12', '', '', 'Present'),
(492, 21, '2021-04-16', '2021-04-16 09:33:24', '118.200.94.12', '', '', '1', '1.4380890097674086', '103.84477108221668', '', '', '2021-04-16 09:33:24', '2021-04-16 09:33:24', '2021-04-16 09:33:24', '', '', 'Present'),
(493, 12, '2021-04-16', '2021-04-16 10:17:22', '118.200.94.12', '2021-04-16 21:50:37', '111.65.70.98', '0', '1.4379408282509532', '103.84495012953579', '1.3805946704837444', '103.84143030857355', '2021-04-16 10:17:22', '2021-04-16 21:50:37', '2021-04-16 21:50:37', '11:33', '', 'Present'),
(494, 14, '2021-04-17', '2021-04-17 09:51:16', '111.65.56.220', '2021-04-17 18:42:19', '111.65.56.220', '0', '1.4376687', '103.8444515', '1.437987', '103.8447236', '2021-04-17 09:51:16', '2021-04-17 18:42:19', '2021-04-17 18:42:19', '8:51', '', 'Present'),
(495, 14, '2021-04-19', '2021-04-19 08:59:44', '111.65.70.5', '2021-04-19 22:24:40', '111.65.70.5', '0', '1.4379591', '103.8447406', '1.4380037', '103.8447261', '2021-04-19 08:59:44', '2021-04-19 22:24:40', '2021-04-19 22:24:40', '13:24', '', 'Present'),
(496, 12, '2021-04-19', '2021-04-19 09:25:53', '111.65.69.133', '2021-04-19 19:36:47', '111.65.69.133', '0', '1.437079369800043', '103.84399069356573', '1.3390757073908304', '103.91243155500733', '2021-04-19 09:25:53', '2021-04-19 19:36:47', '2021-04-19 19:36:47', '10:10', '', 'Present'),
(497, 14, '2021-04-20', '2021-04-20 09:08:30', '111.65.70.5', '2021-04-20 18:30:51', '111.65.70.5', '0', '1.4378971', '103.8407001', '1.4379722', '103.8447935', '2021-04-20 09:08:30', '2021-04-20 18:30:51', '2021-04-20 18:30:51', '9:22', '', 'Present'),
(498, 14, '2021-04-21', '2021-04-21 09:03:21', '111.65.70.38', '2021-04-21 19:00:37', '111.65.70.38', '0', '1.4376764', '103.8438431', '1.3045665', '103.8513263', '2021-04-21 09:03:21', '2021-04-21 19:00:37', '2021-04-21 19:00:37', '9:57', '', 'Present'),
(499, 14, '2021-04-22', '2021-04-22 08:12:37', '111.65.32.126', '2021-04-22 18:30:22', '111.65.32.126', '0', '1.4373407', '103.8437546', '1.4380193', '103.8447738', '2021-04-22 08:12:37', '2021-04-22 18:30:22', '2021-04-22 18:30:22', '10:17', '', 'Present'),
(500, 14, '2021-04-23', '2021-04-23 08:39:24', '111.65.32.105', '2021-04-23 18:49:28', '111.65.32.105', '0', '1.4369594', '103.8438545', '1.4371535', '103.8441044', '2021-04-23 08:39:24', '2021-04-23 18:49:28', '2021-04-23 18:49:28', '10:10', '', 'Present'),
(501, 14, '2021-04-26', '2021-04-26 08:45:28', '111.65.32.91', '2021-04-26 18:31:32', '111.65.32.91', '0', '1.437963', '103.8440174', '1.4380111', '103.8447842', '2021-04-26 08:45:28', '2021-04-26 18:31:32', '2021-04-26 18:31:32', '9:46', '', 'Present'),
(502, 14, '2021-04-27', '2021-04-27 08:32:19', '111.65.32.91', '2021-04-27 18:38:45', '111.65.32.91', '0', '1.4367708', '103.8441536', '1.4379866', '103.8447759', '2021-04-27 08:32:19', '2021-04-27 18:38:45', '2021-04-27 18:38:45', '10:6', '', 'Present'),
(503, 14, '2021-04-28', '2021-04-28 09:01:41', '111.65.32.85', '2021-04-28 21:26:12', '111.65.47.5', '0', '1.4362257', '103.8426682', '1.4379935', '103.8448057', '2021-04-28 09:01:41', '2021-04-28 21:26:12', '2021-04-28 21:26:12', '12:24', '', 'Present'),
(504, 14, '2021-04-29', '2021-04-29 08:58:07', '111.65.47.34', '2021-04-29 22:45:17', '111.65.47.34', '0', '1.4382882', '103.8444367', '1.4379984', '103.844752', '2021-04-29 08:58:07', '2021-04-29 22:45:17', '2021-04-29 22:45:17', '13:47', '', 'Present'),
(505, 14, '2021-04-30', '2021-04-30 08:16:44', '111.65.47.8', '2021-04-30 21:38:51', '111.65.47.8', '0', '1.4368956', '103.8434644', '1.3130728', '103.842705', '2021-04-30 08:16:44', '2021-04-30 21:38:51', '2021-04-30 21:38:51', '13:22', '', 'Present'),
(506, 14, '2021-05-03', '2021-05-03 08:30:54', '111.65.47.34', '2021-05-03 18:31:21', '111.65.47.34', '0', '1.4375528', '103.8442654', '1.4376942', '103.8444404', '2021-05-03 08:30:54', '2021-05-03 18:31:21', '2021-05-03 18:31:21', '10:0', '', 'Present'),
(507, 14, '2021-05-04', '2021-05-04 09:00:06', '111.65.47.50', '2021-05-04 18:30:13', '111.65.47.50', '0', '1.4377388', '103.8438506', '1.4380046', '103.8447261', '2021-05-04 09:00:06', '2021-05-04 18:30:13', '2021-05-04 18:30:13', '9:30', '', 'Present'),
(508, 14, '2021-05-05', '2021-05-05 08:56:42', '111.65.47.50', '2021-05-05 18:30:34', '111.65.47.50', '0', '1.4375616', '103.8438866', '1.4379619', '103.8448664', '2021-05-05 08:56:42', '2021-05-05 18:30:34', '2021-05-05 18:30:34', '9:33', '', 'Present'),
(509, 14, '2021-05-06', '2021-05-06 08:55:04', '111.65.47.14', '2021-05-06 18:31:57', '111.65.47.14', '0', '1.4379508', '103.8440238', '1.4379837', '103.8448061', '2021-05-06 08:55:04', '2021-05-06 18:31:57', '2021-05-06 18:31:57', '9:36', '', 'Present'),
(510, 14, '2021-05-07', '2021-05-07 08:40:43', '111.65.47.15', '2021-05-07 18:33:33', '111.65.47.15', '0', '1.4375196', '103.84433', '1.437953', '103.8448542', '2021-05-07 08:40:43', '2021-05-07 18:33:33', '2021-05-07 18:33:33', '9:52', '', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `xin_attendance_time_request`
--

CREATE TABLE `xin_attendance_time_request` (
  `time_request_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `request_date` varchar(255) NOT NULL,
  `request_date_request` varchar(255) NOT NULL,
  `request_clock_in` varchar(200) NOT NULL,
  `request_clock_out` varchar(200) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `project_no` varchar(200) NOT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `request_reason` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_awards`
--

CREATE TABLE `xin_awards` (
  `award_id` int(50) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `company_id` int(50) DEFAULT NULL,
  `employee_id` int(50) DEFAULT NULL,
  `award_type_id` int(50) DEFAULT NULL,
  `gift_item` varchar(200) DEFAULT NULL,
  `cash_price` varchar(200) DEFAULT NULL,
  `award_photo` varchar(255) DEFAULT NULL,
  `award_month_year` varchar(200) DEFAULT NULL,
  `award_information` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_awards`
--

INSERT INTO `xin_awards` (`award_id`, `name`, `company_id`, `employee_id`, `award_type_id`, `gift_item`, `cash_price`, `award_photo`, `award_month_year`, `award_information`, `description`, `created_at`) VALUES
(114, 'Award name', 1, 16, 1, 'GIft b12312313', 'Cash 123', NULL, '2022-06-01', '535345354345345455', '2132132132123123123', '2022-06-27 18:00:19'),
(115, 'Award name', 1, 16, 1, 'GIft b12312313', 'Cash 123', NULL, '2022-06-01', '535345354345345455', '2132132132123123123', '2022-06-27 18:00:25'),
(116, 'Award name', 1, 16, 1, 'GIft b12312313', 'Cash 123', NULL, '2022-06-01', '535345354345345455', '2132132132123123123', '2022-06-27 18:00:27'),
(117, 'Award name', 1, 16, 1, 'GIft b12312313', 'Cash 123', NULL, '2022-06-01', '535345354345345455', '2132132132123123123', '2022-06-27 18:00:28'),
(118, 'Award name', 1, 16, 1, 'GIft b12312313', 'Cash 123', NULL, '2022-06-01', '535345354345345455', '2132132132123123123', '2022-06-27 18:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `xin_award_type`
--

CREATE TABLE `xin_award_type` (
  `award_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `award_type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_award_type`
--

INSERT INTO `xin_award_type` (`award_type_id`, `company_id`, `award_type`, `created_at`) VALUES
(1, 1, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_chat_messages`
--

CREATE TABLE `xin_chat_messages` (
  `message_id` int(11) UNSIGNED NOT NULL,
  `from_id` varchar(40) NOT NULL DEFAULT '',
  `to_id` varchar(50) NOT NULL DEFAULT '',
  `message_frm` varchar(255) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `message_content` longtext NOT NULL,
  `message_date` varchar(255) DEFAULT NULL,
  `recd` tinyint(1) NOT NULL DEFAULT 0,
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `department_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_chat_messages`
--

INSERT INTO `xin_chat_messages` (`message_id`, `from_id`, `to_id`, `message_frm`, `is_read`, `message_content`, `message_date`, `recd`, `message_type`, `department_id`, `location_id`) VALUES
(1, '10', '11', '11', 1, 'Testing', '2021-01-26 18:41:21', 0, '', 0, 0),
(2, '11', '10', '10', 1, 'What??', '2021-01-26 18:41:45', 0, '', 0, 0),
(3, '6', '24', '24', 1, 'hi babe', '2021-02-23 14:55:48', 0, '', 0, 0),
(4, '6', '5', '5', 0, 'hi babe', '2021-02-23 14:56:15', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xin_clients`
--

CREATE TABLE `xin_clients` (
  `client_id` int(111) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int(11) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `is_active` int(11) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_companies`
--

CREATE TABLE `xin_companies` (
  `company_id` int(111) NOT NULL,
  `type_id` int(111) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `trading_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registration_no` varchar(255) DEFAULT NULL,
  `government_tax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` int(111) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `default_currency` varchar(200) DEFAULT NULL,
  `default_timezone` varchar(200) DEFAULT NULL,
  `added_by` int(111) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_companies`
--

INSERT INTO `xin_companies` (`company_id`, `type_id`, `name`, `trading_name`, `username`, `password`, `registration_no`, `government_tax`, `email`, `logo`, `contact_number`, `website_url`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `is_active`, `default_currency`, `default_timezone`, `added_by`, `created_at`) VALUES
(1, 1, 'SGM', 'SG Motor Link Pte Ltd', 'sgml', '', '201817226E', '201817226E', 'sales@sgml.com.sg', 'logo_1526958729.png', '65 6250 8527', 'sgml.com.sg', '15 Yishun Industrial Street 1 #01-08 Win 5', 'address 2', 'singapore', 'singapore', '768091', 195, 0, 'SGD - s$', 'Asia/Singapore', 1, '22-05-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_documents`
--

CREATE TABLE `xin_company_documents` (
  `document_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `license_name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `license_number` varchar(255) NOT NULL,
  `license_notification` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_company_documents`
--

INSERT INTO `xin_company_documents` (`document_id`, `document_type_id`, `license_name`, `company_id`, `expiry_date`, `license_number`, `license_notification`, `added_by`, `document`, `created_at`) VALUES
(1, 1, 'licnese Name 34343', 1, '2022-05-04', '1321513213', 2, 1, 'Document_1653652471_Screenshot (4).png', '2022-05-27 17:24:31'),
(2, 1, 'licnese Name 3434343434', 1, '2022-05-23', '343434343434', 3, 1, 'Document_1653652810_Screenshot (1).png', '2022-05-27 17:30:10'),
(3, 1, 'licnese Name 3434343434', 1, '2022-05-01', '343434343434', 2, 1, 'Document_1653763446_Screenshot (7).png', '2022-05-29 00:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_info`
--

CREATE TABLE `xin_company_info` (
  `company_info_id` int(111) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo_second` varchar(255) NOT NULL,
  `sign_in_logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `website_url` mediumtext NOT NULL,
  `starting_year` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_contact` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_info`
--

INSERT INTO `xin_company_info` (`company_info_id`, `logo`, `logo_second`, `sign_in_logo`, `favicon`, `website_url`, `starting_year`, `company_name`, `company_email`, `company_contact`, `contact_person`, `email`, `phone`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `updated_at`) VALUES
(1, 'logo_1590791621.png', 'logo2_1520609223.png', 'signin_logo_1590790256.png', 'favicon_1590791608.png', '', '', 'SG Motor Link Pte Ltd', '', '', 'YK Ong', 'ciayie@sgml.com.sg', '62508527', '15 Yishun Industrial Street 1 #01-08 Win 5', 'Address Line 2', 'City', 'State', '768091', 195, '2017-05-20 12:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_policy`
--

CREATE TABLE `xin_company_policy` (
  `policy_id` int(111) NOT NULL,
  `company_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_policy`
--

INSERT INTO `xin_company_policy` (`policy_id`, `company_id`, `title`, `description`, `attachment`, `added_by`, `created_at`) VALUES
(1, 1, 'Smoke-Free Work', 'Smoke-Free Work Environment Policy Close', NULL, 1, '28-02-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_type`
--

CREATE TABLE `xin_company_type` (
  `type_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_type`
--

INSERT INTO `xin_company_type` (`type_id`, `name`, `created_at`) VALUES
(1, 'Corporation', ''),
(2, 'Exempt Organization', ''),
(3, 'Partnership', ''),
(4, 'Private Foundation', ''),
(5, 'Limited Liability Company', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_contract_type`
--

CREATE TABLE `xin_contract_type` (
  `contract_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_contract_type`
--

INSERT INTO `xin_contract_type` (`contract_type_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'Permanent', '05-04-2018 06:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_contribution_funds`
--

CREATE TABLE `xin_contribution_funds` (
  `id` int(11) NOT NULL,
  `contribution` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_contribution_funds`
--

INSERT INTO `xin_contribution_funds` (`id`, `contribution`, `created_at`, `updated_at`) VALUES
(1, 'MBMF', '2021-01-13 09:34:31', NULL),
(2, 'SINDA', '2021-01-13 09:34:31', NULL),
(3, 'CDAC', '2021-01-13 09:34:31', NULL),
(4, 'ECF', '2021-01-13 09:34:31', NULL),
(5, 'SDL', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_contribution_payslip`
--

CREATE TABLE `xin_contribution_payslip` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `contribution_id` int(11) NOT NULL,
  `contribution_amount` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_contribution_payslip`
--

INSERT INTO `xin_contribution_payslip` (`id`, `payslip_id`, `contribution_id`, `contribution_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2.50', '2021-01-15 07:00:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_contribution_rates`
--

CREATE TABLE `xin_contribution_rates` (
  `id` int(11) NOT NULL,
  `contribution_id` int(11) NOT NULL,
  `date_effect` date DEFAULT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  `contribution_amount` decimal(6,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_contribution_rates`
--

INSERT INTO `xin_contribution_rates` (`id`, `contribution_id`, `date_effect`, `min_salary`, `max_salary`, `contribution_amount`, `created_at`, `updated_at`) VALUES
(1, 1, '2016-06-01', NULL, '1000.00', '3.00', '2021-01-13 09:34:31', NULL),
(2, 1, '2016-06-01', '1000.00', '2000.00', '4.50', '2021-01-13 09:34:31', NULL),
(3, 1, '2016-06-01', '2000.00', '3000.00', '6.50', '2021-01-13 09:34:31', NULL),
(4, 1, '2016-06-01', '3000.00', '4000.00', '15.00', '2021-01-13 09:34:31', NULL),
(5, 1, '2016-06-01', '4000.00', '6000.00', '19.50', '2021-01-13 09:34:31', NULL),
(6, 1, '2016-06-01', '6000.00', '8000.00', '22.00', '2021-01-13 09:34:31', NULL),
(7, 1, '2016-06-01', '8000.00', '10000.00', '24.00', '2021-01-13 09:34:31', NULL),
(8, 1, '2016-06-01', '10000.00', NULL, '26.00', '2021-01-13 09:34:31', NULL),
(9, 2, '2015-01-01', NULL, '1000.00', '1.00', '2021-01-13 09:34:31', NULL),
(10, 2, '2015-01-01', '1000.00', '1500.00', '3.00', '2021-01-13 09:34:31', NULL),
(11, 2, '2015-01-01', '1500.00', '2500.00', '5.00', '2021-01-13 09:34:31', NULL),
(12, 2, '2015-01-01', '2500.00', '4500.00', '7.00', '2021-01-13 09:34:31', NULL),
(13, 2, '2015-01-01', '4500.00', '7500.00', '9.00', '2021-01-13 09:34:31', NULL),
(14, 2, '2015-01-01', '7500.00', '10000.00', '12.00', '2021-01-13 09:34:31', NULL),
(15, 2, '2015-01-01', '10000.00', '15000.00', '18.00', '2021-01-13 09:34:31', NULL),
(16, 2, '2015-01-01', '15000.00', NULL, '30.00', '2021-01-13 09:34:31', NULL),
(17, 3, '2015-01-01', NULL, '2000.00', '0.50', '2021-01-13 09:34:31', NULL),
(18, 3, '2015-01-01', '2000.00', '3500.00', '1.00', '2021-01-13 09:34:31', NULL),
(19, 3, '2015-01-01', '3500.00', '5000.00', '1.50', '2021-01-13 09:34:31', NULL),
(20, 3, '2015-01-01', '5000.00', '7500.00', '2.00', '2021-01-13 09:34:31', NULL),
(21, 3, '2015-01-01', '7500.00', NULL, '3.00', '2021-01-13 09:34:31', NULL),
(22, 4, '2015-01-01', NULL, '1000.00', '2.00', '2021-01-13 09:34:31', NULL),
(23, 4, '2015-01-01', '1000.00', '1500.00', '4.00', '2021-01-13 09:34:31', NULL),
(24, 4, '2015-01-01', '1500.00', '2500.00', '6.00', '2021-01-13 09:34:31', NULL),
(25, 4, '2015-01-01', '2500.00', '4000.00', '9.00', '2021-01-13 09:34:31', NULL),
(26, 4, '2015-01-01', '4000.00', '7000.00', '12.00', '2021-01-13 09:34:31', NULL),
(27, 4, '2015-01-01', '7000.00', '10000.00', '16.00', '2021-01-13 09:34:31', NULL),
(28, 4, '2015-01-01', '10000.00', NULL, '20.00', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_countries`
--

CREATE TABLE `xin_countries` (
  `country_id` int(11) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_flag` varchar(255) NOT NULL,
  `iras_nationality_code` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_countries`
--

INSERT INTO `xin_countries` (`country_id`, `country_code`, `country_name`, `country_flag`, `iras_nationality_code`) VALUES
(1, '+93', 'Afghanistan', 'flag_1500831780.gif', NULL),
(2, '+355', 'Albania', 'flag_1500831815.gif', NULL),
(3, 'DZ', 'Algeria', '', NULL),
(4, 'DS', 'American Samoa', '', NULL),
(5, 'AD', 'Andorra', '', NULL),
(6, 'AO', 'Angola', '', NULL),
(7, 'AI', 'Anguilla', '', NULL),
(8, 'AQ', 'Antarctica', '', NULL),
(9, 'AG', 'Antigua and Barbuda', '', NULL),
(10, 'AR', 'Argentina', '', NULL),
(11, 'AM', 'Armenia', '', NULL),
(12, 'AW', 'Aruba', '', NULL),
(13, 'AU', 'Australia', '', NULL),
(14, 'AT', 'Austria', '', NULL),
(15, 'AZ', 'Azerbaijan', '', NULL),
(16, 'BS', 'Bahamas', '', NULL),
(17, 'BH', 'Bahrain', '', NULL),
(18, 'BD', 'Bangladesh', '', NULL),
(19, 'BB', 'Barbados', '', NULL),
(20, 'BY', 'Belarus', '', NULL),
(21, 'BE', 'Belgium', '', NULL),
(22, 'BZ', 'Belize', '', NULL),
(23, 'BJ', 'Benin', '', NULL),
(24, 'BM', 'Bermuda', '', NULL),
(25, 'BT', 'Bhutan', '', NULL),
(26, 'BO', 'Bolivia', '', NULL),
(27, 'BA', 'Bosnia and Herzegovina', '', NULL),
(28, 'BW', 'Botswana', '', NULL),
(29, 'BV', 'Bouvet Island', '', NULL),
(30, 'BR', 'Brazil', '', NULL),
(31, 'IO', 'British Indian Ocean Territory', '', NULL),
(32, 'BN', 'Brunei Darussalam', '', NULL),
(33, 'BG', 'Bulgaria', '', NULL),
(34, 'BF', 'Burkina Faso', '', NULL),
(35, 'BI', 'Burundi', '', NULL),
(36, 'KH', 'Cambodia', '', NULL),
(37, 'CM', 'Cameroon', '', NULL),
(38, 'CA', 'Canada', '', NULL),
(39, 'CV', 'Cape Verde', '', NULL),
(40, 'KY', 'Cayman Islands', '', NULL),
(41, 'CF', 'Central African Republic', '', NULL),
(42, 'TD', 'Chad', '', NULL),
(43, 'CL', 'Chile', '', NULL),
(44, 'CN', 'China', '', NULL),
(45, 'CX', 'Christmas Island', '', NULL),
(46, 'CC', 'Cocos (Keeling) Islands', '', NULL),
(47, 'CO', 'Colombia', '', NULL),
(48, 'KM', 'Comoros', '', NULL),
(49, 'CG', 'Congo', '', NULL),
(50, 'CK', 'Cook Islands', '', NULL),
(51, 'CR', 'Costa Rica', '', NULL),
(52, 'HR', 'Croatia (Hrvatska)', '', NULL),
(53, 'CU', 'Cuba', '', NULL),
(54, 'CY', 'Cyprus', '', NULL),
(55, 'CZ', 'Czech Republic', '', NULL),
(56, 'DK', 'Denmark', '', NULL),
(57, 'DJ', 'Djibouti', '', NULL),
(58, 'DM', 'Dominica', '', NULL),
(59, 'DO', 'Dominican Republic', '', NULL),
(60, 'TP', 'East Timor', '', NULL),
(61, 'EC', 'Ecuador', '', NULL),
(62, 'EG', 'Egypt', '', NULL),
(63, 'SV', 'El Salvador', '', NULL),
(64, 'GQ', 'Equatorial Guinea', '', NULL),
(65, 'ER', 'Eritrea', '', NULL),
(66, 'EE', 'Estonia', '', NULL),
(67, 'ET', 'Ethiopia', '', NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', '', NULL),
(69, 'FO', 'Faroe Islands', '', NULL),
(70, 'FJ', 'Fiji', '', NULL),
(71, 'FI', 'Finland', '', NULL),
(72, 'FR', 'France', '', NULL),
(73, 'FX', 'France, Metropolitan', '', NULL),
(74, 'GF', 'French Guiana', '', NULL),
(75, 'PF', 'French Polynesia', '', NULL),
(76, 'TF', 'French Southern Territories', '', NULL),
(77, 'GA', 'Gabon', '', NULL),
(78, 'GM', 'Gambia', '', NULL),
(79, 'GE', 'Georgia', '', NULL),
(80, 'DE', 'Germany', '', NULL),
(81, 'GH', 'Ghana', '', NULL),
(82, 'GI', 'Gibraltar', '', NULL),
(83, 'GK', 'Guernsey', '', NULL),
(84, 'GR', 'Greece', '', NULL),
(85, 'GL', 'Greenland', '', NULL),
(86, 'GD', 'Grenada', '', NULL),
(87, 'GP', 'Guadeloupe', '', NULL),
(88, 'GU', 'Guam', '', NULL),
(89, 'GT', 'Guatemala', '', NULL),
(90, 'GN', 'Guinea', '', NULL),
(91, 'GW', 'Guinea-Bissau', '', NULL),
(92, 'GY', 'Guyana', '', NULL),
(93, 'HT', 'Haiti', '', NULL),
(94, 'HM', 'Heard and Mc Donald Islands', '', NULL),
(95, 'HN', 'Honduras', '', NULL),
(96, 'HK', 'Hong Kong', '', NULL),
(97, 'HU', 'Hungary', '', NULL),
(98, 'IS', 'Iceland', '', NULL),
(99, 'IN', 'India', '', 354),
(100, 'IM', 'Isle of Man', '', NULL),
(101, 'ID', 'Indonesia', '', NULL),
(102, 'IR', 'Iran (Islamic Republic of)', '', NULL),
(103, 'IQ', 'Iraq', '', NULL),
(104, 'IE', 'Ireland', '', NULL),
(105, 'IL', 'Israel', '', NULL),
(106, 'IT', 'Italy', '', NULL),
(107, 'CI', 'Ivory Coast', '', NULL),
(108, 'JE', 'Jersey', '', NULL),
(109, 'JM', 'Jamaica', '', NULL),
(110, 'JP', 'Japan', '', NULL),
(111, 'JO', 'Jordan', '', NULL),
(112, 'KZ', 'Kazakhstan', '', NULL),
(113, 'KE', 'Kenya', '', NULL),
(114, 'KI', 'Kiribati', '', NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', '', NULL),
(116, 'KR', 'Korea, Republic of', '', NULL),
(117, 'XK', 'Kosovo', '', NULL),
(118, 'KW', 'Kuwait', '', NULL),
(119, 'KG', 'Kyrgyzstan', '', NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', '', NULL),
(121, 'LV', 'Latvia', '', NULL),
(122, 'LB', 'Lebanon', '', NULL),
(123, 'LS', 'Lesotho', '', NULL),
(124, 'LR', 'Liberia', '', NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', '', NULL),
(126, 'LI', 'Liechtenstein', '', NULL),
(127, 'LT', 'Lithuania', '', NULL),
(128, 'LU', 'Luxembourg', '', NULL),
(129, 'MO', 'Macau', '', NULL),
(130, 'MK', 'Macedonia', '', NULL),
(131, 'MG', 'Madagascar', '', NULL),
(132, 'MW', 'Malawi', '', NULL),
(133, 'MY', 'Malaysia', '', NULL),
(134, 'MV', 'Maldives', '', NULL),
(135, 'ML', 'Mali', '', NULL),
(136, 'MT', 'Malta', '', NULL),
(137, 'MH', 'Marshall Islands', '', NULL),
(138, 'MQ', 'Martinique', '', NULL),
(139, 'MR', 'Mauritania', '', NULL),
(140, 'MU', 'Mauritius', '', NULL),
(141, 'TY', 'Mayotte', '', NULL),
(142, 'MX', 'Mexico', '', NULL),
(143, 'FM', 'Micronesia, Federated States of', '', NULL),
(144, 'MD', 'Moldova, Republic of', '', NULL),
(145, 'MC', 'Monaco', '', NULL),
(146, 'MN', 'Mongolia', '', NULL),
(147, 'ME', 'Montenegro', '', NULL),
(148, 'MS', 'Montserrat', '', NULL),
(149, 'MA', 'Morocco', '', NULL),
(150, 'MZ', 'Mozambique', '', NULL),
(151, 'MM', 'Myanmar', '', NULL),
(152, 'NA', 'Namibia', '', NULL),
(153, 'NR', 'Nauru', '', NULL),
(154, 'NP', 'Nepal', '', NULL),
(155, 'NL', 'Netherlands', '', NULL),
(156, 'AN', 'Netherlands Antilles', '', NULL),
(157, 'NC', 'New Caledonia', '', NULL),
(158, 'NZ', 'New Zealand', '', NULL),
(159, 'NI', 'Nicaragua', '', NULL),
(160, 'NE', 'Niger', '', NULL),
(161, 'NG', 'Nigeria', '', NULL),
(162, 'NU', 'Niue', '', NULL),
(163, 'NF', 'Norfolk Island', '', NULL),
(164, 'MP', 'Northern Mariana Islands', '', NULL),
(165, 'NO', 'Norway', '', NULL),
(166, 'OM', 'Oman', '', NULL),
(167, 'PK', 'Pakistan', '', NULL),
(168, 'PW', 'Palau', '', NULL),
(169, 'PS', 'Palestine', '', NULL),
(170, 'PA', 'Panama', '', NULL),
(171, 'PG', 'Papua New Guinea', '', NULL),
(172, 'PY', 'Paraguay', '', NULL),
(173, 'PE', 'Peru', '', NULL),
(174, 'PH', 'Philippines', '', NULL),
(175, 'PN', 'Pitcairn', '', NULL),
(176, 'PL', 'Poland', '', NULL),
(177, 'PT', 'Portugal', '', NULL),
(178, 'PR', 'Puerto Rico', '', NULL),
(179, 'QA', 'Qatar', '', NULL),
(180, 'RE', 'Reunion', '', NULL),
(181, 'RO', 'Romania', '', NULL),
(182, 'RU', 'Russian Federation', '', NULL),
(183, 'RW', 'Rwanda', '', NULL),
(184, 'KN', 'Saint Kitts and Nevis', '', NULL),
(185, 'LC', 'Saint Lucia', '', NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', '', NULL),
(187, 'WS', 'Samoa', '', NULL),
(188, 'SM', 'San Marino', '', NULL),
(189, 'ST', 'Sao Tome and Principe', '', NULL),
(190, 'SA', 'Saudi Arabia', '', NULL),
(191, 'SN', 'Senegal', '', NULL),
(192, 'RS', 'Serbia', '', NULL),
(193, 'SC', 'Seychelles', '', NULL),
(194, 'SL', 'Sierra Leone', '', NULL),
(195, 'SG', 'Singapore', '', 301),
(196, 'SK', 'Slovakia', '', NULL),
(197, 'SI', 'Slovenia', '', NULL),
(198, 'SB', 'Solomon Islands', '', NULL),
(199, 'SO', 'Somalia', '', NULL),
(200, 'ZA', 'South Africa', '', NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', '', NULL),
(202, 'ES', 'Spain', '', NULL),
(203, 'LK', 'Sri Lanka', '', NULL),
(204, 'SH', 'St. Helena', '', NULL),
(205, 'PM', 'St. Pierre and Miquelon', '', NULL),
(206, 'SD', 'Sudan', '', NULL),
(207, 'SR', 'Suriname', '', NULL),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', '', NULL),
(209, 'SZ', 'Swaziland', '', NULL),
(210, 'SE', 'Sweden', '', NULL),
(211, 'CH', 'Switzerland', '', NULL),
(212, 'SY', 'Syrian Arab Republic', '', NULL),
(213, 'TW', 'Taiwan', '', NULL),
(214, 'TJ', 'Tajikistan', '', NULL),
(215, 'TZ', 'Tanzania, United Republic of', '', NULL),
(216, 'TH', 'Thailand', '', NULL),
(217, 'TG', 'Togo', '', NULL),
(218, 'TK', 'Tokelau', '', NULL),
(219, 'TO', 'Tonga', '', NULL),
(220, 'TT', 'Trinidad and Tobago', '', NULL),
(221, 'TN', 'Tunisia', '', NULL),
(222, 'TR', 'Turkey', '', NULL),
(223, 'TM', 'Turkmenistan', '', NULL),
(224, 'TC', 'Turks and Caicos Islands', '', NULL),
(225, 'TV', 'Tuvalu', '', NULL),
(226, 'UG', 'Uganda', '', NULL),
(227, 'UA', 'Ukraine', '', NULL),
(228, 'AE', 'United Arab Emirates', '', NULL),
(229, 'GB', 'United Kingdom', '', NULL),
(230, 'US', 'United States', '', NULL),
(231, 'UM', 'United States minor outlying islands', '', NULL),
(232, 'UY', 'Uruguay', '', NULL),
(233, 'UZ', 'Uzbekistan', '', NULL),
(234, 'VU', 'Vanuatu', '', NULL),
(235, 'VA', 'Vatican City State', '', NULL),
(236, 'VE', 'Venezuela', '', NULL),
(237, 'VN', 'Vietnam', '', NULL),
(238, 'VG', 'Virgin Islands (British)', '', NULL),
(239, 'VI', 'Virgin Islands (U.S.)', '', NULL),
(240, 'WF', 'Wallis and Futuna Islands', '', NULL),
(241, 'EH', 'Western Sahara', '', NULL),
(242, 'YE', 'Yemen', '', NULL),
(243, 'ZR', 'Zaire', '', NULL),
(244, 'ZM', 'Zambia', '', NULL),
(245, 'ZW', 'Zimbabwe', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_cpf_options`
--

CREATE TABLE `xin_cpf_options` (
  `id` int(11) NOT NULL,
  `option_name` varchar(45) DEFAULT NULL,
  `option_value` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_cpf_options`
--

INSERT INTO `xin_cpf_options` (`id`, `option_name`, `option_value`, `created_at`, `updated_at`) VALUES
(1, 'ordinary_wage_cap', '6000', '2021-01-13 09:34:31', NULL),
(2, 'emp_upto_age', '55', '2021-01-13 09:34:31', NULL),
(3, 'emp_above_age', '65', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_cpf_payslip`
--

CREATE TABLE `xin_cpf_payslip` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `month_year` date NOT NULL,
  `ow_paid` decimal(13,4) NOT NULL,
  `ow_cpf` decimal(13,4) NOT NULL,
  `ow_cpf_employer` decimal(13,4) NOT NULL,
  `ow_cpf_employee` decimal(13,4) DEFAULT NULL,
  `aw_paid` decimal(13,4) DEFAULT NULL,
  `aw_cpf` decimal(13,4) DEFAULT NULL,
  `aw_cpf_employer` decimal(13,4) DEFAULT NULL,
  `aw_cpf_employee` decimal(13,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_cpf_payslip`
--

INSERT INTO `xin_cpf_payslip` (`id`, `payslip_id`, `month_year`, `ow_paid`, `ow_cpf`, `ow_cpf_employer`, `ow_cpf_employee`, `aw_paid`, `aw_cpf`, `aw_cpf_employer`, `aw_cpf_employee`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-01', '1000.0000', '1000.0000', '170.0000', '200.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2021-01-15 07:00:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_cpf_percentage`
--

CREATE TABLE `xin_cpf_percentage` (
  `id` int(11) NOT NULL,
  `immigration_status` int(11) NOT NULL,
  `immigration_status_year` int(11) DEFAULT NULL,
  `employee_age_from` int(11) DEFAULT NULL,
  `employee_age_to` int(11) DEFAULT NULL,
  `contribution_employer` float NOT NULL,
  `contribution_employee` float NOT NULL,
  `total_cpf` float NOT NULL,
  `effective_from` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_cpf_percentage`
--

INSERT INTO `xin_cpf_percentage` (`id`, `immigration_status`, `immigration_status_year`, `employee_age_from`, `employee_age_to`, `contribution_employer`, `contribution_employee`, `total_cpf`, `effective_from`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 55, 17, 20, 37, '2016-01-01', 1, '2021-01-13 09:34:31', '2020-09-03 15:27:05'),
(2, 1, NULL, 55, 60, 13, 13, 26, '2016-01-01', 1, '2021-01-13 09:34:31', '2020-09-03 15:27:05'),
(3, 1, NULL, 60, 65, 9, 7.5, 16.5, '2016-01-01', 1, '2021-01-13 09:34:31', '2020-09-03 15:27:05'),
(4, 1, NULL, 65, NULL, 7.5, 5, 12.5, '2016-01-01', 1, '2021-01-13 09:34:31', '2020-09-03 15:27:05'),
(5, 2, 1, NULL, 55, 4, 5, 9, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(6, 2, 1, 55, 60, 4, 5, 9, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(7, 2, 1, 60, 65, 3.5, 5, 8.5, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(8, 2, 1, 65, NULL, 3.5, 5, 8.5, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(9, 2, 2, NULL, 55, 9, 15, 24, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(10, 2, 2, 55, 60, 6, 12.5, 18.5, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(11, 2, 2, 60, 65, 3.5, 7.5, 11, '2016-01-01', 1, '2021-01-13 09:34:31', NULL),
(12, 2, 2, 65, NULL, 3.5, 5, 8.5, '2016-01-01', 1, '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_cpf_submission`
--

CREATE TABLE `xin_cpf_submission` (
  `id` int(11) NOT NULL,
  `csn` varchar(45) NOT NULL,
  `month_year` date NOT NULL,
  `no_employees` int(11) NOT NULL,
  `no_records` int(11) NOT NULL,
  `cpf_contribution_amount` decimal(10,2) NOT NULL,
  `other_contribution` decimal(10,2) NOT NULL,
  `total_contribution_amount` decimal(13,2) NOT NULL,
  `cpf_file` varchar(128) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_currencies`
--

CREATE TABLE `xin_currencies` (
  `currency_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_currencies`
--

INSERT INTO `xin_currencies` (`currency_id`, `company_id`, `name`, `code`, `symbol`) VALUES
(1, 1, 'Singapore Dollars', 'SGD', 's$');

-- --------------------------------------------------------

--
-- Table structure for table `xin_currency_converter`
--

CREATE TABLE `xin_currency_converter` (
  `currency_converter_id` int(11) NOT NULL,
  `usd_currency` varchar(11) NOT NULL DEFAULT '1',
  `to_currency_title` varchar(200) NOT NULL,
  `to_currency_rate` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_currency_converter`
--

INSERT INTO `xin_currency_converter` (`currency_converter_id`, `usd_currency`, `to_currency_title`, `to_currency_rate`, `created_at`) VALUES
(1, '1', 'MYR', '4.11', '17-08-2018 03:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `xin_database_backup`
--

CREATE TABLE `xin_database_backup` (
  `backup_id` int(111) NOT NULL,
  `backup_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_departments`
--

CREATE TABLE `xin_departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `location_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_departments`
--

INSERT INTO `xin_departments` (`department_id`, `department_name`, `company_id`, `location_id`, `employee_id`, `added_by`, `created_at`, `status`) VALUES
(1, 'Sales', 1, 1, 0, 1, '2021-01-15 14:32:00', 1),
(2, 'Admin', 1, 1, 0, 1, '2021-01-15 14:32:06', 1),
(3, 'General Worker', 1, 1, 0, 2, '2021-01-15 17:19:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_designations`
--

CREATE TABLE `xin_designations` (
  `designation_id` int(11) NOT NULL,
  `top_designation_id` int(11) NOT NULL DEFAULT 0,
  `department_id` int(200) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `designation_name` varchar(200) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_designations`
--

INSERT INTO `xin_designations` (`designation_id`, `top_designation_id`, `department_id`, `sub_department_id`, `company_id`, `designation_name`, `added_by`, `created_at`, `status`) VALUES
(1, 0, 2, 0, 1, 'Admin', 1, '15-01-2021', 1),
(2, 0, 1, 0, 1, 'Junior Sales', 1, '15-01-2021', 1),
(3, 0, 1, 0, 1, 'Senior Sales', 2, '15-01-2021', 1),
(4, 0, 1, 0, 1, 'Junior Assistance Broker', 2, '15-01-2021', 1),
(5, 0, 1, 0, 1, 'Assistant Broker', 2, '15-01-2021', 1),
(6, 0, 1, 0, 1, 'Broker', 2, '15-01-2021', 1),
(7, 0, 3, 0, 1, 'General Worker', 2, '15-01-2021', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_document_type`
--

CREATE TABLE `xin_document_type` (
  `document_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_document_type`
--

INSERT INTO `xin_document_type` (`document_type_id`, `company_id`, `document_type`, `created_at`) VALUES
(1, 1, 'Driving License', '09-05-2018 12:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `xin_efiling_appendix8a`
--

CREATE TABLE `xin_efiling_appendix8a` (
  `id` int(11) NOT NULL,
  `ap8a_key` varchar(256) NOT NULL,
  `submission_key` varchar(256) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ap8a_year` year(4) NOT NULL,
  `accommodation` decimal(13,2) DEFAULT NULL,
  `utilities_housekeeping` decimal(13,2) DEFAULT NULL,
  `hotel_accommodation` decimal(13,2) DEFAULT NULL,
  `other_benefits` decimal(13,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_efiling_appendix8b`
--

CREATE TABLE `xin_efiling_appendix8b` (
  `id` int(11) NOT NULL,
  `ap8b_key` varchar(256) NOT NULL,
  `submission_key` varchar(256) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ap8b_year` year(4) NOT NULL,
  `gross_amount_eebr` decimal(13,2) DEFAULT NULL,
  `gross_amount_eris_sme` decimal(13,2) DEFAULT NULL,
  `gross_amount_eris_corp` decimal(13,2) DEFAULT NULL,
  `gross_amount_eris_startup` decimal(13,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_efiling_details`
--

CREATE TABLE `xin_efiling_details` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `csn` varchar(45) NOT NULL,
  `organisation_id_type` varchar(45) NOT NULL,
  `organisation_id_no` varchar(45) NOT NULL,
  `authorised_name` varchar(45) NOT NULL,
  `authorised_designation` varchar(45) NOT NULL,
  `authorised_id_type` int(11) DEFAULT NULL,
  `authorised_id_no` varchar(45) DEFAULT NULL,
  `authorised_email` varchar(45) DEFAULT NULL,
  `authorised_phone` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_efiling_ir8a`
--

CREATE TABLE `xin_efiling_ir8a` (
  `id` int(11) NOT NULL,
  `ir8a_key` varchar(128) NOT NULL,
  `submission_key` varchar(256) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ir8a_year` year(4) NOT NULL,
  `gross_salary` decimal(13,2) NOT NULL,
  `bonus` decimal(13,2) DEFAULT NULL,
  `director_fee` decimal(13,2) DEFAULT NULL,
  `allowance_transport` decimal(13,2) DEFAULT NULL,
  `allowance_entertainment` decimal(13,2) DEFAULT NULL,
  `allowance_other` decimal(13,2) DEFAULT NULL,
  `gross_commission` decimal(13,2) DEFAULT NULL,
  `pension` decimal(13,2) DEFAULT NULL,
  `gratuity` decimal(13,2) DEFAULT NULL,
  `notice_pay` decimal(13,2) DEFAULT NULL,
  `ex_gratia_payment` decimal(13,2) DEFAULT NULL,
  `other_lump_sum` decimal(13,2) DEFAULT NULL,
  `comp_loss_office` decimal(13,2) DEFAULT NULL,
  `approval_iras` tinyint(4) DEFAULT NULL,
  `date_of_approval` date DEFAULT NULL,
  `reason_for_payment` tinytext DEFAULT NULL,
  `length_of_service` varchar(128) DEFAULT NULL,
  `basis_of_payment` mediumtext DEFAULT NULL,
  `retirement_benefits_fund_name` varchar(128) DEFAULT NULL,
  `amount_upto_1992` decimal(13,2) DEFAULT NULL,
  `amount_from_1993` decimal(13,2) DEFAULT NULL,
  `overseas_provident_fund` varchar(128) DEFAULT NULL,
  `full_contribution_amount` decimal(13,2) DEFAULT NULL,
  `contriubution_mandatory` tinyint(4) DEFAULT NULL,
  `contriubtion_claimed` tinyint(4) DEFAULT NULL,
  `excess_cpf_contribution_ir8s` decimal(13,2) DEFAULT NULL,
  `stock_gains_ap8b` decimal(13,2) DEFAULT NULL,
  `benefits_in_kind_ap8a` decimal(13,2) DEFAULT NULL,
  `total_d1_to_d9` decimal(13,2) DEFAULT NULL,
  `remission_amount` decimal(13,2) DEFAULT NULL,
  `overseas_posting` varchar(128) DEFAULT NULL,
  `exempt_income` decimal(13,2) DEFAULT NULL,
  `tax_borne_by_employer` tinyint(4) DEFAULT NULL,
  `partial_tax_amount` decimal(13,2) DEFAULT NULL,
  `fixed_tax_amount` decimal(13,2) DEFAULT NULL,
  `cpf_employee_deduction` decimal(13,2) DEFAULT NULL,
  `donation_funds` decimal(13,2) DEFAULT NULL,
  `mbmf_funds` decimal(13,2) DEFAULT NULL,
  `life_insurance` decimal(13,2) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_email_configuration`
--

CREATE TABLE `xin_email_configuration` (
  `email_config_id` int(11) NOT NULL,
  `email_type` enum('phpmail','smtp','codeigniter') COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_secure` enum('tls','ssl') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xin_email_configuration`
--

INSERT INTO `xin_email_configuration` (`email_config_id`, `email_type`, `smtp_host`, `smtp_username`, `smtp_password`, `smtp_port`, `smtp_secure`) VALUES
(1, 'smtp', 'mail.sgml.com.sg', 'info@sgml.com.sg', 'X^4oo1IsDnMZ', 465, 'ssl');

-- --------------------------------------------------------

--
-- Table structure for table `xin_email_template`
--

CREATE TABLE `xin_email_template` (
  `template_id` int(111) NOT NULL,
  `template_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_email_template`
--

INSERT INTO `xin_email_template` (`template_id`, `template_code`, `name`, `subject`, `message`, `status`) VALUES
(2, 'code1', 'Forgot Password', 'Forgot Password', '&lt;p&gt;There was recently a request for password for your {var site_name} account.&lt;/p&gt;&lt;p&gt;If this was a mistake, just ignore this email and nothing will happen.&lt;br&gt;&lt;/p&gt;&lt;p&gt;To reset your password, visit the following link &lt;a href=\\&quot;\\\\\\\\\\&quot; admin=\\&quot;\\\\\\\\\\&quot; auth=\\&quot;\\\\\\\\\\&quot; password=\\&quot;\\\\\\\\\\&quot; change=\\&quot;\\\\\\\\\\&quot; title=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; admin=\\&quot;\\\\\\\\\\&quot; auth=\\&quot;\\\\\\\\\\&quot; password=\\&quot;\\\\\\\\\\&quot; change=\\&quot;\\\\\\\\\\&quot; title=\\&quot;\\\\\\\\\\&quot;&gt;Reset Password&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; admin=\\&quot;\\\\\\\\\\&quot; auth=\\&quot;\\\\\\\\\\&quot; title=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt;{var site_url}admin/auth/reset_password?change=true&amp;email={var email}&lt;/p&gt;&lt;p&gt;Thank you,&lt;br&gt;The {var site_name} Team&lt;/p&gt;', 1),
(3, 'code2', 'New Project', 'New Project', '&lt;p&gt;Dear {var name},&lt;/p&gt;&lt;p&gt;New project has been assigned to you.&lt;/p&gt;&lt;p&gt;Project Name: {var project_name}&lt;/p&gt;&lt;p&gt;Project Start Date: &lt;span&gt;{var project_start_date}&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span&gt;Thank you,&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(5, 'code3', 'Leave Request ', 'A Leave Request from you', '&lt;p&gt;Dear Admin,&lt;/p&gt;&lt;p&gt;{var employee_name} wants a leave from you.&lt;/p&gt;&lt;p&gt;You can view this leave request by logging in to the portal using the link below.&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;br&gt;&lt;br&gt;Regards&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(6, 'code4', 'Leave Approve', 'Your leave request has been approved', '&lt;p&gt;Your leave request has been approved&lt;/p&gt;&lt;p&gt;&lt;span xss=\\&quot;removed\\&quot;&gt;Congratulations! Your leave request from&lt;/span&gt;&lt;font color=\\&quot;\\\\\\\\\\&quot; face=\\&quot;\\\\\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt; &lt;/font&gt;{var leave_start_date} to {var leave_end_date} has been approved by your company management.&lt;/p&gt;&lt;p&gt;Check here&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;br&gt;&lt;/p&gt;&lt;p&gt;Regards&lt;br&gt;The {var site_name} Team&lt;/p&gt;', 1),
(7, 'code5', 'Leave Reject', 'Your leave request has been Rejected', '&lt;p&gt;Your leave request has been Rejected&lt;/p&gt;&lt;p&gt;Unfortunately, your leave request from {var leave_start_date} to {var leave_end_date} has been Rejected by your company management.&lt;/p&gt;&lt;p&gt;Check here&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;br&gt;&lt;/p&gt;&lt;p&gt;Regards&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(8, 'code6', 'Welcome Email ', 'Welcome Email ', '&lt;p&gt;Hello {var employee_name},&lt;/p&gt;&lt;p&gt;Welcome to {var site_name} .Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe.&lt;/p&gt;&lt;p&gt;Your Username: {var username}&lt;/p&gt;&lt;p&gt;Your Employee ID: {var employee_id}&lt;br&gt;Your Email Address: {var email}&lt;br&gt;Your Password: {var password}&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; hr=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; admin=\\&quot;\\\\\\\\\\&quot;&gt;Login Panel&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Link doesn\\&#039;t work? Copy the following link to your browser address bar:&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;/p&gt;&lt;p&gt;Have fun!&lt;/p&gt;&lt;p&gt;The {var site_name} Team.&lt;/p&gt;', 1),
(9, 'code7', 'Transfer', 'New Transfer', '&lt;p&gt;Hello {var employee_name},&lt;/p&gt;&lt;p&gt;You have been transfered to another department and location.&lt;/p&gt;&lt;p&gt;You can view the transfer details by logging in to the portal using the link below.&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;/p&gt;&lt;p&gt;Regards&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(10, 'code8', 'Award', 'Award Received', '&lt;p&gt;Hello {var employee_name},&lt;/p&gt;&lt;p&gt;You have been awarded {var award_name}.&lt;/p&gt;&lt;p&gt;You can view this award by logging in to the portal using the link below.&lt;/p&gt;&lt;p&gt;&lt;span xss=\\&quot;removed\\&quot;&gt;{var site_url}admin/&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Regards&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(14, 'code9', 'New Task', 'Task assigned', '&lt;p&gt;Dear Employee,&lt;/p&gt;&lt;p&gt;A new task &lt;span xss=\\&quot;\\\\\\\\\\&quot;&gt;{var task_name}&lt;/span&gt; has been assigned to you by &lt;span xss=\\&quot;\\\\\\\\\\&quot;&gt;{var task_assigned_by}&lt;/span&gt;.&lt;/p&gt;&lt;p&gt;You can view this task by logging in to the portal using the link below.&lt;/p&gt;&lt;p&gt;{var site_url}admin/&lt;/p&gt;&lt;p&gt;Regards,&lt;/p&gt;&lt;p&gt;The {var site_name} Team&lt;/p&gt;', 1),
(15, 'code10', 'New Inquiry', 'New Inquiry [#{var ticket_code}]', '&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;&lt;span xss=\\&quot;\\\\\\\\\\&quot;&gt;Dear Admin,&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;&lt;span xss=\\&quot;\\\\\\\\\\&quot;&gt;Your received a new inquiry.&lt;/span&gt;&lt;/p&gt;&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;&lt;span xss=\\&quot;\\\\\\\\\\&quot;&gt;Inquiry Code: #{var ticket_code}&lt;/span&gt;&lt;/p&gt;&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;Status : Open&lt;br&gt;&lt;br&gt;Click on the below link to see the inquiry details and post additional comments.&lt;/p&gt;&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;{var site_url}admin/tickets/&lt;br&gt;&lt;br&gt;Regards&lt;/p&gt;&lt;p xss=\\&quot;\\\\\\\\\\&quot; rgb(51,=\\&quot;\\\\\\&quot; font-family:=\\&quot;\\\\\\&quot; sans-serif,=\\&quot;\\\\\\&quot; arial,=\\&quot;\\\\\\&quot; verdana,=\\&quot;\\\\\\&quot; trebuchet=\\&quot;\\\\\\\\\\&quot;&gt;The {var site_name} Team&lt;/p&gt;', 1),
(16, 'code11', 'Client Welcome Email', 'Welcome Email', '&lt;p&gt;Hello {var client_name},&lt;/p&gt;&lt;p&gt;Welcome to {var site_name}. Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe. You can login to your panel using email and password.&lt;/p&gt;&lt;p&gt;Your Email Address: {var email}&lt;br&gt;&lt;/p&gt;&lt;p&gt;Your Password: {var password}&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; hr=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; client=\\&quot;\\\\\\\\\\&quot;&gt;&lt;/a&gt;&lt;a href=\\&quot;\\\\\\\\\\&quot; client=\\&quot;\\\\\\\\\\&quot;&gt;Login Panel&lt;/a&gt;&lt;/p&gt;&lt;p&gt;Link doesn\\&#039;t work? Copy the following link to your browser address bar:&lt;/p&gt;&lt;p&gt;{var site_url}client/&lt;/p&gt;&lt;p&gt;Have fun!&lt;/p&gt;&lt;p&gt;The {var site_name}Team.&lt;/p&gt;', 1),
(17, 'code12', 'Password Changed Successfully', 'Password Changed Successfully', '&lt;p&gt;Hello,&lt;/p&gt;&lt;p&gt;Congratulations! Your password has been updated successfully.&lt;/p&gt;&lt;p&gt;Your new password is: {var password}&lt;/p&gt;&lt;p&gt;Thank you,&lt;br&gt;The {var site_name} Team&lt;br&gt;&lt;/p&gt;', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_employees`
--

CREATE TABLE `xin_employees` (
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `office_shift_id` int(111) NOT NULL,
  `reports_to` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `date_of_birth` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `e_status` int(11) NOT NULL,
  `attach_available_licence` varchar(250) NOT NULL DEFAULT '0',
  `attach_certifcate_attained` varchar(255) NOT NULL DEFAULT '0',
  `attach_lavel_of_education` varchar(255) NOT NULL DEFAULT '0',
  `attach_wsq_certificate` varchar(255) NOT NULL DEFAULT '0',
  `attach_vaccination_status` varchar(255) NOT NULL DEFAULT '0',
  `referal_column` varchar(255) DEFAULT NULL,
  `prompt_for` varchar(255) DEFAULT NULL,
  `user_role_id` int(100) NOT NULL,
  `department_id` int(100) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `designation_id` int(100) NOT NULL,
  `company_id` int(111) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `view_companies_id` varchar(255) NOT NULL,
  `salary_template` varchar(255) NOT NULL,
  `hourly_grade_id` int(111) NOT NULL,
  `monthly_grade_id` int(111) NOT NULL,
  `date_of_joining` varchar(200) NOT NULL,
  `date_of_leaving` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `wages_type` int(11) NOT NULL,
  `basic_salary` varchar(200) NOT NULL DEFAULT '0',
  `daily_wages` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempee` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempeer` varchar(200) DEFAULT '0',
  `salary_income_tax` varchar(200) NOT NULL DEFAULT '0',
  `salary_overtime` varchar(200) NOT NULL DEFAULT '0',
  `salary_commission` varchar(200) NOT NULL DEFAULT '0',
  `salary_claims` varchar(200) NOT NULL DEFAULT '0',
  `salary_paid_leave` varchar(200) NOT NULL DEFAULT '0',
  `salary_director_fees` varchar(200) NOT NULL DEFAULT '0',
  `salary_bonus` varchar(200) NOT NULL DEFAULT '0',
  `salary_advance_paid` varchar(200) NOT NULL DEFAULT '0',
  `address` mediumtext NOT NULL,
  `state` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_no` varchar(45) DEFAULT NULL,
  `profile_picture` mediumtext NOT NULL,
  `profile_background` mediumtext NOT NULL,
  `resume` mediumtext NOT NULL,
  `skype_id` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `facebook_link` mediumtext NOT NULL,
  `twitter_link` mediumtext NOT NULL,
  `blogger_link` mediumtext NOT NULL,
  `linkdedin_link` mediumtext NOT NULL,
  `google_plus_link` mediumtext NOT NULL,
  `instagram_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(111) NOT NULL,
  `online_status` int(111) NOT NULL,
  `fixed_header` varchar(150) NOT NULL,
  `compact_sidebar` varchar(150) NOT NULL,
  `boxed_wrapper` varchar(150) NOT NULL,
  `ethnicity_type` int(11) NOT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `nationality_id` int(11) NOT NULL,
  `citizenship_id` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employees`
--

INSERT INTO `xin_employees` (`user_id`, `employee_id`, `office_shift_id`, `reports_to`, `first_name`, `last_name`, `username`, `email`, `password`, `date_of_birth`, `gender`, `e_status`, `attach_available_licence`, `attach_certifcate_attained`, `attach_lavel_of_education`, `attach_wsq_certificate`, `attach_vaccination_status`, `referal_column`, `prompt_for`, `user_role_id`, `department_id`, `sub_department_id`, `designation_id`, `company_id`, `location_id`, `view_companies_id`, `salary_template`, `hourly_grade_id`, `monthly_grade_id`, `date_of_joining`, `date_of_leaving`, `marital_status`, `salary`, `wages_type`, `basic_salary`, `daily_wages`, `salary_ssempee`, `salary_ssempeer`, `salary_income_tax`, `salary_overtime`, `salary_commission`, `salary_claims`, `salary_paid_leave`, `salary_director_fees`, `salary_bonus`, `salary_advance_paid`, `address`, `state`, `city`, `zipcode`, `id_type`, `id_no`, `profile_picture`, `profile_background`, `resume`, `skype_id`, `contact_no`, `facebook_link`, `twitter_link`, `blogger_link`, `linkdedin_link`, `google_plus_link`, `instagram_link`, `pinterest_link`, `youtube_link`, `is_active`, `last_login_date`, `last_logout_date`, `last_login_ip`, `is_logged_in`, `online_status`, `fixed_header`, `compact_sidebar`, `boxed_wrapper`, `ethnicity_type`, `blood_group`, `nationality_id`, `citizenship_id`, `created_at`) VALUES
(1, 'jontan', 1, 0, 'Jonathan', 'Tan', 'jontan', 'sales@cssdesign.sg', '$2y$10$C3UpU.CxIzE/gKPv31QpqehsMZbeVIY4gHyZ9asNmxEKRlk6arkRi', '1988-03-04', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 1, 2, 0, 1, 1, 1, '0', 'monthly', 0, 0, '2018-02-01', '', 'Married', '', 1, '1000', '0', '8', '17', '10', '0', '1', '2', '3', '0', '0', '0', 'Test Address', 'Singapore ', 'Singapore ', '769200', 1, 'S1230001A', 'profile_1546421723.png', 'profile_background_1519924152.jpg', '', '', '12345678900', '', '', '', '', '', '', '', '', 1, '15-02-2022 20:16:19', '15-02-2022 19:21:22', '27.57.78.26', 0, 1, 'fixed_layout_hrsale', '', '', 0, 'A+', 195, 195, '2018-02-28 05:30:44'),
(2, '001', 3, 0, 'Chua', 'Cia Yie', 'ciayie', 'ciayie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1996-09-25', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 1, 2, 0, 1, 1, 1, '0', '', 0, 0, '2018-07-02', '', 'Single', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Yishun Industrial Street 1', '', '', '', 2, 'G8286057P', '', '', '', '', '83748749', '', '', '', '', '', '', '', '', 1, '11-03-2021 13:12:17', '19-02-2021 17:26:18', '118.200.94.12', 1, 0, '', '', '', 0, '', 0, 0, '2021-01-15 06:35:29'),
(3, '002', 1, 0, 'Ong', 'Yan Kai', 'yankai', 'yankai@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-10-13', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 1, 1, 0, 6, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Yishun Industrial Street 1', '', '', '', 1, 'S8432729H', '', '', '', '', '90260360', '', '', '', '', '', '', '', '', 1, '19-02-2021 20:39:43', '19-02-2021 19:40:40', '116.89.99.113', 0, 0, '', '', '', 0, '', 195, 195, '2021-01-15 06:37:50'),
(5, '003', 1, 0, 'Goh', 'Keegan', 'Keegan', 'keegan@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-03-06', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 1, 1, 0, 6, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8408508A', '', '', '', '', '98578091', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', 0, '', 195, 195, '2021-01-15 08:08:32'),
(6, '004', 1, 0, 'Quek', 'Choon Sheong, Adrian', 'adriangm', 'adrianquek@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-07-21', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 1, 1, 0, 6, 1, 1, '0', '', 0, 0, '2020-11-02', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8421632A', '', '', '', '', '90291914', '', '', '', '', '', '', '', '', 1, '14-04-2021 09:35:52', '04-03-2021 14:11:12', '118.200.94.12', 1, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:18:05'),
(7, '006', 1, 0, 'Koey', 'Chee Seng', 'cs', 'cs@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-05-04', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 4, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8413194F', '', '', '', '', '86682223', '', '', '', '', '', '', '', '', 1, '25-01-2021 14:57:11', '25-01-2021 13:57:25', '128.106.78.133', 0, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:24:43'),
(8, '005', 1, 0, 'Lee', 'Rui Jin', 'jlee', 'jlee@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1989-01-17', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 4, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8905857D', '', '', '', '', '88693466', '', '', '', '', '', '', '', '', 1, '25-01-2021 15:01:45', '25-01-2021 14:01:58', '128.106.78.133', 0, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:28:13'),
(9, '007', 1, 0, 'Ong', 'Mng Yeow, Bernard', 'bernardong', 'bernardong@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-05-28', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 4, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8467815A', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '25-01-2021 14:56:18', '25-01-2021 13:56:33', '128.106.78.133', 0, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:34:05'),
(10, '008', 1, 0, 'Pang', 'Jun Xi', 'benpang', 'ben@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1986-01-02', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 3, 1, 1, '0', '', 0, 0, '2018-05-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '272D Punggol Walk #13-595 S824272', '', '', '', 1, 'S8602562J', 'profile_1611658329.jpg', '', '', '', '91122958', '', '', '', '', '', '', '', '', 1, '23-02-2021 16:36:05', '25-01-2021 15:33:27', '111.65.70.167', 1, 1, 'fixed_layout_hrsale', '', '', 0, '', 0, 0, '2021-01-15 08:36:28'),
(11, '009', 1, 0, 'Goh', 'Liang Fen, Jessica', 'jess', 'jessgoh@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1987-11-26', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 3, 1, 1, '0', '', 0, 0, '2018-06-01', '', 'Single', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Blk 314, Ang mo kio st 31, #10-2358, Singapore 560314', '', '', '', 1, 'S8738439Z', 'profile_1614150263.jpeg', '', '', '', '91147113', '', '', '', '', '', '', '', '', 1, '23-02-2021 15:00:30', '25-01-2021 14:01:35', '128.106.78.133', 1, 1, '', '', '', 0, '', 0, 0, '2021-01-15 08:39:01'),
(12, '010', 1, 0, 'Goh', 'Char Xin', 'nikki', 'nikki@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1992-03-12', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 3, 1, 1, '0', '', 0, 0, '2019-03-18', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 2, 'G8523613Q', '', '', '', '', '83146959', '', '', '', '', '', '', '', '', 1, '04-03-2021 15:34:32', '24-02-2021 16:01:13', '118.200.94.12', 1, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:42:59'),
(13, '011', 1, 0, 'Fung', 'Han Xian, Jorrence', 'jorrencefung', 'jorrence@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1993-06-24', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2020-12-21', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S9322983E', '', '', '', '', '92314513', '', '', '', '', '', '', '', '', 1, '23-02-2021 15:03:46', '25-01-2021 14:02:22', '119.56.97.87', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-15 08:47:02'),
(14, '012', 1, 0, 'Tan', 'Sheau Sheng, James', 'james', 'james@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1983-02-28', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2018-10-01', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8306799C', '', '', '', '', '92956506', '', '', '', '', '', '', '', '', 1, '24-02-2021 13:45:09', '25-01-2021 13:58:27', '111.65.45.245', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-15 08:49:05'),
(15, '013', 1, 0, 'Tan', 'Li Sen', 'lisentan', 'lisen@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1998-07-11', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2020-12-15', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S9843967F', '', '', '', '', '91457369', '', '', '', '', '', '', '', '', 1, '29-03-2021 10:05:23', '27-03-2021 08:47:36', '183.90.37.37', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-15 08:52:21'),
(16, '014', 1, 0, 'Ong', 'Jian Sheng, Jeffery', 'jeffong', 'jedd@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1998-12-16', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2020-11-16', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S9841519Z', '', '', '', '', '84882279', '', '', '', '', '', '', '', '', 1, '01-04-2021 11:41:38', '25-01-2021 14:00:50', '119.56.97.212', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-15 08:55:47'),
(17, '015', 3, 0, 'Lee', 'Kee Jiun', 'janelle', 'janelle@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1997-10-21', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 2, 0, 1, 1, 1, '0', '', 0, 0, '2018-08-01', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 2, 'G2791050K', '', '', '', '', '97854072', '', '', '', '', '', '', '', '', 1, '25-01-2021 14:58:39', '25-01-2021 13:59:45', '128.106.78.133', 0, 0, '', '', '', 0, '', 0, 0, '2021-01-15 08:58:49'),
(18, '016', 3, 0, 'Siau', 'Qin Yee', 'queenie', 'queenie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1995-07-25', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 2, 0, 1, 1, 1, '', '', 0, 0, '2020-11-01', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 2, 'G8727763T', '', '', '', '', '98753669', '', '', '', '', '', '', '', '', 1, '26-02-2021 14:18:33', '25-01-2021 14:03:13', '119.56.106.0', 1, 1, '', '', '', 0, NULL, 0, 0, '2021-01-15 09:01:16'),
(19, '017', 3, 0, 'Ang', 'Jieh Jun', 'jaceyang', 'jacey@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1999-01-04', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 2, 0, 1, 1, 1, '0', '', 0, 0, '2020-12-21', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S9901593D', '', '', '', '', '92473402', '', '', '', '', '', '', '', '', 1, '16-04-2021 09:26:40', '25-01-2021 13:58:01', '118.200.94.12', 1, 0, '', '', '', 0, '', 0, 0, '2021-01-15 09:03:33'),
(20, '018', 4, 0, 'Ong', 'Hui Yong', 'gavin', 'gavin@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1981-09-01', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 3, 0, 7, 1, 1, '', '', 0, 0, '2019-03-18', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8127627G', '', '', '', '', '86851556', '', '', '', '', '', '', '', '', 1, '25-01-2021 15:05:14', '25-01-2021 14:05:32', '128.106.78.133', 0, 0, '', '', '', 0, NULL, 0, 0, '2021-01-15 09:24:03'),
(21, '019', 3, 0, 'Lee', 'Cong Zhi', 'jasper', 'jasperlee.sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1999-12-31', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 2, 0, 1, 1, 1, '0', '', 0, 0, '2018-08-01', '', 'Single', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 2, 'G8623303M', '', '', '', '', '84211426', '', '', '', '', '', '', '', '', 1, '11-03-2021 16:39:41', '25-01-2021 14:00:27', '118.200.94.12', 1, 0, '', '', '', 0, '', 0, 0, '2021-01-15 09:27:48'),
(22, '020', 1, 0, 'Tan', 'Jian Xiong', 'jerrytan', 'jerry@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-12-31', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2020-03-01', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8440436E', '', '', '', '', '90723112', '', '', '', '', '', '', '', '', 1, '09-04-2021 17:32:08', '25-01-2021 14:01:13', '119.56.109.70', 1, 3, '', '', '', 0, NULL, 0, 0, '2021-01-18 09:32:52'),
(23, '021', 2, 0, 'Chua', 'Cia Yie', 'ciayee', 'ciayie@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1996-09-25', 'Female', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 2, 0, 1, 1, 1, '', '', 0, 0, '2018-07-02', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Yishun Industrial Street 1 #0108', '', '', '', 2, 'G8682057P', '', '', '', '', '83748749', '', '', '', '', '', '', '', '', 1, '26-02-2021 14:19:37', '26-01-2021 10:46:34', '111.65.61.85', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-19 06:49:59'),
(24, '022', 1, 0, 'Ong', 'Yan Kai', 'ongyk', 'yankai@sgml.com.sg', '$2y$12$Aes2YNkZNwXr4Ux3rj2J6.T.5mgQBrLoz2hp6blbw0/K3hYz97v32', '1984-10-13', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2018-05-21', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S8432729H', '', '', '', '', '90260360', '', '', '', '', '', '', '', '', 1, '19-02-2021 20:40:48', '19-02-2021 19:39:30', '116.89.99.113', 1, 0, '', '', '', 0, NULL, 0, 0, '2021-01-26 01:55:31'),
(25, '', 0, 0, 'jon', 'tan', 'jtyh89', 'jtyh89@gmail.com', '$2y$12$O5adeqGhp3F1Jd5e80f46.gSsgWxAm/4CsxJGKOZSg.icy3DwzwV2', '1989-04-28', 'Male', 0, '0', '0', '0', '0', '0', NULL, NULL, 2, 1, 0, 2, 1, 1, '', '', 0, 0, '2021-06-02', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', 1, 'S9089475A', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', 0, NULL, 0, 0, '2021-06-25 04:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_accommodation`
--

CREATE TABLE `xin_employee_accommodation` (
  `id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `rent_paid` decimal(13,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_bankaccount`
--

CREATE TABLE `xin_employee_bankaccount` (
  `bankaccount_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `is_primary` int(11) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `bank_branch` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_complaints`
--

CREATE TABLE `xin_employee_complaints` (
  `complaint_id` int(50) NOT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `complaint_from` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `complaint_date` varchar(255) DEFAULT NULL,
  `complaint_against` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` int(20) DEFAULT 1,
  `created_at` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_complaints`
--

INSERT INTO `xin_employee_complaints` (`complaint_id`, `company_id`, `complaint_from`, `title`, `complaint_date`, `complaint_against`, `description`, `attachment`, `status`, `created_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 16:38:25'),
(3, '1', '10', 'title', '2022-05-05', '005', 'desc', NULL, 1, '2022-05-23 16:40:51'),
(4, '1', '3', 'not working well', '2022-05-07', 'jontan', 'adfasdfsfsfasdfazds', NULL, 1, '2022-05-23 16:41:27'),
(6, '13', '003', NULL, '2022-05-03', '012', 'desc', NULL, 1, '2022-05-25 16:25:40'),
(12, '1', '002', 'a', '2022-06-02', '005', 'dfasd', NULL, 1, '2022-06-01 16:30:43'),
(13, '1', '002', 'a', '2022-06-02', '005', 'dfasd', NULL, 1, '2022-06-01 16:30:59'),
(14, '1', '003', 'r', '2022-05-30', '002', 'dfasdf', NULL, 1, '2022-06-01 16:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_contacts`
--

CREATE TABLE `xin_employee_contacts` (
  `contact_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `is_primary` int(111) NOT NULL,
  `is_dependent` int(111) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `work_phone` varchar(255) NOT NULL,
  `work_phone_extension` varchar(255) NOT NULL,
  `mobile_phone` varchar(255) NOT NULL,
  `home_phone` varchar(255) NOT NULL,
  `work_email` varchar(255) NOT NULL,
  `personal_email` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_contacts`
--

INSERT INTO `xin_employee_contacts` (`contact_id`, `employee_id`, `relation`, `is_primary`, `is_dependent`, `contact_name`, `work_phone`, `work_phone_extension`, `mobile_phone`, `home_phone`, `work_email`, `personal_email`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `created_at`) VALUES
(1, 11, 'Spouse', 0, 0, 'Loo chien hui', '', '', '97526257', '', 'Loochienhui@gmail.com', '', '', '', 'Blk 2B upper boon Keng #20692', '', '382002', '195', '26-01-2021');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_contract`
--

CREATE TABLE `xin_employee_contract` (
  `contract_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `contract_type_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_contribution_funds`
--

CREATE TABLE `xin_employee_contribution_funds` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `contribution_id` int(11) NOT NULL,
  `contribution_type` int(11) DEFAULT NULL COMMENT '1=SHG, 2=ASHG',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_documents`
--

CREATE TABLE `xin_employee_documents` (
  `document_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `document_type_id` int(111) NOT NULL,
  `date_of_expiry` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `is_alert` tinyint(1) NOT NULL,
  `description` mediumtext NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_driver_benefits`
--

CREATE TABLE `xin_employee_driver_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `benefit_year` year(4) NOT NULL,
  `driver_wage` decimal(13,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_exit`
--

CREATE TABLE `xin_employee_exit` (
  `exit_id` int(100) NOT NULL,
  `company_id` int(100) DEFAULT NULL,
  `employee_id` int(100) NOT NULL,
  `exit_date` date DEFAULT NULL,
  `exit_type_id` varchar(100) NOT NULL,
  `exit_interview` varchar(100) DEFAULT NULL,
  `is_inactivate_account` varchar(100) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `added_by` int(111) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_exit`
--

INSERT INTO `xin_employee_exit` (`exit_id`, `company_id`, `employee_id`, `exit_date`, `exit_type_id`, `exit_interview`, `is_inactivate_account`, `reason`, `added_by`, `created_at`) VALUES
(5, 1, 1, '2022-05-03', '1', NULL, NULL, NULL, NULL, '2022-05-19 12:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_exit_type`
--

CREATE TABLE `xin_employee_exit_type` (
  `exit_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_exit_type`
--

INSERT INTO `xin_employee_exit_type` (`exit_type_id`, `company_id`, `type`, `created_at`) VALUES
(1, 1, 'Test', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_hotel_accommodation_benefits`
--

CREATE TABLE `xin_employee_hotel_accommodation_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `hotel_name` varchar(128) DEFAULT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `actual_cost` decimal(13,2) NOT NULL,
  `employee_paid` decimal(13,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_housekeeping_benefits`
--

CREATE TABLE `xin_employee_housekeeping_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `benefit_year` year(4) NOT NULL,
  `housekeeping_service` varchar(128) DEFAULT NULL,
  `housekeeping_remark` varchar(128) DEFAULT NULL,
  `housekeeping_amount` decimal(13,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_immigration`
--

CREATE TABLE `xin_employee_immigration` (
  `immigration_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `document_type_id` int(111) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `issue_date` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `eligible_review_date` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_immigration_status`
--

CREATE TABLE `xin_employee_immigration_status` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `immigration_id` int(11) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_employee_immigration_status`
--

INSERT INTO `xin_employee_immigration_status` (`id`, `employee_id`, `immigration_id`, `issue_date`, `expire_date`, `created_at`, `updated_at`) VALUES
(1, 2, 3, NULL, NULL, '2021-01-15 06:35:29', NULL),
(2, 3, 1, NULL, NULL, '2021-01-15 06:37:51', NULL),
(3, 4, 1, NULL, NULL, '2021-01-15 06:39:22', NULL),
(4, 5, 1, NULL, NULL, '2021-01-15 08:08:32', NULL),
(5, 6, 1, NULL, NULL, '2021-01-15 08:18:05', NULL),
(6, 7, 1, NULL, NULL, '2021-01-15 08:24:43', NULL),
(7, 8, 1, NULL, NULL, '2021-01-15 08:28:13', NULL),
(8, 9, 2, '2017-08-15', NULL, '2021-01-15 08:34:05', NULL),
(9, 10, 1, NULL, NULL, '2021-01-15 08:36:28', NULL),
(10, 11, 1, NULL, NULL, '2021-01-15 08:39:01', NULL),
(11, 12, 3, NULL, NULL, '2021-01-15 08:43:00', NULL),
(12, 13, 1, NULL, NULL, '2021-01-15 08:47:02', NULL),
(13, 14, 1, NULL, NULL, '2021-01-15 08:49:05', NULL),
(14, 15, 1, NULL, NULL, '2021-01-15 08:52:21', NULL),
(15, 16, 1, NULL, NULL, '2021-01-15 08:55:47', NULL),
(16, 17, 3, NULL, NULL, '2021-01-15 08:58:49', NULL),
(17, 18, 3, NULL, NULL, '2021-01-15 09:01:16', NULL),
(18, 19, 1, NULL, NULL, '2021-01-15 09:03:33', NULL),
(19, 20, 1, NULL, NULL, '2021-01-15 09:24:03', NULL),
(20, 21, 3, NULL, NULL, '2021-01-15 09:27:48', NULL),
(21, 22, 1, NULL, NULL, '2021-01-18 09:32:52', NULL),
(22, 23, 3, NULL, NULL, '2021-01-19 06:49:59', NULL),
(23, 24, 1, NULL, NULL, '2021-01-26 01:55:32', NULL),
(24, 25, 1, NULL, NULL, '2021-06-25 04:34:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_leave`
--

CREATE TABLE `xin_employee_leave` (
  `leave_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `contract_id` int(111) NOT NULL,
  `casual_leave` varchar(255) NOT NULL,
  `medical_leave` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `start_date` date NOT NULL DEFAULT current_timestamp(),
  `end_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_location`
--

CREATE TABLE `xin_employee_location` (
  `office_location_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `location_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_other_benefits`
--

CREATE TABLE `xin_employee_other_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `benefit_year` year(4) NOT NULL,
  `other_benefit` varchar(256) NOT NULL,
  `other_benefit_remark` varchar(256) DEFAULT NULL,
  `other_benefit_cost` decimal(13,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_overtime`
--

CREATE TABLE `xin_employee_overtime` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_date` date NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime NOT NULL,
  `total_hours` time NOT NULL,
  `reason` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_overtime_rate`
--

CREATE TABLE `xin_employee_overtime_rate` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_rate_type` int(11) NOT NULL,
  `overtime_rate` decimal(13,2) NOT NULL,
  `overtime_pay_rate` decimal(13,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_promotions`
--

CREATE TABLE `xin_employee_promotions` (
  `promotion_id` int(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `promotion_date` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `added_by` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_promotions`
--

INSERT INTO `xin_employee_promotions` (`promotion_id`, `company_id`, `employee_id`, `title`, `promotion_date`, `description`, `added_by`, `created_at`) VALUES
(4, '1', '2', 'Senior sales', '2022-05-01', 'Description', 'Admin', '2022-05-23'),
(5, NULL, NULL, NULL, NULL, NULL, 'Admin', '2022-05-25 15:42:49'),
(7, '---Select Company from list---', 'jontan', NULL, NULL, NULL, 'Admin', '2022-05-25 15:53:49'),
(8, '---Select Company from list---', 'jontan', NULL, NULL, NULL, 'Admin', '2022-05-25 15:53:56'),
(22, '1', 'jontan', NULL, NULL, NULL, 'Admin', '2022-05-29 00:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_qualification`
--

CREATE TABLE `xin_employee_qualification` (
  `qualification_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `education_level_id` int(111) NOT NULL,
  `from_year` varchar(255) NOT NULL,
  `language_id` int(111) NOT NULL,
  `to_year` varchar(255) NOT NULL,
  `skill_id` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_resignations`
--

CREATE TABLE `xin_employee_resignations` (
  `resignation_id` int(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `designation_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `notice_date` varchar(255) DEFAULT NULL,
  `resignation_date` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT 1,
  `created_at` varchar(255) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_resignations`
--

INSERT INTO `xin_employee_resignations` (`resignation_id`, `company_id`, `designation_id`, `employee_id`, `notice_date`, `resignation_date`, `reason`, `added_by`, `status`, `created_at`) VALUES
(8, '1', '1', '12', '2022-05-06', '2022-05-10', 'sfafadsfasfdsfdsf', NULL, NULL, NULL),
(9, '13', '1', '19', '2022-05-27', '2022-05-29', 'resignation reason', NULL, NULL, NULL),
(10, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-25 13:20:31'),
(23, '13', '1', 'jontan', NULL, NULL, NULL, 'admin-name', 1, '2022-05-25 15:38:16'),
(30, '1', '1', 'jontan', NULL, NULL, NULL, 'admin-name', 1, '2022-06-01 10:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_security_level`
--

CREATE TABLE `xin_employee_security_level` (
  `security_level_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `security_type` int(11) NOT NULL,
  `date_of_clearance` varchar(200) NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_share_options`
--

CREATE TABLE `xin_employee_share_options` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `so_scheme` int(11) NOT NULL,
  `so_plan` int(11) NOT NULL,
  `date_of_grant` date NOT NULL,
  `date_of_excercise` date NOT NULL,
  `excercise_price` decimal(13,5) NOT NULL,
  `price_date_of_grant` decimal(13,5) DEFAULT NULL,
  `price_date_of_excercise` decimal(13,5) NOT NULL,
  `no_of_shares` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_shift`
--

CREATE TABLE `xin_employee_shift` (
  `emp_shift_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `shift_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_terminations`
--

CREATE TABLE `xin_employee_terminations` (
  `termination_id` int(50) NOT NULL,
  `company_id` int(50) DEFAULT NULL,
  `employee_id` varchar(250) DEFAULT NULL,
  `terminated_by` varchar(255) DEFAULT NULL,
  `termination_type_id` int(50) DEFAULT NULL,
  `termination_date` varchar(255) DEFAULT NULL,
  `notice_date` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(50) DEFAULT 1,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_terminations`
--

INSERT INTO `xin_employee_terminations` (`termination_id`, `company_id`, `employee_id`, `terminated_by`, `termination_type_id`, `termination_date`, `notice_date`, `description`, `status`, `attachment`, `created_at`) VALUES
(13, 0, 'Employee Terminated', NULL, 1, NULL, NULL, NULL, 1, NULL, '2022-05-25 17:32:15'),
(14, 13, 'Employee Terminated', NULL, 1, '2022-05-15', '2022-05-05', NULL, 1, NULL, '2022-05-25 18:27:20'),
(15, 13, 'Employee Terminated', '010', 14, NULL, NULL, 'desc1234567892', 1, NULL, '2022-05-25 18:44:03'),
(16, 0, 'Employee Terminated', 'jontan', 13, NULL, NULL, NULL, 1, NULL, '2022-05-30 11:25:03'),
(17, 0, 'Employee Terminated', 'jontan', 13, NULL, NULL, NULL, 1, NULL, '2022-05-30 11:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_transfer`
--

CREATE TABLE `xin_employee_transfer` (
  `transfer_id` int(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `transfer_date` varchar(255) DEFAULT NULL,
  `transfer_department` int(50) DEFAULT NULL,
  `transfer_location` int(50) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(50) DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_transfer`
--

INSERT INTO `xin_employee_transfer` (`transfer_id`, `company_id`, `employee_id`, `transfer_date`, `transfer_department`, `transfer_location`, `description`, `status`, `added_by`, `created_at`) VALUES
(26, '13', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(27, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '13', NULL, NULL, 2, 8, 'desc', NULL, NULL, NULL),
(35, '13', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(36, '13', NULL, '2022-05-01', 2, 8, 'description', NULL, NULL, NULL),
(37, '13', NULL, '2022-05-30', 3, 1, 'desc', NULL, NULL, NULL),
(45, '1', 1, '2022-05-11', 1, 8, 'Descr 32323232323323', NULL, NULL, '2022-05-30'),
(51, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(52, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(53, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(54, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(55, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(56, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(57, '1', 1, '2022-06-13', 1, 1, 'sdfasdfadsf', NULL, NULL, '2022-06-01'),
(59, '1', NULL, NULL, 1, 1, 'Desc', 1, 'Admin', '2022-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_travels`
--

CREATE TABLE `xin_employee_travels` (
  `travel_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `visit_purpose` varchar(255) NOT NULL,
  `visit_place` varchar(255) NOT NULL,
  `travel_mode` int(111) DEFAULT NULL,
  `arrangement_type` int(111) DEFAULT NULL,
  `expected_budget` varchar(255) NOT NULL,
  `actual_budget` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_utility_benefits`
--

CREATE TABLE `xin_employee_utility_benefits` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `benefit_year` year(4) NOT NULL,
  `utility` varchar(128) DEFAULT NULL,
  `utility_remark` varchar(128) DEFAULT NULL,
  `utility_amount` decimal(13,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_warnings`
--

CREATE TABLE `xin_employee_warnings` (
  `warning_id` int(50) NOT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `warning_to` varchar(100) DEFAULT NULL,
  `warning_by` varchar(100) DEFAULT NULL,
  `warning_date` varchar(255) DEFAULT NULL,
  `warning_type_id` varchar(100) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  `created_at` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_warnings`
--

INSERT INTO `xin_employee_warnings` (`warning_id`, `company_id`, `warning_to`, `warning_by`, `warning_date`, `warning_type_id`, `attachment`, `subject`, `description`, `status`, `created_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 17:32:31'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 17:34:37'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 17:47:53'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 17:49:05'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-05-23 18:05:06'),
(7, '1', 'Jonathan Tan', 'Jonathan Tan', NULL, 'First Written Warning', NULL, NULL, NULL, 1, '2022-05-23 18:06:20'),
(9, '13', 'Quek Choon Sheong, Adrian', 'Ang Jieh Jun', '2022-05-05', 'First Written Warning', NULL, 'subject123', 'desc1230', 1, '2022-05-25 17:16:50'),
(10, '13', 'Jonathan Tan', 'Jonathan Tan', NULL, 'First Written Warning', NULL, NULL, NULL, 1, '2022-05-25 17:17:21'),
(13, '1', 'Lee Rui Jin', 'Ong Jian Sheng, Jeffery', '2022-05-31', 'First Written Warning', 'Screenshot (3).png', 'subject', 'ewrwer', 1, '2022-06-01 10:44:38'),
(14, '1', 'Jonathan Tan', 'Jonathan Tan', NULL, 'First Written Warning', NULL, NULL, NULL, 1, '2022-06-01 10:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_work_experience`
--

CREATE TABLE `xin_employee_work_experience` (
  `work_experience_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_year_leave`
--

CREATE TABLE `xin_employee_year_leave` (
  `id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_year` year(4) NOT NULL,
  `no_of_leaves` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_ethnicity_type`
--

CREATE TABLE `xin_ethnicity_type` (
  `ethnicity_type_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_events`
--

CREATE TABLE `xin_events` (
  `event_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_date` varchar(255) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `event_note` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_expenses`
--

CREATE TABLE `xin_expenses` (
  `expense_id` int(11) NOT NULL,
  `employee_id` int(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `expense_type_id` int(200) NOT NULL,
  `billcopy_file` mediumtext NOT NULL,
  `amount` varchar(200) NOT NULL,
  `purchase_date` varchar(200) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `status_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_expense_type`
--

CREATE TABLE `xin_expense_type` (
  `expense_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_expense_type`
--

INSERT INTO `xin_expense_type` (`expense_type_id`, `company_id`, `name`, `status`, `created_at`) VALUES
(1, 1, 'Supplies', 1, '22-03-2018 01:17:42'),
(2, 1, 'Utility', 1, '22-03-2018 01:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `xin_file_manager`
--

CREATE TABLE `xin_file_manager` (
  `file_id` int(111) NOT NULL,
  `user_id` int(111) NOT NULL,
  `department_id` int(111) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `file_extension` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_file_manager_settings`
--

CREATE TABLE `xin_file_manager_settings` (
  `setting_id` int(111) NOT NULL,
  `allowed_extensions` mediumtext NOT NULL,
  `maximum_file_size` varchar(255) NOT NULL,
  `is_enable_all_files` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_file_manager_settings`
--

INSERT INTO `xin_file_manager_settings` (`setting_id`, `allowed_extensions`, `maximum_file_size`, `is_enable_all_files`, `updated_at`) VALUES
(1, 'gif,png,pdf,txt,doc,docx', '10', '', '2019-09-30 03:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_bankcash`
--

CREATE TABLE `xin_finance_bankcash` (
  `bankcash_id` int(111) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_balance` varchar(255) NOT NULL,
  `account_opening_balance` varchar(200) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `bank_branch` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_deposit`
--

CREATE TABLE `xin_finance_deposit` (
  `deposit_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `deposit_date` varchar(255) NOT NULL,
  `category_id` int(111) NOT NULL,
  `payer_id` int(111) NOT NULL,
  `payment_method` int(111) NOT NULL,
  `deposit_reference` varchar(255) NOT NULL,
  `deposit_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_expense`
--

CREATE TABLE `xin_finance_expense` (
  `expense_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `expense_date` varchar(255) NOT NULL,
  `category_id` int(111) NOT NULL,
  `payee_id` int(111) NOT NULL,
  `payment_method` int(111) NOT NULL,
  `expense_reference` varchar(255) NOT NULL,
  `expense_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_payees`
--

CREATE TABLE `xin_finance_payees` (
  `payee_id` int(11) NOT NULL,
  `payee_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_payers`
--

CREATE TABLE `xin_finance_payers` (
  `payer_id` int(11) NOT NULL,
  `payer_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transaction`
--

CREATE TABLE `xin_finance_transaction` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `dr_cr` enum('dr','cr') NOT NULL,
  `transaction_cat_id` int(11) NOT NULL,
  `payer_payee_id` int(11) NOT NULL,
  `payee_option` int(11) DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_type` varchar(100) DEFAULT NULL,
  `attachment_file` varchar(100) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transactions`
--

CREATE TABLE `xin_finance_transactions` (
  `transaction_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `deposit_id` int(111) NOT NULL,
  `expense_id` int(111) NOT NULL,
  `transfer_id` int(111) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `transaction_debit` varchar(255) NOT NULL,
  `transaction_credit` varchar(255) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transfer`
--

CREATE TABLE `xin_finance_transfer` (
  `transfer_id` int(111) NOT NULL,
  `from_account_id` int(111) NOT NULL,
  `to_account_id` int(111) NOT NULL,
  `transfer_date` varchar(255) NOT NULL,
  `transfer_amount` varchar(255) NOT NULL,
  `payment_method` varchar(111) NOT NULL,
  `transfer_reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_goal_tracking`
--

CREATE TABLE `xin_goal_tracking` (
  `tracking_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `tracking_type_id` int(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `target_achiement` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `goal_progress` varchar(200) NOT NULL,
  `goal_status` int(11) NOT NULL DEFAULT 0,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_goal_tracking_type`
--

CREATE TABLE `xin_goal_tracking_type` (
  `tracking_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_goal_tracking_type`
--

INSERT INTO `xin_goal_tracking_type` (`tracking_type_id`, `company_id`, `type_name`, `created_at`) VALUES
(1, 1, 'Invoice Goal', '31-08-2018 01:29:44'),
(4, 1, 'Event Goal', '31-08-2018 01:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `xin_holidays`
--

CREATE TABLE `xin_holidays` (
  `holiday_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hourly_templates`
--

CREATE TABLE `xin_hourly_templates` (
  `hourly_rate_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `hourly_grade` varchar(255) NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_invoices`
--

CREATE TABLE `xin_hrsale_invoices` (
  `invoice_id` int(111) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `invoice_due_date` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `invoice_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT 'null',
  `company_name` varchar(200) NOT NULL DEFAULT 'null',
  `client_profile` varchar(200) NOT NULL DEFAULT 'null',
  `email` varchar(200) NOT NULL DEFAULT 'null',
  `contact_number` varchar(200) NOT NULL DEFAULT 'null',
  `website_url` varchar(200) NOT NULL DEFAULT 'null',
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL DEFAULT 'null',
  `state` varchar(200) NOT NULL DEFAULT 'null',
  `zipcode` varchar(200) NOT NULL DEFAULT 'null',
  `countryid` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_invoices_items`
--

CREATE TABLE `xin_hrsale_invoices_items` (
  `invoice_item_id` int(111) NOT NULL,
  `invoice_id` int(111) NOT NULL,
  `project_id` int(111) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes`
--

CREATE TABLE `xin_hrsale_module_attributes` (
  `custom_field_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `attribute_label` varchar(255) NOT NULL,
  `attribute_type` varchar(255) NOT NULL,
  `validation` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes_select_value`
--

CREATE TABLE `xin_hrsale_module_attributes_select_value` (
  `attributes_select_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `select_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes_values`
--

CREATE TABLE `xin_hrsale_module_attributes_values` (
  `attributes_value_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_attributes_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_quotes`
--

CREATE TABLE `xin_hrsale_quotes` (
  `quote_id` int(111) NOT NULL,
  `quote_number` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `quote_date` varchar(255) NOT NULL,
  `quote_due_date` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` varchar(100) NOT NULL,
  `tax_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `quote_type` varchar(100) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `quote_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `client_profile` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `website_url` varchar(200) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `countryid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_quotes_items`
--

CREATE TABLE `xin_hrsale_quotes_items` (
  `quote_item_id` int(111) NOT NULL,
  `quote_id` int(111) NOT NULL,
  `project_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_figure` varchar(200) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_immigration_status`
--

CREATE TABLE `xin_immigration_status` (
  `id` int(11) NOT NULL,
  `immigration_status` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_immigration_status`
--

INSERT INTO `xin_immigration_status` (`id`, `immigration_status`, `created_at`, `updated_at`) VALUES
(1, 'Singapore Citizen', '2021-01-13 09:34:31', NULL),
(2, 'Singapore PR', '2021-01-13 09:34:31', NULL),
(3, 'Foreign Employee', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_income_categories`
--

CREATE TABLE `xin_income_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_income_categories`
--

INSERT INTO `xin_income_categories` (`category_id`, `name`, `status`, `created_at`) VALUES
(1, 'Envato', 1, '25-03-2018 09:36:20'),
(2, 'Salary', 1, '25-03-2018 09:36:28'),
(3, 'Other Income', 1, '25-03-2018 09:36:32'),
(4, 'Interest Income', 1, '25-03-2018 09:36:53'),
(5, 'Part Time Work', 1, '25-03-2018 09:37:13'),
(6, 'Regular Income', 1, '25-03-2018 09:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `xin_ir8a_submission`
--

CREATE TABLE `xin_ir8a_submission` (
  `id` int(11) NOT NULL,
  `efiling_id` int(11) NOT NULL,
  `submission_key` varchar(256) NOT NULL,
  `basis_year` year(4) NOT NULL,
  `no_of_records` int(11) NOT NULL,
  `total_payment` decimal(13,2) DEFAULT NULL,
  `total_salary` decimal(13,2) DEFAULT NULL,
  `total_bonus` decimal(13,2) DEFAULT NULL,
  `total_director_fee` decimal(13,2) DEFAULT NULL,
  `total_other` decimal(13,2) DEFAULT NULL,
  `total_exempt_income` decimal(13,2) DEFAULT NULL,
  `total_tax_borne_employer` decimal(13,2) DEFAULT NULL,
  `total_tax_borne_employee` decimal(13,2) DEFAULT NULL,
  `total_donation` decimal(13,2) DEFAULT NULL,
  `total_cpf` decimal(13,2) DEFAULT NULL,
  `total_insurance` decimal(13,2) DEFAULT NULL,
  `total_mbf` decimal(13,2) DEFAULT NULL,
  `ir8a_file` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `submission_reference` varchar(256) DEFAULT NULL,
  `submission_date` datetime DEFAULT NULL,
  `status_code` varchar(45) DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_jobs`
--

CREATE TABLE `xin_jobs` (
  `job_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `job_url` varchar(255) NOT NULL,
  `job_type` int(225) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `job_vacancy` int(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `minimum_experience` varchar(255) NOT NULL,
  `date_of_closing` varchar(200) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `long_description` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_applications`
--

CREATE TABLE `xin_job_applications` (
  `application_id` int(111) NOT NULL,
  `job_id` int(111) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(111) NOT NULL,
  `message` mediumtext NOT NULL,
  `job_resume` mediumtext NOT NULL,
  `application_status` int(11) NOT NULL DEFAULT 0,
  `application_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_categories`
--

CREATE TABLE `xin_job_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_categories`
--

INSERT INTO `xin_job_categories` (`category_id`, `category_name`, `category_url`, `created_at`) VALUES
(1, 'PHP', 'q7VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(2, 'Android', 'q7VJh5xWwr56ycN0m34Aou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(3, 'WordPress', 'q2327VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(4, 'Design', '0oplfq7VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(5, 'Developer', '34e6zyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(6, 'iOS', 'l1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(7, 'Mobile', 'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r', '2018-04-15'),
(8, 'MySQL', '2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(9, 'JavaScript', 'gCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(10, 'Software', 'zyr56ycN0mAou42634e6zyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(11, 'Website Design', '6iOY8l1BbMd6H2D3rkFnjU9LgCzyr56ycN0mAou42634e6zyr56ycN0mAou426', '2018-04-15'),
(12, 'Programming', 'jU9LgCzyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFn34e6zyr56ycN0mAou426', '2018-04-15'),
(13, 'SEO', 'cN0mAou4266iOY8l1Bq2327VJh5xWwr56ybMd6H2D3rkFnjU9LgC', '2018-04-15'),
(14, 'Java', 'VJh5xWwr56ybMd6H2DcN0mAou4266iOY8l1Bq23273rkFnjU9LgC', '2018-04-15'),
(15, 'CSS', 'VJh5xWwr56ybMd6H2Dsdfkkj58234ksklEr6ybMd6H2D', '2018-04-15'),
(16, 'HTML5', '0349324k0434r23ksodfkpsodkfposakfkpww3MsH2Dei30ks', '2018-04-15'),
(17, 'Web Development', 'sdfj0rkskfskdfj329FLE34LFMsH2Dei30ks0349324k0434', '2018-04-15'),
(18, 'Web Design', 'MsH2Deiee30ks0349324k0434klEr6ybMd6234b5ksddif0k33', '2018-04-15'),
(19, 'eCommerce', 'klEr6ybMd6234bMsH2Dei30ks0349324k04345ksddif0k33', '2018-04-15'),
(20, 'Design', '234bMsklEr6ybMd6H2Dssdk5yy98ooVJh5xWwr56y435gghhole93lfkkj58', '2018-04-15'),
(21, 'Logo Design', 'k5yy98ooVJh5xWw45456y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(22, 'Graphic Design', 'k5yy98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(23, 'Video', 'k98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(24, 'Animation', 'ole93lfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D', '2018-04-15'),
(25, 'Adobe Photoshop', 'd6H2Dsdfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D', '2018-04-15'),
(26, 'Illustration', 'xWwr56ybMd6H2DcN0mA3405kfVJh5ou4266iOY8l1Bq23273rkFnjU9LgC', '2018-04-15'),
(27, 'Art', '3405kfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybMd6H2DcN0mAFnjU9LgC', '2018-04-15'),
(28, '3D', 'Md6H2DcN0mAFnjU9LfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybgC', '2018-04-15'),
(29, 'Adobe Illustrator', '5ou4266iOY8l1Bq23273rkMd6H2DcN0mAFnjU9LfVJh3ok3xWwr56ybgCww', '2018-04-15'),
(30, 'Drawing', '6iOY8l1Bq23273rk0234KILR23492034ksfpd456yslfdsf5ou426', '2018-04-15'),
(31, 'Web Design', '3l34l432fo232l3223DhssdfRKLl5434lsdfl3l3sfs3lllblp23D', '2018-04-15'),
(32, 'Cartoon', 'sdfowerewl567lflsdfl3l3sf3l34l432fo232l3223Dhs3lllblp23D', '2018-04-15'),
(33, 'Graphics', '3232l32hsfo23lllblp23D9LfVJkfo394s5ou42at5sd20cNsolof3llsblp23DcN', '2018-04-15'),
(34, 'Fashion Design', '9LfVJkfo394s5ou42at5sd203232l32hsfo23lllblp23DcNsolof3llsblp23DcN', '2018-04-15'),
(35, 'WordPress', 'hsfo23lllblp23DcNsolof3llsblp23DcN9LfVJkfo394s5ou42', '2018-04-15'),
(36, 'Editing', 'lof3llsblp23DcN9LfVJhsfo23lllblp23DcNsokfo394s5ou42', '2018-04-15'),
(37, 'Writing', 'blp23DcNsokfo394slof3llsblp23DcN9LfVJh5ou42', '2018-04-15'),
(38, 'T-Shirt Design', '9LfVJh5ou42blp23DcNsdf329LfVJh5ou42bsokjfwpoek0mAFnjU', '2018-04-15'),
(39, 'Display Advertising', '9LfVJh5ou42bsokjfwpoek9LfVJh5ou42blp23DcN0mAFnjU', '2018-04-15'),
(40, 'Email Marketing', 'DcN0mAFnjU9LfVJh5ou42bs66iOY8l1Bq23273rk3ok3xWwr56yMd6H2gC', '2018-04-15'),
(41, 'Lead Generation', '66iOY8l1Bq23273rk3ok3xWwr56yMd6H2DcN0mAFnjU9LfVJh5ou42bgC', '2018-04-15'),
(42, 'Market & Customer Research', 'Aou42Eou42iOY800Ke3klAou42066iOY800fklAou42', '2018-04-15'),
(43, 'Marketing Strategy', 'EKe3000fklAou4266iOY8l1kkadwlsdfk20323rlsKh4KadlLL', '2018-04-15'),
(44, 'Public Relations', 'l1kkadwlsdfk20323rlsKh4KadlLLEKe3000fklAou4266iOY8', '2018-04-15'),
(45, 'Telemarketing & Telesales', 'fklAou4266iOY8l1kkadwlsfBf329k3249owe923ksd324odLL2DcN0m', '2018-04-15'),
(46, 'Other - Sales & Marketing', 'Bf329k3249owe923ksd324odfklAou4266iOY8l1kkadwlLL2DcN0m', '2018-04-15'),
(47, 'SEM - Search Engine Marketing', 'Aou4266iOY8l1Bf329k3249owe923ksdkkadwlLL2DcN0m', '2018-04-15'),
(48, 'SEO - Search Engine Optimization', 'rk0234KILR23492034ksfpd456y6iOY8l1Bq23273slfdsf5ou426', '2018-04-15'),
(49, 'SMM - Social Media Marketing', '2DcN0mAou4266iOY8l1BVJh5xWwr56ybMd6Hq23273rkFnjU9LgC', '2018-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_interviews`
--

CREATE TABLE `xin_job_interviews` (
  `job_interview_id` int(111) NOT NULL,
  `job_id` int(111) NOT NULL,
  `interviewers_id` varchar(255) NOT NULL,
  `interview_place` varchar(255) NOT NULL,
  `interview_date` varchar(255) NOT NULL,
  `interview_time` varchar(255) NOT NULL,
  `interviewees_id` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_pages`
--

CREATE TABLE `xin_job_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `page_details` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_pages`
--

INSERT INTO `xin_job_pages` (`page_id`, `page_title`, `page_url`, `page_details`, `created_at`) VALUES
(1, 'About Us', 'xl9wkRy7tqOehBo6YCDjFG2JTucpKI4gMNsn8Zdf', 'About Ussss', '2018-04-15'),
(2, 'Communications', '5uk4EUc3V9FYTbBQz7PWgKM6qCajfAipvhOJnZHl', 'Communications', '2018-04-15'),
(3, 'Lending Licenses', '5r6OCsUoHQFiRwI17W0eT38jbvpxEGuLhzgmt9lZ', 'Lending Licenses', '2018-04-15'),
(4, 'Terms of Service', 'QrfbMOUWpdYNxjLFz8G1m6t3wi0X2RKEZVC9ySka', 'Terms of Service', '2018-04-15'),
(5, 'Privacy Policy', 'rjHKhmsNezT2OJBAoQq0yU1tL5F34MCwgIiZEc7x', 'Privacy Policy', '2018-04-15'),
(6, 'Support', 'gZbBVMxnfzYLlC2AOk609Q7yWpaSjmJHuRXosr58', 'Support', '2018-04-15'),
(7, 'How It Works', 'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r', 'How It Works', '2018-04-15'),
(8, 'Disclaimers', 'CTbzS9IrWkNU7VM3HGZYjp6iwmfyXDOQgtsP8FEc', 'Disclaimers', '2018-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_type`
--

CREATE TABLE `xin_job_type` (
  `job_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_type`
--

INSERT INTO `xin_job_type` (`job_type_id`, `company_id`, `type`, `type_url`, `created_at`) VALUES
(1, 1, 'Full Time', 'full-time', '22-03-2018 02:18:48'),
(2, 1, 'Part Time', 'part-time', '16-04-2018 06:29:45'),
(3, 1, 'Internship', 'internship', '16-04-2018 06:30:06'),
(4, 1, 'Freelance', 'freelance', '16-04-2018 06:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_incidental`
--

CREATE TABLE `xin_kpi_incidental` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `incidental_kpi` text NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `result` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_maingoals`
--

CREATE TABLE `xin_kpi_maingoals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_kpi` varchar(255) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `approve_status` varchar(100) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_variable`
--

CREATE TABLE `xin_kpi_variable` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `variable_kpi` varchar(200) NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `result` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `approve_status` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `quarter` varchar(200) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_languages`
--

CREATE TABLE `xin_languages` (
  `language_id` int(111) NOT NULL,
  `language_name` varchar(255) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `language_flag` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_languages`
--

INSERT INTO `xin_languages` (`language_id`, `language_name`, `language_code`, `language_flag`, `is_active`, `created_at`) VALUES
(1, 'English', 'english', 'language_flag_1520564355.gif', 1, ''),
(4, 'PortuguÃªs', 'portuguese', 'language_flag_1526420518.gif', 0, '16-05-2018 12:41:57'),
(5, 'Tiáº¿ng Viá»‡t', 'vietnamese', 'language_flag_1526728529.gif', 0, '19-05-2018 02:15:28'),
(6, 'EspaÃ±ol', 'spanish', 'language_flag_1563906920.gif', 0, '23-07-2019 11:35:20'),
(7, 'Svenska', 'swedish', 'language_flag_1564007195.gif', 0, '25-07-2019 03:26:35'),
(8, 'Thailand', 'thailand', 'language_flag_1564007402.gif', 0, '25-07-2019 03:30:02'),
(9, 'Indonesian', 'indonesian', 'language_flag_1564054894.gif', 0, '25-07-2019 04:41:33'),
(10, 'Italiano', 'italian', 'language_flag_1564058198.gif', 0, '25-07-2019 05:36:37'),
(11, 'Deutsch', 'dutch', 'language_flag_1564058280.gif', 0, '25-07-2019 05:37:59'),
(12, 'TÃ¼rk', 'turkish', 'language_flag_1564058565.gif', 0, '25-07-2019 05:42:44'),
(13, 'FranÃ§ais', 'french', 'language_flag_1564058638.gif', 0, '25-07-2019 05:43:58'),
(14, 'Ð ÑƒÑÑÐºÐ¸Ð¹', 'russian', 'language_flag_1564058661.gif', 0, '25-07-2019 05:44:20'),
(15, 'RomÃ¢nÄƒ', 'romanian', 'language_flag_1564058689.gif', 0, '25-07-2019 05:44:49'),
(16, 'Irish', 'irish', 'language_flag_1564171301.gif', 0, '27-07-2019 01:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `xin_leads`
--

CREATE TABLE `xin_leads` (
  `client_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int(11) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `is_active` int(11) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_leads_followup`
--

CREATE TABLE `xin_leads_followup` (
  `leads_followup_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `next_followup` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_leave_applications`
--

CREATE TABLE `xin_leave_applications` (
  `leave_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(222) NOT NULL,
  `department_id` int(11) NOT NULL,
  `leave_type_id` int(222) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `applied_on` varchar(200) NOT NULL,
  `reason` mediumtext NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_half_day` tinyint(1) DEFAULT NULL,
  `is_notify` int(11) NOT NULL,
  `leave_attachment` varchar(255) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_leave_applications`
--

INSERT INTO `xin_leave_applications` (`leave_id`, `company_id`, `employee_id`, `department_id`, `leave_type_id`, `from_date`, `to_date`, `applied_on`, `reason`, `remarks`, `status`, `is_half_day`, `is_notify`, `leave_attachment`, `created_at`) VALUES
(4, 1, 23, 0, 1, '2021-01-27', '2021-01-27', '2021-01-26 10:51:10', 'UNPAID', 'UNPaid', 2, 0, 0, '', '2021-01-26 10:51:10'),
(5, 1, 24, 0, 1, '2021-01-28', '2021-01-28', '2021-01-26 12:43:41', 'Asd', '', 2, 0, 0, '', '2021-01-26 12:43:41'),
(6, 1, 24, 0, 1, '2021-02-19', '2021-02-19', '2021-02-19 04:39:11', 'Test', 'AS', 1, 1, 0, '', '2021-02-19 04:39:11'),
(7, 1, 24, 0, 1, '2021-02-22', '2021-02-22', '2021-02-19 06:29:01', 'Akdlf ', '', 1, 0, 0, '', '2021-02-19 06:29:01'),
(16, 1, 24, 0, 1, '2021-03-01', '2021-03-01', '2021-02-26 02:26:18', 'Leave', '', 1, 0, 0, '', '2021-02-26 02:26:18'),
(17, 1, 24, 0, 1, '2021-03-04', '2021-03-04', '2021-03-04 03:07:44', 'Test', 'Test', 1, 0, 0, '', '2021-03-04 03:07:44'),
(18, 1, 12, 0, 1, '2021-03-12', '2021-03-13', '2021-03-08 10:40:46', 'On leave', '', 2, 0, 0, '', '2021-03-08 10:40:46'),
(19, 1, 22, 0, 1, '2021-05-17', '2021-05-19', '2021-05-07 04:53:04', 'Personal', 'Leave', 1, 0, 1, '', '2021-05-07 04:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `xin_leave_type`
--

CREATE TABLE `xin_leave_type` (
  `leave_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type_name` varchar(200) NOT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_leave_type`
--

INSERT INTO `xin_leave_type` (`leave_type_id`, `company_id`, `type_name`, `is_paid`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Unpaid Leave', 0, 1, '2021-01-13 09:34:31', NULL),
(3, 0, 'Adoption Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(4, 0, 'Annual Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(6, 0, 'Childcare Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(7, 0, 'Maternity Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(8, 0, 'Paternity Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(9, 0, 'Shared Parental Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(10, 0, 'Sick Leave', 1, 1, '2021-01-13 09:34:31', NULL),
(11, 0, 'Unpaid Infant Care Leave', 0, 1, '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_make_payment`
--

CREATE TABLE `xin_make_payment` (
  `make_payment_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `department_id` int(111) NOT NULL,
  `company_id` int(111) NOT NULL,
  `location_id` int(111) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `payment_date` varchar(200) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowances` varchar(255) NOT NULL,
  `total_deductions` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `is_advance_salary_deduct` int(11) NOT NULL,
  `advance_salary_amount` varchar(255) NOT NULL,
  `is_payment` tinyint(1) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `total_hours_work` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_meetings`
--

CREATE TABLE `xin_meetings` (
  `meeting_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `meeting_date` varchar(255) NOT NULL,
  `meeting_time` varchar(255) NOT NULL,
  `meeting_room` varchar(255) NOT NULL,
  `meeting_note` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_office_location`
--

CREATE TABLE `xin_office_location` (
  `location_id` int(20) NOT NULL,
  `company_id` int(50) DEFAULT NULL,
  `location_head` varchar(111) DEFAULT NULL,
  `location_manager` varchar(111) DEFAULT NULL,
  `location_name` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `address_1` varchar(250) DEFAULT NULL,
  `address_2` varchar(250) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` varchar(111) DEFAULT NULL,
  `added_by` varchar(111) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_office_location`
--

INSERT INTO `xin_office_location` (`location_id`, `company_id`, `location_head`, `location_manager`, `location_name`, `email`, `phone`, `fax`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `added_by`, `created_at`, `status`) VALUES
(1, 1, '0', '0', 'SGML', 'sales@sgml.com.sg', '62587261', '62502767', '15 Yishun Industrial Street 1', 'Address Line 2', 'Singapore', 'State', '768091', '195', '1', '0000-00-00', 1),
(8, 13, 'Chua Cia Yie', 'location name', 'location name', 'admin@gmail.com', '1234567890', 'admin123', 'a', 'b', 'city', 's', 'z', '17', 'addedby', '05-24-2022', 1),
(9, 12, 'Jonathan Tan', 'Jonathan Tan', NULL, 'admin@gmail.com', NULL, 'admin123', NULL, NULL, NULL, NULL, NULL, NULL, 'addedby', '05-24-2022', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_office_shift`
--

CREATE TABLE `xin_office_shift` (
  `office_shift_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  `default_shift` int(111) NOT NULL,
  `monday_in_time` varchar(222) NOT NULL,
  `monday_out_time` varchar(222) NOT NULL,
  `tuesday_in_time` varchar(222) NOT NULL,
  `tuesday_out_time` varchar(222) NOT NULL,
  `wednesday_in_time` varchar(222) NOT NULL,
  `wednesday_out_time` varchar(222) NOT NULL,
  `thursday_in_time` varchar(222) NOT NULL,
  `thursday_out_time` varchar(222) NOT NULL,
  `friday_in_time` varchar(222) NOT NULL,
  `friday_out_time` varchar(222) NOT NULL,
  `saturday_in_time` varchar(222) NOT NULL,
  `saturday_out_time` varchar(222) NOT NULL,
  `sunday_in_time` varchar(222) NOT NULL,
  `sunday_out_time` varchar(222) NOT NULL,
  `created_at` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_office_shift`
--

INSERT INTO `xin_office_shift` (`office_shift_id`, `company_id`, `shift_name`, `default_shift`, `monday_in_time`, `monday_out_time`, `tuesday_in_time`, `tuesday_out_time`, `wednesday_in_time`, `wednesday_out_time`, `thursday_in_time`, `thursday_out_time`, `friday_in_time`, `friday_out_time`, `saturday_in_time`, `saturday_out_time`, `sunday_in_time`, `sunday_out_time`, `created_at`) VALUES
(1, 1, 'Sales', 1, '09:30', '18:30', '09:30', '18:30', '09:30', '18:30', '09:30', '18:30', '09:30', '18:30', '', '', '', '', '2018-02-28'),
(2, 1, 'Admin ', 0, '10:00', '18:00', '10:00', '18:00', '10:00', '18:00', '10:00', '18:00', '10:00', '18:00', '', '', '', '', '2021-01-15'),
(3, 1, 'Admin 2', 0, '09:30', '17:30', '09:30', '17:30', '09:30', '17:30', '09:30', '17:30', '09:30', '17:30', '', '', '', '', '2021-01-15'),
(4, 1, 'General Worker', 0, '09:30', '18:00', '09:30', '18:00', '09:30', '18:00', '09:30', '18:00', '09:30', '18:00', '', '', '', '', '2021-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `xin_payment_deduction_types`
--

CREATE TABLE `xin_payment_deduction_types` (
  `id` int(11) NOT NULL,
  `payslip_item_id` int(11) DEFAULT NULL,
  `payment_deduction_name` varchar(288) NOT NULL,
  `pd_type` int(11) NOT NULL COMMENT '1 = recurring payment\n2 = ad hoc payment\n3 = both',
  `cpf` tinyint(4) DEFAULT NULL,
  `tax` tinyint(4) DEFAULT NULL,
  `sdl` tinyint(4) DEFAULT NULL,
  `shg` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_payment_deduction_types`
--

INSERT INTO `xin_payment_deduction_types` (`id`, `payslip_item_id`, `payment_deduction_name`, `pd_type`, `cpf`, `tax`, `sdl`, `shg`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Advance Pay', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(2, 2, 'Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(3, NULL, 'Annual Wage Supplement', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(4, NULL, 'Backdated Salary', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(5, NULL, 'Backdated Salary Increment', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(6, NULL, 'Basic Pay', 1, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(7, NULL, 'Benefits in Kind', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(8, NULL, 'Bonus', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(9, 5, 'Commission (Daily/Weekly/Monthly)', 1, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(10, 5, 'Commission (Irregular)', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(11, NULL, 'Compensation for loss of employment', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(12, NULL, 'Deduction', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(13, NULL, 'Deduction (from Net Salary)', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(14, NULL, 'Deduction (from Net Salary)(no SHG contribution)', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(15, NULL, 'Director fees', 3, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(16, 2, 'Extra Duty Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(17, 2, 'Festive Allowance', 2, 1, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(18, NULL, 'Flexi-Benefit Childcare / Eldercare Fees For Dependants', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(19, NULL, 'Flexi-Benefit Dental Expenses For Dependants', 2, NULL, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(20, NULL, 'Flexi-Benefit Gym Membership', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(21, NULL, 'Flexi-Benefit Health Screening & Vaccinations', 2, NULL, NULL, 1, 1, '2021-01-13 09:34:31', NULL),
(22, NULL, 'Flexi-Benefit Holiday Expenses', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(23, NULL, 'Flexi-Benefit Medical Expenses For Dependants', 2, NULL, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(24, NULL, 'Flexi-Benefit Optical Expenses', 2, NULL, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(25, NULL, 'Flexi-Benefit Personal Insurance', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(26, NULL, 'Flexi-Benefit TCM / CHIRO/ PHYSIO', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(27, NULL, 'Gifts in Kind', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(28, NULL, 'Gratuity', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(29, NULL, 'Gratuity paid for years of service', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(30, 2, 'Housing/ Rental Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(31, NULL, 'Incentive', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(32, 2, 'Incentive Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(33, NULL, 'Leave Pay', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(34, 2, 'Meal Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(35, NULL, 'NS Leave Claims Deduction', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(36, NULL, 'Onboarding incentive', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(37, NULL, 'Others', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(38, NULL, 'Others(no gross)', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(39, 2, 'Per Diem Allowance', 3, 1, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(40, NULL, 'Per Diem Reimbursement', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(41, NULL, 'Referral of Employees Fees', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(42, NULL, 'Reimbursements', 2, NULL, NULL, NULL, NULL, '2021-01-13 09:34:31', NULL),
(43, NULL, 'Salary in lieu', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(44, NULL, 'Share Option Sale', 2, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(45, NULL, 'Termination Benefits', 2, NULL, 1, NULL, NULL, '2021-01-13 09:34:31', NULL),
(46, NULL, 'Tips', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL),
(47, 2, 'Transport Allowance', 3, 1, 1, 1, 1, '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_payment_method`
--

CREATE TABLE `xin_payment_method` (
  `payment_method_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `payment_percentage` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_payment_method`
--

INSERT INTO `xin_payment_method` (`payment_method_id`, `company_id`, `method_name`, `payment_percentage`, `account_number`, `created_at`) VALUES
(1, 1, 'Cash', '30', '', '23-04-2018 05:13:52'),
(2, 1, 'Paypal', '40', '1', '12-08-2018 02:18:50'),
(3, 1, 'Bank', '30', '1231232', '12-08-2018 02:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `xin_payroll_custom_fields`
--

CREATE TABLE `xin_payroll_custom_fields` (
  `payroll_custom_id` int(11) NOT NULL,
  `allow_custom_1` varchar(255) NOT NULL,
  `is_active_allow_1` int(11) NOT NULL,
  `allow_custom_2` varchar(255) NOT NULL,
  `is_active_allow_2` int(11) NOT NULL,
  `allow_custom_3` varchar(255) NOT NULL,
  `is_active_allow_3` int(11) NOT NULL,
  `allow_custom_4` varchar(255) NOT NULL,
  `is_active_allow_4` int(11) NOT NULL,
  `allow_custom_5` varchar(255) NOT NULL,
  `is_active_allow_5` int(111) NOT NULL,
  `deduct_custom_1` varchar(255) NOT NULL,
  `is_active_deduct_1` int(11) NOT NULL,
  `deduct_custom_2` varchar(255) NOT NULL,
  `is_active_deduct_2` int(11) NOT NULL,
  `deduct_custom_3` varchar(255) NOT NULL,
  `is_active_deduct_3` int(11) NOT NULL,
  `deduct_custom_4` varchar(255) NOT NULL,
  `is_active_deduct_4` int(11) NOT NULL,
  `deduct_custom_5` varchar(255) NOT NULL,
  `is_active_deduct_5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_payslip_items`
--

CREATE TABLE `xin_payslip_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(288) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_payslip_items`
--

INSERT INTO `xin_payslip_items` (`id`, `item_name`, `created_at`, `updated_at`) VALUES
(1, 'Basic Pay', '2021-01-13 09:34:31', NULL),
(2, 'Allowance', '2021-01-13 09:34:31', NULL),
(3, 'Payments', '2021-01-13 09:34:31', NULL),
(4, 'Deductions', '2021-01-13 09:34:31', NULL),
(5, 'Commission', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_appraisal`
--

CREATE TABLE `xin_performance_appraisal` (
  `performance_appraisal_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `appraisal_year_month` varchar(255) NOT NULL,
  `customer_experience` int(111) NOT NULL,
  `marketing` int(111) NOT NULL,
  `management` int(111) NOT NULL,
  `administration` int(111) NOT NULL,
  `presentation_skill` int(111) NOT NULL,
  `quality_of_work` int(111) NOT NULL,
  `efficiency` int(111) NOT NULL,
  `integrity` int(111) NOT NULL,
  `professionalism` int(111) NOT NULL,
  `team_work` int(111) NOT NULL,
  `critical_thinking` int(111) NOT NULL,
  `conflict_management` int(111) NOT NULL,
  `attendance` int(111) NOT NULL,
  `ability_to_meet_deadline` int(111) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_appraisal_options`
--

CREATE TABLE `xin_performance_appraisal_options` (
  `performance_appraisal_options_id` int(11) NOT NULL,
  `appraisal_id` int(11) NOT NULL,
  `appraisal_type` varchar(200) NOT NULL,
  `appraisal_option_id` int(11) NOT NULL,
  `appraisal_option_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_indicator`
--

CREATE TABLE `xin_performance_indicator` (
  `performance_indicator_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `customer_experience` int(111) NOT NULL,
  `marketing` int(111) NOT NULL,
  `management` int(111) NOT NULL,
  `administration` int(111) NOT NULL,
  `presentation_skill` int(111) NOT NULL,
  `quality_of_work` int(111) NOT NULL,
  `efficiency` int(111) NOT NULL,
  `integrity` int(111) NOT NULL,
  `professionalism` int(111) NOT NULL,
  `team_work` int(111) NOT NULL,
  `critical_thinking` int(111) NOT NULL,
  `conflict_management` int(111) NOT NULL,
  `attendance` int(111) NOT NULL,
  `ability_to_meet_deadline` int(111) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_indicator_options`
--

CREATE TABLE `xin_performance_indicator_options` (
  `performance_indicator_options_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `indicator_type` varchar(200) NOT NULL,
  `indicator_option_id` int(11) NOT NULL,
  `indicator_option_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_person_id_type`
--

CREATE TABLE `xin_person_id_type` (
  `id` int(11) NOT NULL,
  `id_name` varchar(128) NOT NULL,
  `iras_code` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_person_id_type`
--

INSERT INTO `xin_person_id_type` (`id`, `id_name`, `iras_code`, `created_at`, `updated_at`) VALUES
(1, 'NRIC', '1', '2021-01-13 09:34:31', NULL),
(2, 'FIN', '2', '2021-01-13 09:34:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects`
--

CREATE TABLE `xin_projects` (
  `project_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` int(100) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `budget_hours` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_attachment`
--

CREATE TABLE `xin_projects_attachment` (
  `project_attachment_id` int(11) NOT NULL,
  `project_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_bugs`
--

CREATE TABLE `xin_projects_bugs` (
  `bug_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_discussion`
--

CREATE TABLE `xin_projects_discussion` (
  `discussion_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `client_id` int(11) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_timelogs`
--

CREATE TABLE `xin_projects_timelogs` (
  `timelogs_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_project_variations`
--

CREATE TABLE `xin_project_variations` (
  `variation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `created_by` int(111) NOT NULL,
  `variation_name` varchar(255) NOT NULL,
  `variation_no` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `variation_hours` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `variation_status` int(5) NOT NULL,
  `client_approval` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_education_level`
--

CREATE TABLE `xin_qualification_education_level` (
  `education_level_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_education_level`
--

INSERT INTO `xin_qualification_education_level` (`education_level_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'High School Diploma / GED', '09-05-2018 03:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_language`
--

CREATE TABLE `xin_qualification_language` (
  `language_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_language`
--

INSERT INTO `xin_qualification_language` (`language_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'English', '09-05-2018 03:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_skill`
--

CREATE TABLE `xin_qualification_skill` (
  `skill_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_skill`
--

INSERT INTO `xin_qualification_skill` (`skill_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'jQuery', '09-05-2018 03:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects`
--

CREATE TABLE `xin_quoted_projects` (
  `project_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` int(100) NOT NULL,
  `estimate_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `estimate_hrs` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_attachment`
--

CREATE TABLE `xin_quoted_projects_attachment` (
  `project_attachment_id` int(11) NOT NULL,
  `project_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_discussion`
--

CREATE TABLE `xin_quoted_projects_discussion` (
  `discussion_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `client_id` int(11) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_timelogs`
--

CREATE TABLE `xin_quoted_projects_timelogs` (
  `timelogs_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_recruitment_pages`
--

CREATE TABLE `xin_recruitment_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_details` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_recruitment_pages`
--

INSERT INTO `xin_recruitment_pages` (`page_id`, `page_title`, `page_details`, `status`, `created_at`) VALUES
(1, 'Pages', 'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(2, 'About Us', 'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(3, 'Career Services', 'Career Services', 1, ''),
(4, 'Success Stories', 'Success Stories', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_recruitment_subpages`
--

CREATE TABLE `xin_recruitment_subpages` (
  `subpages_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `sub_page_title` varchar(255) NOT NULL,
  `sub_page_details` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_recruitment_subpages`
--

INSERT INTO `xin_recruitment_subpages` (`subpages_id`, `page_id`, `sub_page_title`, `sub_page_details`, `status`, `created_at`) VALUES
(1, 1, 'Sub Menu 1', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(2, 1, 'Sub Menu 2', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(3, 1, 'Sub Menu 3', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(4, 1, 'Sub Menu 4', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(5, 1, 'Sub Menu 5', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(6, 1, 'Sub Menu 6', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_allowances`
--

CREATE TABLE `xin_salary_allowances` (
  `allowance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `allowance_title` varchar(200) DEFAULT NULL,
  `allowance_amount` varchar(200) DEFAULT NULL,
  `salary_month` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_bank_allocation`
--

CREATE TABLE `xin_salary_bank_allocation` (
  `bank_allocation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `pay_percent` varchar(200) NOT NULL,
  `acc_number` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_commissions`
--

CREATE TABLE `xin_salary_commissions` (
  `salary_commissions_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `commission_type` int(11) NOT NULL,
  `commission_date` date NOT NULL,
  `commission_amount` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_loan_deductions`
--

CREATE TABLE `xin_salary_loan_deductions` (
  `loan_deduction_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_options` int(11) NOT NULL,
  `loan_deduction_title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `monthly_installment` varchar(200) NOT NULL,
  `loan_time` varchar(200) NOT NULL,
  `loan_deduction_amount` varchar(200) NOT NULL,
  `total_paid` varchar(200) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL,
  `is_deducted_from_salary` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_other_payments`
--

CREATE TABLE `xin_salary_other_payments` (
  `other_payments_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payments_title` varchar(200) DEFAULT NULL,
  `payments_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_overtime`
--

CREATE TABLE `xin_salary_overtime` (
  `salary_overtime_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_type` varchar(200) NOT NULL,
  `no_of_days` varchar(100) NOT NULL DEFAULT '0',
  `overtime_hours` varchar(100) NOT NULL DEFAULT '0',
  `overtime_rate` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslips`
--

CREATE TABLE `xin_salary_payslips` (
  `payslip_id` int(11) NOT NULL,
  `payslip_key` varchar(200) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `wages_type` int(11) NOT NULL,
  `payslip_type` varchar(50) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `daily_wages` varchar(200) NOT NULL,
  `is_half_monthly_payroll` tinyint(1) NOT NULL,
  `hours_worked` varchar(50) NOT NULL DEFAULT '0',
  `total_allowances` varchar(200) NOT NULL,
  `total_commissions` varchar(200) NOT NULL,
  `total_statutory_deductions` varchar(200) NOT NULL,
  `total_other_payments` varchar(200) NOT NULL,
  `total_loan` varchar(200) NOT NULL,
  `total_overtime` varchar(200) NOT NULL,
  `statutory_deductions` varchar(200) NOT NULL,
  `gross_salary` decimal(13,2) NOT NULL,
  `net_salary` decimal(13,2) NOT NULL,
  `grand_net_salary` varchar(200) NOT NULL,
  `other_payment` varchar(200) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `pay_comments` mediumtext NOT NULL,
  `is_payment` int(11) NOT NULL,
  `year_to_date` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_payslips`
--

INSERT INTO `xin_salary_payslips` (`payslip_id`, `payslip_key`, `employee_id`, `department_id`, `company_id`, `location_id`, `designation_id`, `salary_month`, `wages_type`, `payslip_type`, `basic_salary`, `daily_wages`, `is_half_monthly_payroll`, `hours_worked`, `total_allowances`, `total_commissions`, `total_statutory_deductions`, `total_other_payments`, `total_loan`, `total_overtime`, `statutory_deductions`, `gross_salary`, `net_salary`, `grand_net_salary`, `other_payment`, `payment_method`, `pay_comments`, `is_payment`, `year_to_date`, `status`, `created_at`) VALUES
(1, 'fFap9oBCI1EizdwSJtc6nh3L7WjDbPGg5YNmeTqA', 4, 2, 1, 1, 1, '2021-01', 1, 'full_monthly', '1000', '', 0, '0', '0', '0', '0', '0', '0', '0', '', '1000.00', '800.00', '', '', 0, '', 1, '15-01-2021', 2, '15-01-2021 03:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_allowances`
--

CREATE TABLE `xin_salary_payslip_allowances` (
  `payslip_allowances_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `allowance_title` varchar(200) NOT NULL,
  `allowance_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_commissions`
--

CREATE TABLE `xin_salary_payslip_commissions` (
  `payslip_commissions_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `commission_id` int(11) NOT NULL,
  `commission_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_leave_deductions`
--

CREATE TABLE `xin_salary_payslip_leave_deductions` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_month` varchar(128) NOT NULL,
  `leave_date` date NOT NULL,
  `leave_amount` decimal(13,5) NOT NULL,
  `is_half` tinyint(4) NOT NULL,
  `total_leave_amount` decimal(13,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_loan`
--

CREATE TABLE `xin_salary_payslip_loan` (
  `payslip_loan_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_title` varchar(200) NOT NULL,
  `loan_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_other_payments`
--

CREATE TABLE `xin_salary_payslip_other_payments` (
  `payslip_other_payment_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payments_title` varchar(200) NOT NULL,
  `payments_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_overtime`
--

CREATE TABLE `xin_salary_payslip_overtime` (
  `payslip_overtime_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_salary_month` varchar(200) NOT NULL,
  `overtime_no_of_days` varchar(200) NOT NULL,
  `overtime_hours` varchar(200) NOT NULL,
  `overtime_rate` varchar(200) NOT NULL,
  `total_overtime` decimal(13,2) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_share_options`
--

CREATE TABLE `xin_salary_payslip_share_options` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` decimal(13,5) NOT NULL,
  `salary_month` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_statutory_deductions`
--

CREATE TABLE `xin_salary_payslip_statutory_deductions` (
  `payslip_deduction_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `deduction_title` varchar(200) NOT NULL,
  `deduction_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_statutory_deductions`
--

CREATE TABLE `xin_salary_statutory_deductions` (
  `statutory_deductions_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `statutory_options` int(11) NOT NULL,
  `deduction_title` varchar(200) DEFAULT NULL,
  `deduction_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_templates`
--

CREATE TABLE `xin_salary_templates` (
  `salary_template_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `salary_grades` varchar(255) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowance` varchar(255) NOT NULL,
  `total_deduction` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_templates`
--

INSERT INTO `xin_salary_templates` (`salary_template_id`, `company_id`, `salary_grades`, `basic_salary`, `overtime_rate`, `house_rent_allowance`, `medical_allowance`, `travelling_allowance`, `dearness_allowance`, `security_deposit`, `provident_fund`, `tax_deduction`, `gross_salary`, `total_allowance`, `total_deduction`, `net_salary`, `added_by`, `created_at`) VALUES
(1, 1, 'Monthly', '2500', '', '50', '60', '70', '80', '40', '20', '30', '2760', '260', '90', '2670', 1, '22-03-2018 01:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `xin_security_level`
--

CREATE TABLE `xin_security_level` (
  `type_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_share_option_scheme`
--

CREATE TABLE `xin_share_option_scheme` (
  `id` int(11) NOT NULL,
  `scheme_shortname` varchar(45) DEFAULT NULL,
  `scheme_fullname` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_share_option_scheme`
--

INSERT INTO `xin_share_option_scheme` (`id`, `scheme_shortname`, `scheme_fullname`, `created_at`, `updated_at`) VALUES
(1, 'EEBR', 'Employee Equity-Based Remuneration', '2021-01-13 09:34:32', NULL),
(2, 'ERIS SME', 'Equity Remuneration Incentive Scheme (ERIS) SMEs', '2021-01-13 09:34:32', NULL),
(3, 'ERIS All Corporations', 'Equity Remuneration Incentive Scheme (ERIS) All Corporations', '2021-01-13 09:34:32', NULL),
(4, 'ERIS Start-Ups', 'Equity Remuneration Incentive Scheme (ERIS) Start-Ups', '2021-01-13 09:34:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_sub_departments`
--

CREATE TABLE `xin_sub_departments` (
  `sub_department_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_sub_departments`
--

INSERT INTO `xin_sub_departments` (`sub_department_id`, `department_id`, `department_name`, `created_at`) VALUES
(8, 1, 'Manager', '2019-02-15 00:22:13'),
(9, 1, 'Lead Manager', '2019-02-15 00:22:21'),
(10, 2, 'Accountant', '2019-02-15 00:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_tickets`
--

CREATE TABLE `xin_support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ticket_code` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `ticket_priority` varchar(255) NOT NULL,
  `department_id` int(111) NOT NULL,
  `assigned_to` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `ticket_remarks` mediumtext NOT NULL,
  `ticket_status` varchar(200) NOT NULL,
  `ticket_note` mediumtext NOT NULL,
  `is_notify` int(11) NOT NULL,
  `ticket_image` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_tickets_employees`
--

CREATE TABLE `xin_support_tickets_employees` (
  `tickets_employees_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_ticket_files`
--

CREATE TABLE `xin_support_ticket_files` (
  `ticket_file_id` int(111) NOT NULL,
  `ticket_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `ticket_files` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_system_setting`
--

CREATE TABLE `xin_system_setting` (
  `setting_id` int(111) NOT NULL,
  `application_name` varchar(255) NOT NULL,
  `default_currency` varchar(255) NOT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_symbol` varchar(255) NOT NULL,
  `show_currency` varchar(255) NOT NULL,
  `currency_position` varchar(255) NOT NULL,
  `notification_position` varchar(255) NOT NULL,
  `notification_close_btn` varchar(255) NOT NULL,
  `notification_bar` varchar(255) NOT NULL,
  `enable_registration` varchar(255) NOT NULL,
  `login_with` varchar(255) NOT NULL,
  `date_format_xi` varchar(255) NOT NULL,
  `employee_manage_own_contact` varchar(255) NOT NULL,
  `employee_manage_own_profile` varchar(255) NOT NULL,
  `employee_manage_own_qualification` varchar(255) NOT NULL,
  `employee_manage_own_work_experience` varchar(255) NOT NULL,
  `employee_manage_own_document` varchar(255) NOT NULL,
  `employee_manage_own_picture` varchar(255) NOT NULL,
  `employee_manage_own_social` varchar(255) NOT NULL,
  `employee_manage_own_bank_account` varchar(255) NOT NULL,
  `enable_attendance` varchar(255) NOT NULL,
  `enable_clock_in_btn` varchar(255) NOT NULL,
  `enable_email_notification` varchar(255) NOT NULL,
  `payroll_include_day_summary` varchar(255) NOT NULL,
  `payroll_include_hour_summary` varchar(255) NOT NULL,
  `payroll_include_leave_summary` varchar(255) NOT NULL,
  `enable_job_application_candidates` varchar(255) NOT NULL,
  `job_logo` varchar(255) NOT NULL,
  `payroll_logo` varchar(255) NOT NULL,
  `is_payslip_password_generate` int(11) NOT NULL,
  `payslip_password_format` varchar(255) NOT NULL,
  `enable_profile_background` varchar(255) NOT NULL,
  `enable_policy_link` varchar(255) NOT NULL,
  `enable_layout` varchar(255) NOT NULL,
  `job_application_format` mediumtext NOT NULL,
  `technical_competencies` text DEFAULT NULL,
  `organizational_competencies` text DEFAULT NULL,
  `project_email` varchar(255) NOT NULL,
  `holiday_email` varchar(255) NOT NULL,
  `leave_email` varchar(255) NOT NULL,
  `payslip_email` varchar(255) NOT NULL,
  `award_email` varchar(255) NOT NULL,
  `recruitment_email` varchar(255) NOT NULL,
  `announcement_email` varchar(255) NOT NULL,
  `training_email` varchar(255) NOT NULL,
  `task_email` varchar(255) NOT NULL,
  `compact_sidebar` varchar(255) NOT NULL,
  `fixed_header` varchar(255) NOT NULL,
  `fixed_sidebar` varchar(255) NOT NULL,
  `boxed_wrapper` varchar(255) NOT NULL,
  `layout_static` varchar(255) NOT NULL,
  `system_skin` varchar(255) NOT NULL,
  `animation_effect` varchar(255) NOT NULL,
  `animation_effect_modal` varchar(255) NOT NULL,
  `animation_effect_topmenu` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `is_ssl_available` varchar(50) NOT NULL,
  `is_active_sub_departments` varchar(10) NOT NULL,
  `default_language` varchar(200) NOT NULL,
  `statutory_fixed` varchar(100) NOT NULL,
  `system_timezone` varchar(200) NOT NULL,
  `system_ip_address` varchar(255) NOT NULL,
  `system_ip_restriction` varchar(200) NOT NULL,
  `google_maps_api_key` mediumtext NOT NULL,
  `module_recruitment` varchar(100) NOT NULL,
  `module_travel` varchar(100) NOT NULL,
  `module_performance` varchar(100) NOT NULL,
  `module_payroll` varchar(10) NOT NULL,
  `module_files` varchar(100) NOT NULL,
  `module_awards` varchar(100) NOT NULL,
  `module_training` varchar(100) NOT NULL,
  `module_inquiry` varchar(100) NOT NULL,
  `module_language` varchar(100) NOT NULL,
  `module_orgchart` varchar(100) NOT NULL,
  `module_accounting` varchar(111) NOT NULL,
  `module_events` varchar(100) NOT NULL,
  `module_goal_tracking` varchar(100) NOT NULL,
  `module_assets` varchar(100) NOT NULL,
  `module_projects_tasks` varchar(100) NOT NULL,
  `module_chat_box` varchar(100) NOT NULL,
  `enable_page_rendered` varchar(255) NOT NULL,
  `enable_current_year` varchar(255) NOT NULL,
  `employee_login_id` varchar(200) NOT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `paypal_sandbox` varchar(10) NOT NULL,
  `paypal_active` varchar(10) NOT NULL,
  `stripe_secret_key` varchar(200) NOT NULL,
  `stripe_publishable_key` varchar(200) NOT NULL,
  `stripe_active` varchar(10) NOT NULL,
  `online_payment_account` int(11) NOT NULL,
  `is_half_monthly` tinyint(1) NOT NULL,
  `half_deduct_month` tinyint(1) NOT NULL,
  `invoice_terms_condition` text DEFAULT NULL,
  `estimate_terms_condition` text DEFAULT NULL,
  `staff_dashboard` int(11) DEFAULT NULL,
  `project_dashboard` int(11) DEFAULT NULL,
  `enable_auth_background` varchar(11) NOT NULL,
  `hr_version` varchar(200) NOT NULL,
  `hr_release_date` varchar(100) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_system_setting`
--

INSERT INTO `xin_system_setting` (`setting_id`, `application_name`, `default_currency`, `default_currency_id`, `default_currency_symbol`, `show_currency`, `currency_position`, `notification_position`, `notification_close_btn`, `notification_bar`, `enable_registration`, `login_with`, `date_format_xi`, `employee_manage_own_contact`, `employee_manage_own_profile`, `employee_manage_own_qualification`, `employee_manage_own_work_experience`, `employee_manage_own_document`, `employee_manage_own_picture`, `employee_manage_own_social`, `employee_manage_own_bank_account`, `enable_attendance`, `enable_clock_in_btn`, `enable_email_notification`, `payroll_include_day_summary`, `payroll_include_hour_summary`, `payroll_include_leave_summary`, `enable_job_application_candidates`, `job_logo`, `payroll_logo`, `is_payslip_password_generate`, `payslip_password_format`, `enable_profile_background`, `enable_policy_link`, `enable_layout`, `job_application_format`, `technical_competencies`, `organizational_competencies`, `project_email`, `holiday_email`, `leave_email`, `payslip_email`, `award_email`, `recruitment_email`, `announcement_email`, `training_email`, `task_email`, `compact_sidebar`, `fixed_header`, `fixed_sidebar`, `boxed_wrapper`, `layout_static`, `system_skin`, `animation_effect`, `animation_effect_modal`, `animation_effect_topmenu`, `footer_text`, `is_ssl_available`, `is_active_sub_departments`, `default_language`, `statutory_fixed`, `system_timezone`, `system_ip_address`, `system_ip_restriction`, `google_maps_api_key`, `module_recruitment`, `module_travel`, `module_performance`, `module_payroll`, `module_files`, `module_awards`, `module_training`, `module_inquiry`, `module_language`, `module_orgchart`, `module_accounting`, `module_events`, `module_goal_tracking`, `module_assets`, `module_projects_tasks`, `module_chat_box`, `enable_page_rendered`, `enable_current_year`, `employee_login_id`, `paypal_email`, `paypal_sandbox`, `paypal_active`, `stripe_secret_key`, `stripe_publishable_key`, `stripe_active`, `online_payment_account`, `is_half_monthly`, `half_deduct_month`, `invoice_terms_condition`, `estimate_terms_condition`, `staff_dashboard`, `project_dashboard`, `enable_auth_background`, `hr_version`, `hr_release_date`, `updated_at`) VALUES
(1, 'SGM', 'SGD - s$', 1, 'SGD - s$', 'symbol', 'Prefix', 'toast-top-center', 'true', 'true', 'no', 'username', 'M-d-Y', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', '', 'yes', 'yes', 'yes', 'yes', '1', 'job_logo_1590790308.png', 'payroll_logo_1610533485.png', 0, 'employee_id', 'yes', 'yes', 'yes', 'doc,docx,pdf', 'Customer Experience,Marketing,Administration', 'Professionalism,Integrity,Attendance', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'sidebar_layout_hrsale', '', 'fixed-sidebar', 'boxed_layout_hrsale', '', 'skin-default', 'fadeInDown', 'tada', 'tada', 'SGM', '', '', 'english', '', 'Asia/Singapore', '::1', '', 'AIzaSyB3gP8H3eypotNeoEtezbRiF_f8Zh_p4ck', '', '', '', 'yes', '', 'true', 'true', 'true', '', 'true', 'true', '', 'true', 'true', 'true', 'true', '', 'yes', 'username', 'hrsalesoft-facilitator@gmail.com', 'yes', 'yes', 'sk_test_2XEyr1hQFGByITfQjSwFqNtm', 'pk_test_zVFISCqeQPnniD0ywHBHikMd', 'yes', 1, 0, 1, '', '', 0, 0, 'yes', '1.0.3', '2018-03-28', '2018-03-28 04:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks`
--

CREATE TABLE `xin_tasks` (
  `task_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `created_by` int(111) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `task_hour` varchar(200) NOT NULL,
  `task_progress` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `task_status` int(5) NOT NULL,
  `task_note` mediumtext NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks_attachment`
--

CREATE TABLE `xin_tasks_attachment` (
  `task_attachment_id` int(11) NOT NULL,
  `task_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks_comments`
--

CREATE TABLE `xin_tasks_comments` (
  `comment_id` int(11) NOT NULL,
  `task_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `task_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_task_categories`
--

CREATE TABLE `xin_task_categories` (
  `task_category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_task_categories`
--

INSERT INTO `xin_task_categories` (`task_category_id`, `category_name`, `created_at`) VALUES
(5, 'Modelling', '17-12-2019 10:44:48'),
(6, 'Fabrication drawings', '17-12-2019 10:44:55'),
(7, 'Erection drawings', '17-12-2019 10:45:01'),
(8, 'As built drawings', '17-12-2019 10:45:06'),
(9, 'R & D and RFI Related', '17-12-2019 10:45:12'),
(10, 'Checking', '17-12-2019 10:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tax_types`
--

CREATE TABLE `xin_tax_types` (
  `tax_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_tax_types`
--

INSERT INTO `xin_tax_types` (`tax_id`, `name`, `rate`, `type`, `description`, `created_at`) VALUES
(1, 'No Tax', '0', 'fixed', 'test', '25-05-2018'),
(2, 'IVU', '2', 'fixed', 'test', '25-05-2018'),
(3, 'VAT', '5', 'percentage', 'testttt', '25-05-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_termination_type`
--

CREATE TABLE `xin_termination_type` (
  `termination_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_termination_type`
--

INSERT INTO `xin_termination_type` (`termination_type_id`, `company_id`, `type`, `created_at`) VALUES
(13, 13, 'Voluntary Termination', '22-03-2018 01:38:41'),
(14, 10, 'type2 termination', ''),
(15, 11, 'type three termination', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_theme_settings`
--

CREATE TABLE `xin_theme_settings` (
  `theme_settings_id` int(11) NOT NULL,
  `fixed_layout` varchar(200) NOT NULL,
  `fixed_footer` varchar(200) NOT NULL,
  `boxed_layout` varchar(200) NOT NULL,
  `page_header` varchar(200) NOT NULL,
  `footer_layout` varchar(200) NOT NULL,
  `statistics_cards` varchar(200) NOT NULL,
  `animation_style` varchar(100) NOT NULL,
  `theme_option` varchar(100) NOT NULL,
  `dashboard_option` varchar(100) NOT NULL,
  `dashboard_calendar` varchar(100) NOT NULL,
  `login_page_options` varchar(100) NOT NULL,
  `sub_menu_icons` varchar(100) NOT NULL,
  `statistics_cards_background` varchar(200) NOT NULL,
  `employee_cards` varchar(200) NOT NULL,
  `card_border_color` varchar(200) NOT NULL,
  `compact_menu` varchar(200) NOT NULL,
  `flipped_menu` varchar(200) NOT NULL,
  `right_side_icons` varchar(200) NOT NULL,
  `bordered_menu` varchar(200) NOT NULL,
  `form_design` varchar(200) NOT NULL,
  `is_semi_dark` int(11) NOT NULL,
  `semi_dark_color` varchar(200) NOT NULL,
  `top_nav_dark_color` varchar(200) NOT NULL,
  `menu_color_option` varchar(200) NOT NULL,
  `export_orgchart` varchar(100) NOT NULL,
  `export_file_title` mediumtext NOT NULL,
  `org_chart_layout` varchar(200) NOT NULL,
  `org_chart_zoom` varchar(100) NOT NULL,
  `org_chart_pan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_theme_settings`
--

INSERT INTO `xin_theme_settings` (`theme_settings_id`, `fixed_layout`, `fixed_footer`, `boxed_layout`, `page_header`, `footer_layout`, `statistics_cards`, `animation_style`, `theme_option`, `dashboard_option`, `dashboard_calendar`, `login_page_options`, `sub_menu_icons`, `statistics_cards_background`, `employee_cards`, `card_border_color`, `compact_menu`, `flipped_menu`, `right_side_icons`, `bordered_menu`, `form_design`, `is_semi_dark`, `semi_dark_color`, `top_nav_dark_color`, `menu_color_option`, `export_orgchart`, `export_file_title`, `org_chart_layout`, `org_chart_zoom`, `org_chart_pan`) VALUES
(1, 'false', 'true', 'false', 'breadcrumb-transparent', 'footer-light', '4', 'fadeInDown', 'template_1', 'dashboard_2', 'true', 'login_page_2', 'fa-check-circle-o', '', '', '', 'true', 'false', 'false', 'false', 'basic_form', 1, 'bg-primary', 'bg-blue-grey', 'menu-dark', 'true', 'HRM', 't2b', 'true', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tickets_attachment`
--

CREATE TABLE `xin_tickets_attachment` (
  `ticket_attachment_id` int(11) NOT NULL,
  `ticket_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_tickets_comments`
--

CREATE TABLE `xin_tickets_comments` (
  `comment_id` int(11) NOT NULL,
  `ticket_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `ticket_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_trainers`
--

CREATE TABLE `xin_trainers` (
  `trainer_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `designation_id` int(111) DEFAULT NULL,
  `expertise` varchar(250) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` varchar(255) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_trainers`
--

INSERT INTO `xin_trainers` (`trainer_id`, `company_id`, `first_name`, `last_name`, `contact_number`, `email`, `designation_id`, `expertise`, `address`, `status`, `created_at`) VALUES
(1, 1, 'tainer test', 'tester', '1234567890', 'trainer@mail.com', 1, 'expertise', 'address ', 1, 'current_timestamp()'),
(7, 1, 'First name', 'Last Name', '1234567890', 'admin@santewellness.net', 7, 'expertis', 'Biology Building B\r\n20-24 Genetics Lane North (Complex road name is Genetics)\r\nBlamey Research Institute\r\n1-131 Sunshine Rd\r\nCAIRNS QLD 4870', 1, '2022-05-26 17:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `xin_training`
--

CREATE TABLE `xin_training` (
  `training_id` int(11) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `employee_id` varchar(200) DEFAULT NULL,
  `training_type_id` varchar(200) DEFAULT NULL,
  `trainer_option` varchar(11) DEFAULT NULL,
  `trainer_id` varchar(200) DEFAULT NULL,
  `start_date` varchar(200) DEFAULT NULL,
  `finish_date` varchar(200) DEFAULT NULL,
  `training_cost` varchar(200) DEFAULT NULL,
  `training_status` varchar(200) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `performance` varchar(200) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_training`
--

INSERT INTO `xin_training` (`training_id`, `company_id`, `employee_id`, `training_type_id`, `trainer_option`, `trainer_id`, `start_date`, `finish_date`, `training_cost`, `training_status`, `description`, `performance`, `remarks`, `created_at`) VALUES
(4, '13', '015', '2', 'Internal', 'tainer test tester', '2022-05-01', '2022-05-24', '345', NULL, 'desc 2323232', 'Performance', 'remarks', '2022-05-26 11:55:27'),
(6, '1', '013', '2', 'External', '1', '2022-05-01', '2022-05-03', '1230', NULL, 'asdfsadfasdf', 'Performance', 'remarks', '2022-05-26 13:17:16'),
(7, NULL, NULL, 'coding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Performance', 'remarks', '2022-05-26 13:36:37'),
(8, NULL, NULL, 'coding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Performance', 'remarks', '2022-05-26 13:37:00'),
(9, NULL, NULL, 'coding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Performance', 'remarks', '2022-05-26 13:37:48'),
(10, NULL, NULL, 'coding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Performance', 'remarks', '2022-05-26 13:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `xin_training_types`
--

CREATE TABLE `xin_training_types` (
  `training_type_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_training_types`
--

INSERT INTO `xin_training_types` (`training_type_id`, `company_id`, `type`, `created_at`, `status`) VALUES
(1, 1, 'Job Training', '19-03-2018 06:45:47', 1),
(7, 1, 'Reserch 1234567890', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_travel_arrangement_type`
--

CREATE TABLE `xin_travel_arrangement_type` (
  `arrangement_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_travel_arrangement_type`
--

INSERT INTO `xin_travel_arrangement_type` (`arrangement_type_id`, `company_id`, `type`, `status`, `created_at`) VALUES
(1, 1, 'Corporation', 1, '19-03-2018 08:45:17'),
(2, 1, 'Guest House', 1, '19-03-2018 08:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `xin_users`
--

CREATE TABLE `xin_users` (
  `user_id` int(11) NOT NULL,
  `user_role` varchar(30) NOT NULL DEFAULT 'administrator',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) NOT NULL,
  `profile_background` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_users`
--

INSERT INTO `xin_users` (`user_id`, `user_role`, `first_name`, `last_name`, `company_name`, `company_logo`, `user_type`, `email`, `username`, `password`, `profile_photo`, `profile_background`, `contact_number`, `gender`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `last_login_date`, `last_login_ip`, `is_logged_in`, `is_active`, `created_at`) VALUES
(1, 'administrator', 'Thomas', 'Fleming', '', '', 2, 'test1@test.com', 'admin', 'test123', 'user_1520720863.jpg', 'profile_background_1505458640.jpg', '12333332', 'Male', 'Address Line 1', 'Address Line 2', 'City', 'State', '12345', 230, '02-06-2021 14:40:12', '124.123.171.227', 1, 1, '14-09-2017 10:02:54'),
(2, 'administrator', 'Main', 'Office', '', '', 2, 'test@test.com', 'test', 'test123', 'user_1523821315.jpg', '', '1234567890', 'Male', 'Address Line 1', 'Address Line 2', 'City', 'State', '11461', 190, '28-05-2021 11:09:31', '49.206.44.196', 1, 1, '15-04-2018 06:13:08'),
(4, 'administrator', 'Fiona', 'Grace', 'HRSALE', 'employer_1524025572.jpg', 1, 'employer@test.com', '', 'test123', '', '', '1234567890', 'Male', 'Address Line 1', 'Address Line 2', 'City', 'State', '11461', 190, '23-04-2018 05:34:54', '::1', 0, 1, '18-04-2018 07:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `xin_user_roles`
--

CREATE TABLE `xin_user_roles` (
  `role_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL,
  `role_access` varchar(200) NOT NULL,
  `role_resources` text NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_warning_type`
--

CREATE TABLE `xin_warning_type` (
  `warning_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_warning_type`
--

INSERT INTO `xin_warning_type` (`warning_type_id`, `company_id`, `type`, `created_at`) VALUES
(1, 1, 'First Written Warning', '22-03-2018 01:38:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_type` (`category_type`),
  ADD KEY `category_creatorid` (`category_creatorid`);

--
-- Indexes for table `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`checklist_id`),
  ADD KEY `checklistresource_type` (`checklistresource_type`),
  ADD KEY `checklistresource_id` (`checklistresource_id`);

--
-- Indexes for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `client_creatorid` (`client_creatorid`),
  ADD KEY `client_categoryid` (`client_categoryid`),
  ADD KEY `client_status` (`client_status`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_creatorid` (`comment_creatorid`),
  ADD KEY `comment_clientid` (`comment_clientid`),
  ADD KEY `commentresource_type` (`commentresource_type`),
  ADD KEY `commentresource_id` (`commentresource_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `contract_clientid` (`contract_clientid`),
  ADD KEY `contract_creatorid` (`contract_creatorid`),
  ADD KEY `contract_categoryid` (`contract_categoryid`),
  ADD KEY `contract_status` (`contract_status`),
  ADD KEY `contract_projectid` (`contract_projectid`);

--
-- Indexes for table `contract_templates`
--
ALTER TABLE `contract_templates`
  ADD PRIMARY KEY (`contracttemplates_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`emaillog_id`);

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`emailqueue_id`),
  ADD KEY `emailqueue_type` (`emailqueue_type`),
  ADD KEY `emailqueue_resourcetype` (`emailqueue_resourcetype`),
  ADD KEY `emailqueue_resourceid` (`emailqueue_resourceid`),
  ADD KEY `emailqueue_pdf_resource_type` (`emailqueue_pdf_resource_type`),
  ADD KEY `emailqueue_pdf_resource_id` (`emailqueue_pdf_resource_id`),
  ADD KEY `emailqueue_status` (`emailqueue_status`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`emailtemplate_id`),
  ADD KEY `emailtemplate_type` (`emailtemplate_type`),
  ADD KEY `emailtemplate_category` (`emailtemplate_category`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`bill_estimateid`),
  ADD KEY `bill_clientid` (`bill_clientid`),
  ADD KEY `bill_creatorid` (`bill_creatorid`),
  ADD KEY `bill_categoryid` (`bill_categoryid`),
  ADD KEY `bill_status` (`bill_status`),
  ADD KEY `bill_type` (`bill_type`),
  ADD KEY `bill_visibility` (`bill_visibility`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `eventresource_type` (`eventresource_type`),
  ADD KEY `eventresource_id` (`eventresource_id`),
  ADD KEY `event_creatorid` (`event_creatorid`),
  ADD KEY `event_type` (`event_item`),
  ADD KEY `event_parent_type` (`event_parent_type`),
  ADD KEY `event_parent_id` (`event_parent_id`),
  ADD KEY `event_item_id` (`event_item_id`);

--
-- Indexes for table `events_tracking`
--
ALTER TABLE `events_tracking`
  ADD PRIMARY KEY (`eventtracking_id`),
  ADD KEY `eventtracking_userid` (`eventtracking_userid`),
  ADD KEY `eventtracking_eventid` (`eventtracking_eventid`),
  ADD KEY `eventtracking_status` (`eventtracking_status`),
  ADD KEY `parent_type` (`parent_type`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `resource_type` (`resource_type`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `expense_clientid` (`expense_clientid`),
  ADD KEY `expense_projectid` (`expense_projectid`),
  ADD KEY `expense_creatorid` (`expense_creatorid`),
  ADD KEY `expense_billable` (`expense_billable`),
  ADD KEY `expense_billing_status` (`expense_billing_status`),
  ADD KEY `expense_billable_invoiceid` (`expense_billable_invoiceid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `file_creatorid` (`file_creatorid`),
  ADD KEY `file_clientid` (`file_clientid`),
  ADD KEY `fileresource_type` (`fileresource_type`),
  ADD KEY `fileresource_id` (`fileresource_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`bill_invoiceid`),
  ADD KEY `invoice_clientid` (`bill_clientid`),
  ADD KEY `invoice_projectid` (`bill_projectid`),
  ADD KEY `invoice_creatorid` (`bill_creatorid`),
  ADD KEY `invoice_categoryid` (`bill_categoryid`),
  ADD KEY `invoice_status` (`bill_status`),
  ADD KEY `invoice_recurring` (`bill_recurring`),
  ADD KEY `bill_type` (`bill_type`),
  ADD KEY `bill_invoice_type` (`bill_invoice_type`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_categoryid` (`item_categoryid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`(191));

--
-- Indexes for table `kb_categories`
--
ALTER TABLE `kb_categories`
  ADD PRIMARY KEY (`kbcategory_id`);

--
-- Indexes for table `knowledgebase`
--
ALTER TABLE `knowledgebase`
  ADD PRIMARY KEY (`knowledgebase_id`),
  ADD KEY `knowledgebase_categoryid` (`knowledgebase_categoryid`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`lead_id`),
  ADD KEY `lead_creatorid` (`lead_creatorid`),
  ADD KEY `lead_categoryid` (`lead_categoryid`),
  ADD KEY `lead_email` (`lead_email`),
  ADD KEY `lead_status` (`lead_status`),
  ADD KEY `lead_converted_clientid` (`lead_converted_clientid`);

--
-- Indexes for table `leads_assigned`
--
ALTER TABLE `leads_assigned`
  ADD PRIMARY KEY (`leadsassigned_id`),
  ADD KEY `leadsassigned_userid` (`leadsassigned_userid`);

--
-- Indexes for table `leads_sources`
--
ALTER TABLE `leads_sources`
  ADD PRIMARY KEY (`leadsources_id`);

--
-- Indexes for table `leads_status`
--
ALTER TABLE `leads_status`
  ADD PRIMARY KEY (`leadstatus_id`);

--
-- Indexes for table `lineitems`
--
ALTER TABLE `lineitems`
  ADD PRIMARY KEY (`lineitem_id`),
  ADD KEY `lineitemresource_linked_type` (`lineitemresource_linked_type`),
  ADD KEY `lineitemresource_linked_id` (`lineitemresource_linked_id`),
  ADD KEY `lineitemresource_type` (`lineitemresource_type`),
  ADD KEY `lineitemresource_id` (`lineitemresource_id`),
  ADD KEY `lineitem_type` (`lineitem_type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`milestone_id`),
  ADD KEY `milestone_projectid` (`milestone_projectid`),
  ADD KEY `milestone_creatorid` (`milestone_creatorid`),
  ADD KEY `milestone_type` (`milestone_type`);

--
-- Indexes for table `milestone_categories`
--
ALTER TABLE `milestone_categories`
  ADD PRIMARY KEY (`milestonecategory_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `note_creatorid` (`note_creatorid`),
  ADD KEY `noteresource_type` (`noteresource_type`),
  ADD KEY `noteresource_id` (`noteresource_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_creatorid` (`payment_creatorid`),
  ADD KEY `payment_invoiceid` (`payment_invoiceid`),
  ADD KEY `payment_clientid` (`payment_clientid`),
  ADD KEY `payment_projectid` (`payment_projectid`),
  ADD KEY `payment_gateway` (`payment_gateway`);

--
-- Indexes for table `payment_sessions`
--
ALTER TABLE `payment_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_gateway_name` (`session_gateway_name`),
  ADD KEY `session_gateway_ref` (`session_gateway_ref`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `FK_projects` (`project_clientid`),
  ADD KEY `project_creatorid` (`project_creatorid`),
  ADD KEY `project_categoryid` (`project_categoryid`),
  ADD KEY `project_status` (`project_status`),
  ADD KEY `project_visibility` (`project_visibility`);

--
-- Indexes for table `projects_assigned`
--
ALTER TABLE `projects_assigned`
  ADD PRIMARY KEY (`projectsassigned_id`),
  ADD KEY `projectsassigned_projectid` (`projectsassigned_projectid`),
  ADD KEY `projectsassigned_userid` (`projectsassigned_userid`);

--
-- Indexes for table `projects_manager`
--
ALTER TABLE `projects_manager`
  ADD PRIMARY KEY (`projectsmanager_id`),
  ADD KEY `projectsmanager_userid` (`projectsmanager_userid`),
  ADD KEY `projectsmanager_projectid` (`projectsmanager_projectid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_type` (`role_type`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `tag_creatorid` (`tag_creatorid`),
  ADD KEY `tagresource_type` (`tagresource_type`),
  ADD KEY `tag_visibility` (`tag_visibility`),
  ADD KEY `tagresource_id` (`tagresource_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_creatorid` (`task_creatorid`),
  ADD KEY `task_clientid` (`task_clientid`),
  ADD KEY `task_billable` (`task_billable`),
  ADD KEY `task_milestoneid` (`task_milestoneid`),
  ADD KEY `task_status` (`task_status`),
  ADD KEY `task_priority` (`task_priority`),
  ADD KEY `taskresource_id` (`task_projectid`),
  ADD KEY `task_visibility` (`task_visibility`);

--
-- Indexes for table `tasks_assigned`
--
ALTER TABLE `tasks_assigned`
  ADD PRIMARY KEY (`tasksassigned_id`),
  ADD KEY `tasksassigned_taskid` (`tasksassigned_taskid`),
  ADD KEY `tasksassigned_userid` (`tasksassigned_userid`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`tax_id`),
  ADD KEY `taxresource_type` (`taxresource_type`),
  ADD KEY `taxresource_id` (`taxresource_id`);

--
-- Indexes for table `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`taxrate_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `ticket_creatorid` (`ticket_creatorid`),
  ADD KEY `ticket_categoryid` (`ticket_categoryid`),
  ADD KEY `ticket_clientid` (`ticket_clientid`),
  ADD KEY `ticket_projectid` (`ticket_projectid`),
  ADD KEY `ticket_priority` (`ticket_priority`),
  ADD KEY `ticket_status` (`ticket_status`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`ticketreply_id`),
  ADD KEY `ticketreply_creatorid` (`ticketreply_creatorid`),
  ADD KEY `ticketreply_ticketid` (`ticketreply_ticketid`),
  ADD KEY `ticketreply_clientid` (`ticketreply_clientid`);

--
-- Indexes for table `timelines`
--
ALTER TABLE `timelines`
  ADD PRIMARY KEY (`timeline_id`),
  ADD KEY `timeline_eventid` (`timeline_eventid`),
  ADD KEY `timeline_resourcetype` (`timeline_resourcetype`),
  ADD KEY `timeline_resourceid` (`timeline_resourceid`);

--
-- Indexes for table `timers`
--
ALTER TABLE `timers`
  ADD PRIMARY KEY (`timer_id`),
  ADD KEY `timer_creatorid` (`timer_creatorid`),
  ADD KEY `timer_taskid` (`timer_taskid`),
  ADD KEY `timer_projectid` (`timer_projectid`),
  ADD KEY `timer_clientid` (`timer_clientid`),
  ADD KEY `timer_status` (`timer_status`),
  ADD KEY `timer_billing_status` (`timer_billing_status`),
  ADD KEY `timer_billing_invoiceid` (`timer_billing_invoiceid`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientid` (`clientid`),
  ADD KEY `primary_contact` (`account_owner`),
  ADD KEY `type` (`type`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `email` (`email`),
  ADD KEY `dashboard_access` (`dashboard_access`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`webhooks_id`);

--
-- Indexes for table `xin_accommodations`
--
ALTER TABLE `xin_accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_advance_salaries`
--
ALTER TABLE `xin_advance_salaries`
  ADD PRIMARY KEY (`advance_salary_id`);

--
-- Indexes for table `xin_announcements`
--
ALTER TABLE `xin_announcements`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `xin_appendix8a_submission`
--
ALTER TABLE `xin_appendix8a_submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_appendix8b_submission`
--
ALTER TABLE `xin_appendix8b_submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_assets`
--
ALTER TABLE `xin_assets`
  ADD PRIMARY KEY (`assets_id`);

--
-- Indexes for table `xin_assets_categories`
--
ALTER TABLE `xin_assets_categories`
  ADD PRIMARY KEY (`assets_category_id`);

--
-- Indexes for table `xin_attendance_time`
--
ALTER TABLE `xin_attendance_time`
  ADD PRIMARY KEY (`time_attendance_id`);

--
-- Indexes for table `xin_attendance_time_request`
--
ALTER TABLE `xin_attendance_time_request`
  ADD PRIMARY KEY (`time_request_id`);

--
-- Indexes for table `xin_awards`
--
ALTER TABLE `xin_awards`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `xin_award_type`
--
ALTER TABLE `xin_award_type`
  ADD PRIMARY KEY (`award_type_id`);

--
-- Indexes for table `xin_chat_messages`
--
ALTER TABLE `xin_chat_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `xin_clients`
--
ALTER TABLE `xin_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `xin_companies`
--
ALTER TABLE `xin_companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `xin_company_documents`
--
ALTER TABLE `xin_company_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `xin_company_info`
--
ALTER TABLE `xin_company_info`
  ADD PRIMARY KEY (`company_info_id`);

--
-- Indexes for table `xin_company_policy`
--
ALTER TABLE `xin_company_policy`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `xin_company_type`
--
ALTER TABLE `xin_company_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `xin_contract_type`
--
ALTER TABLE `xin_contract_type`
  ADD PRIMARY KEY (`contract_type_id`);

--
-- Indexes for table `xin_contribution_funds`
--
ALTER TABLE `xin_contribution_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_contribution_payslip`
--
ALTER TABLE `xin_contribution_payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_contribution_rates`
--
ALTER TABLE `xin_contribution_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contribution_id_idx` (`contribution_id`);

--
-- Indexes for table `xin_countries`
--
ALTER TABLE `xin_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `xin_cpf_options`
--
ALTER TABLE `xin_cpf_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_cpf_payslip`
--
ALTER TABLE `xin_cpf_payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_cpf_percentage`
--
ALTER TABLE `xin_cpf_percentage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_cpf_submission`
--
ALTER TABLE `xin_cpf_submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_currencies`
--
ALTER TABLE `xin_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `xin_currency_converter`
--
ALTER TABLE `xin_currency_converter`
  ADD PRIMARY KEY (`currency_converter_id`);

--
-- Indexes for table `xin_database_backup`
--
ALTER TABLE `xin_database_backup`
  ADD PRIMARY KEY (`backup_id`);

--
-- Indexes for table `xin_departments`
--
ALTER TABLE `xin_departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `xin_designations`
--
ALTER TABLE `xin_designations`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `xin_document_type`
--
ALTER TABLE `xin_document_type`
  ADD PRIMARY KEY (`document_type_id`);

--
-- Indexes for table `xin_efiling_appendix8a`
--
ALTER TABLE `xin_efiling_appendix8a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_efiling_appendix8b`
--
ALTER TABLE `xin_efiling_appendix8b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_efiling_details`
--
ALTER TABLE `xin_efiling_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_efiling_ir8a`
--
ALTER TABLE `xin_efiling_ir8a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_email_configuration`
--
ALTER TABLE `xin_email_configuration`
  ADD PRIMARY KEY (`email_config_id`);

--
-- Indexes for table `xin_email_template`
--
ALTER TABLE `xin_email_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `xin_employees`
--
ALTER TABLE `xin_employees`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `xin_employee_accommodation`
--
ALTER TABLE `xin_employee_accommodation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_bankaccount`
--
ALTER TABLE `xin_employee_bankaccount`
  ADD PRIMARY KEY (`bankaccount_id`);

--
-- Indexes for table `xin_employee_complaints`
--
ALTER TABLE `xin_employee_complaints`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `xin_employee_contacts`
--
ALTER TABLE `xin_employee_contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `xin_employee_contract`
--
ALTER TABLE `xin_employee_contract`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `xin_employee_contribution_funds`
--
ALTER TABLE `xin_employee_contribution_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_documents`
--
ALTER TABLE `xin_employee_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `xin_employee_driver_benefits`
--
ALTER TABLE `xin_employee_driver_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_exit`
--
ALTER TABLE `xin_employee_exit`
  ADD PRIMARY KEY (`exit_id`);

--
-- Indexes for table `xin_employee_exit_type`
--
ALTER TABLE `xin_employee_exit_type`
  ADD PRIMARY KEY (`exit_type_id`);

--
-- Indexes for table `xin_employee_hotel_accommodation_benefits`
--
ALTER TABLE `xin_employee_hotel_accommodation_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_housekeeping_benefits`
--
ALTER TABLE `xin_employee_housekeeping_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_immigration`
--
ALTER TABLE `xin_employee_immigration`
  ADD PRIMARY KEY (`immigration_id`);

--
-- Indexes for table `xin_employee_immigration_status`
--
ALTER TABLE `xin_employee_immigration_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_leave`
--
ALTER TABLE `xin_employee_leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `xin_employee_location`
--
ALTER TABLE `xin_employee_location`
  ADD PRIMARY KEY (`office_location_id`);

--
-- Indexes for table `xin_employee_other_benefits`
--
ALTER TABLE `xin_employee_other_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_overtime`
--
ALTER TABLE `xin_employee_overtime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_overtime_rate`
--
ALTER TABLE `xin_employee_overtime_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_promotions`
--
ALTER TABLE `xin_employee_promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `xin_employee_qualification`
--
ALTER TABLE `xin_employee_qualification`
  ADD PRIMARY KEY (`qualification_id`);

--
-- Indexes for table `xin_employee_resignations`
--
ALTER TABLE `xin_employee_resignations`
  ADD PRIMARY KEY (`resignation_id`);

--
-- Indexes for table `xin_employee_security_level`
--
ALTER TABLE `xin_employee_security_level`
  ADD PRIMARY KEY (`security_level_id`);

--
-- Indexes for table `xin_employee_share_options`
--
ALTER TABLE `xin_employee_share_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_shift`
--
ALTER TABLE `xin_employee_shift`
  ADD PRIMARY KEY (`emp_shift_id`);

--
-- Indexes for table `xin_employee_terminations`
--
ALTER TABLE `xin_employee_terminations`
  ADD PRIMARY KEY (`termination_id`);

--
-- Indexes for table `xin_employee_transfer`
--
ALTER TABLE `xin_employee_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `xin_employee_travels`
--
ALTER TABLE `xin_employee_travels`
  ADD PRIMARY KEY (`travel_id`);

--
-- Indexes for table `xin_employee_utility_benefits`
--
ALTER TABLE `xin_employee_utility_benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_employee_warnings`
--
ALTER TABLE `xin_employee_warnings`
  ADD PRIMARY KEY (`warning_id`);

--
-- Indexes for table `xin_employee_work_experience`
--
ALTER TABLE `xin_employee_work_experience`
  ADD PRIMARY KEY (`work_experience_id`);

--
-- Indexes for table `xin_employee_year_leave`
--
ALTER TABLE `xin_employee_year_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_ethnicity_type`
--
ALTER TABLE `xin_ethnicity_type`
  ADD PRIMARY KEY (`ethnicity_type_id`);

--
-- Indexes for table `xin_events`
--
ALTER TABLE `xin_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `xin_expenses`
--
ALTER TABLE `xin_expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `xin_expense_type`
--
ALTER TABLE `xin_expense_type`
  ADD PRIMARY KEY (`expense_type_id`);

--
-- Indexes for table `xin_file_manager`
--
ALTER TABLE `xin_file_manager`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `xin_file_manager_settings`
--
ALTER TABLE `xin_file_manager_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `xin_finance_bankcash`
--
ALTER TABLE `xin_finance_bankcash`
  ADD PRIMARY KEY (`bankcash_id`);

--
-- Indexes for table `xin_finance_deposit`
--
ALTER TABLE `xin_finance_deposit`
  ADD PRIMARY KEY (`deposit_id`);

--
-- Indexes for table `xin_finance_expense`
--
ALTER TABLE `xin_finance_expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `xin_finance_payees`
--
ALTER TABLE `xin_finance_payees`
  ADD PRIMARY KEY (`payee_id`);

--
-- Indexes for table `xin_finance_payers`
--
ALTER TABLE `xin_finance_payers`
  ADD PRIMARY KEY (`payer_id`);

--
-- Indexes for table `xin_finance_transaction`
--
ALTER TABLE `xin_finance_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `xin_finance_transactions`
--
ALTER TABLE `xin_finance_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `xin_finance_transfer`
--
ALTER TABLE `xin_finance_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `xin_goal_tracking`
--
ALTER TABLE `xin_goal_tracking`
  ADD PRIMARY KEY (`tracking_id`);

--
-- Indexes for table `xin_goal_tracking_type`
--
ALTER TABLE `xin_goal_tracking_type`
  ADD PRIMARY KEY (`tracking_type_id`);

--
-- Indexes for table `xin_holidays`
--
ALTER TABLE `xin_holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `xin_hourly_templates`
--
ALTER TABLE `xin_hourly_templates`
  ADD PRIMARY KEY (`hourly_rate_id`);

--
-- Indexes for table `xin_hrsale_invoices`
--
ALTER TABLE `xin_hrsale_invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `xin_hrsale_invoices_items`
--
ALTER TABLE `xin_hrsale_invoices_items`
  ADD PRIMARY KEY (`invoice_item_id`);

--
-- Indexes for table `xin_hrsale_module_attributes`
--
ALTER TABLE `xin_hrsale_module_attributes`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `xin_hrsale_module_attributes_select_value`
--
ALTER TABLE `xin_hrsale_module_attributes_select_value`
  ADD PRIMARY KEY (`attributes_select_value_id`);

--
-- Indexes for table `xin_hrsale_module_attributes_values`
--
ALTER TABLE `xin_hrsale_module_attributes_values`
  ADD PRIMARY KEY (`attributes_value_id`);

--
-- Indexes for table `xin_hrsale_quotes`
--
ALTER TABLE `xin_hrsale_quotes`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indexes for table `xin_hrsale_quotes_items`
--
ALTER TABLE `xin_hrsale_quotes_items`
  ADD PRIMARY KEY (`quote_item_id`);

--
-- Indexes for table `xin_immigration_status`
--
ALTER TABLE `xin_immigration_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_income_categories`
--
ALTER TABLE `xin_income_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `xin_ir8a_submission`
--
ALTER TABLE `xin_ir8a_submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_jobs`
--
ALTER TABLE `xin_jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `xin_job_applications`
--
ALTER TABLE `xin_job_applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `xin_job_categories`
--
ALTER TABLE `xin_job_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `xin_job_interviews`
--
ALTER TABLE `xin_job_interviews`
  ADD PRIMARY KEY (`job_interview_id`);

--
-- Indexes for table `xin_job_pages`
--
ALTER TABLE `xin_job_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `xin_job_type`
--
ALTER TABLE `xin_job_type`
  ADD PRIMARY KEY (`job_type_id`);

--
-- Indexes for table `xin_kpi_incidental`
--
ALTER TABLE `xin_kpi_incidental`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_kpi_maingoals`
--
ALTER TABLE `xin_kpi_maingoals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_kpi_variable`
--
ALTER TABLE `xin_kpi_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_languages`
--
ALTER TABLE `xin_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `xin_leads`
--
ALTER TABLE `xin_leads`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `xin_leads_followup`
--
ALTER TABLE `xin_leads_followup`
  ADD PRIMARY KEY (`leads_followup_id`);

--
-- Indexes for table `xin_leave_applications`
--
ALTER TABLE `xin_leave_applications`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `xin_leave_type`
--
ALTER TABLE `xin_leave_type`
  ADD PRIMARY KEY (`leave_type_id`);

--
-- Indexes for table `xin_make_payment`
--
ALTER TABLE `xin_make_payment`
  ADD PRIMARY KEY (`make_payment_id`);

--
-- Indexes for table `xin_meetings`
--
ALTER TABLE `xin_meetings`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `xin_office_location`
--
ALTER TABLE `xin_office_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `xin_office_shift`
--
ALTER TABLE `xin_office_shift`
  ADD PRIMARY KEY (`office_shift_id`);

--
-- Indexes for table `xin_payment_deduction_types`
--
ALTER TABLE `xin_payment_deduction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_payment_method`
--
ALTER TABLE `xin_payment_method`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `xin_payroll_custom_fields`
--
ALTER TABLE `xin_payroll_custom_fields`
  ADD PRIMARY KEY (`payroll_custom_id`);

--
-- Indexes for table `xin_payslip_items`
--
ALTER TABLE `xin_payslip_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_performance_appraisal`
--
ALTER TABLE `xin_performance_appraisal`
  ADD PRIMARY KEY (`performance_appraisal_id`);

--
-- Indexes for table `xin_performance_appraisal_options`
--
ALTER TABLE `xin_performance_appraisal_options`
  ADD PRIMARY KEY (`performance_appraisal_options_id`);

--
-- Indexes for table `xin_performance_indicator`
--
ALTER TABLE `xin_performance_indicator`
  ADD PRIMARY KEY (`performance_indicator_id`);

--
-- Indexes for table `xin_performance_indicator_options`
--
ALTER TABLE `xin_performance_indicator_options`
  ADD PRIMARY KEY (`performance_indicator_options_id`);

--
-- Indexes for table `xin_person_id_type`
--
ALTER TABLE `xin_person_id_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_projects`
--
ALTER TABLE `xin_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `xin_projects_attachment`
--
ALTER TABLE `xin_projects_attachment`
  ADD PRIMARY KEY (`project_attachment_id`);

--
-- Indexes for table `xin_projects_bugs`
--
ALTER TABLE `xin_projects_bugs`
  ADD PRIMARY KEY (`bug_id`);

--
-- Indexes for table `xin_projects_discussion`
--
ALTER TABLE `xin_projects_discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `xin_projects_timelogs`
--
ALTER TABLE `xin_projects_timelogs`
  ADD PRIMARY KEY (`timelogs_id`);

--
-- Indexes for table `xin_project_variations`
--
ALTER TABLE `xin_project_variations`
  ADD PRIMARY KEY (`variation_id`) USING BTREE;

--
-- Indexes for table `xin_qualification_education_level`
--
ALTER TABLE `xin_qualification_education_level`
  ADD PRIMARY KEY (`education_level_id`);

--
-- Indexes for table `xin_qualification_language`
--
ALTER TABLE `xin_qualification_language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `xin_qualification_skill`
--
ALTER TABLE `xin_qualification_skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `xin_quoted_projects`
--
ALTER TABLE `xin_quoted_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `xin_quoted_projects_attachment`
--
ALTER TABLE `xin_quoted_projects_attachment`
  ADD PRIMARY KEY (`project_attachment_id`);

--
-- Indexes for table `xin_quoted_projects_discussion`
--
ALTER TABLE `xin_quoted_projects_discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `xin_quoted_projects_timelogs`
--
ALTER TABLE `xin_quoted_projects_timelogs`
  ADD PRIMARY KEY (`timelogs_id`);

--
-- Indexes for table `xin_recruitment_pages`
--
ALTER TABLE `xin_recruitment_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `xin_recruitment_subpages`
--
ALTER TABLE `xin_recruitment_subpages`
  ADD PRIMARY KEY (`subpages_id`);

--
-- Indexes for table `xin_salary_allowances`
--
ALTER TABLE `xin_salary_allowances`
  ADD PRIMARY KEY (`allowance_id`);

--
-- Indexes for table `xin_salary_bank_allocation`
--
ALTER TABLE `xin_salary_bank_allocation`
  ADD PRIMARY KEY (`bank_allocation_id`);

--
-- Indexes for table `xin_salary_commissions`
--
ALTER TABLE `xin_salary_commissions`
  ADD PRIMARY KEY (`salary_commissions_id`);

--
-- Indexes for table `xin_salary_loan_deductions`
--
ALTER TABLE `xin_salary_loan_deductions`
  ADD PRIMARY KEY (`loan_deduction_id`);

--
-- Indexes for table `xin_salary_other_payments`
--
ALTER TABLE `xin_salary_other_payments`
  ADD PRIMARY KEY (`other_payments_id`);

--
-- Indexes for table `xin_salary_overtime`
--
ALTER TABLE `xin_salary_overtime`
  ADD PRIMARY KEY (`salary_overtime_id`);

--
-- Indexes for table `xin_salary_payslips`
--
ALTER TABLE `xin_salary_payslips`
  ADD PRIMARY KEY (`payslip_id`);

--
-- Indexes for table `xin_salary_payslip_allowances`
--
ALTER TABLE `xin_salary_payslip_allowances`
  ADD PRIMARY KEY (`payslip_allowances_id`);

--
-- Indexes for table `xin_salary_payslip_commissions`
--
ALTER TABLE `xin_salary_payslip_commissions`
  ADD PRIMARY KEY (`payslip_commissions_id`);

--
-- Indexes for table `xin_salary_payslip_leave_deductions`
--
ALTER TABLE `xin_salary_payslip_leave_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_salary_payslip_loan`
--
ALTER TABLE `xin_salary_payslip_loan`
  ADD PRIMARY KEY (`payslip_loan_id`);

--
-- Indexes for table `xin_salary_payslip_other_payments`
--
ALTER TABLE `xin_salary_payslip_other_payments`
  ADD PRIMARY KEY (`payslip_other_payment_id`);

--
-- Indexes for table `xin_salary_payslip_overtime`
--
ALTER TABLE `xin_salary_payslip_overtime`
  ADD PRIMARY KEY (`payslip_overtime_id`);

--
-- Indexes for table `xin_salary_payslip_share_options`
--
ALTER TABLE `xin_salary_payslip_share_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_salary_payslip_statutory_deductions`
--
ALTER TABLE `xin_salary_payslip_statutory_deductions`
  ADD PRIMARY KEY (`payslip_deduction_id`);

--
-- Indexes for table `xin_salary_statutory_deductions`
--
ALTER TABLE `xin_salary_statutory_deductions`
  ADD PRIMARY KEY (`statutory_deductions_id`);

--
-- Indexes for table `xin_salary_templates`
--
ALTER TABLE `xin_salary_templates`
  ADD PRIMARY KEY (`salary_template_id`);

--
-- Indexes for table `xin_security_level`
--
ALTER TABLE `xin_security_level`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `xin_share_option_scheme`
--
ALTER TABLE `xin_share_option_scheme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_sub_departments`
--
ALTER TABLE `xin_sub_departments`
  ADD PRIMARY KEY (`sub_department_id`);

--
-- Indexes for table `xin_support_tickets`
--
ALTER TABLE `xin_support_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `xin_support_tickets_employees`
--
ALTER TABLE `xin_support_tickets_employees`
  ADD PRIMARY KEY (`tickets_employees_id`);

--
-- Indexes for table `xin_support_ticket_files`
--
ALTER TABLE `xin_support_ticket_files`
  ADD PRIMARY KEY (`ticket_file_id`);

--
-- Indexes for table `xin_system_setting`
--
ALTER TABLE `xin_system_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `xin_tasks`
--
ALTER TABLE `xin_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `xin_tasks_attachment`
--
ALTER TABLE `xin_tasks_attachment`
  ADD PRIMARY KEY (`task_attachment_id`);

--
-- Indexes for table `xin_tasks_comments`
--
ALTER TABLE `xin_tasks_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `xin_task_categories`
--
ALTER TABLE `xin_task_categories`
  ADD PRIMARY KEY (`task_category_id`);

--
-- Indexes for table `xin_tax_types`
--
ALTER TABLE `xin_tax_types`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `xin_termination_type`
--
ALTER TABLE `xin_termination_type`
  ADD PRIMARY KEY (`termination_type_id`);

--
-- Indexes for table `xin_theme_settings`
--
ALTER TABLE `xin_theme_settings`
  ADD PRIMARY KEY (`theme_settings_id`);

--
-- Indexes for table `xin_tickets_attachment`
--
ALTER TABLE `xin_tickets_attachment`
  ADD PRIMARY KEY (`ticket_attachment_id`);

--
-- Indexes for table `xin_tickets_comments`
--
ALTER TABLE `xin_tickets_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `xin_trainers`
--
ALTER TABLE `xin_trainers`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Indexes for table `xin_training`
--
ALTER TABLE `xin_training`
  ADD PRIMARY KEY (`training_id`);

--
-- Indexes for table `xin_training_types`
--
ALTER TABLE `xin_training_types`
  ADD PRIMARY KEY (`training_type_id`);

--
-- Indexes for table `xin_travel_arrangement_type`
--
ALTER TABLE `xin_travel_arrangement_type`
  ADD PRIMARY KEY (`arrangement_type_id`);

--
-- Indexes for table `xin_users`
--
ALTER TABLE `xin_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `xin_user_roles`
--
ALTER TABLE `xin_user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `xin_warning_type`
--
ALTER TABLE `xin_warning_type`
  ADD PRIMARY KEY (`warning_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '[do not truncate] - only delete where category_system_default = no', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `checklist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_templates`
--
ALTER TABLE `contract_templates`
  MODIFY `contracttemplates_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '[do not truncate]';

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `emaillog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `emailqueue_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `emailtemplate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'x', AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `bill_estimateid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_tracking`
--
ALTER TABLE `events_tracking`
  MODIFY `eventtracking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `bill_invoiceid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kb_categories`
--
ALTER TABLE `kb_categories`
  MODIFY `kbcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `knowledgebase`
--
ALTER TABLE `knowledgebase`
  MODIFY `knowledgebase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `lead_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_assigned`
--
ALTER TABLE `leads_assigned`
  MODIFY `leadsassigned_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_sources`
--
ALTER TABLE `leads_sources`
  MODIFY `leadsources_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_status`
--
ALTER TABLE `leads_status`
  MODIFY `leadstatus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lineitems`
--
ALTER TABLE `lineitems`
  MODIFY `lineitem_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `milestone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `milestone_categories`
--
ALTER TABLE `milestone_categories`
  MODIFY `milestonecategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '[truncate]';

--
-- AUTO_INCREMENT for table `payment_sessions`
--
ALTER TABLE `payment_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_assigned`
--
ALTER TABLE `projects_assigned`
  MODIFY `projectsassigned_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '[truncate]';

--
-- AUTO_INCREMENT for table `projects_manager`
--
ALTER TABLE `projects_manager`
  MODIFY `projectsmanager_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks_assigned`
--
ALTER TABLE `tasks_assigned`
  MODIFY `tasksassigned_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '[truncate]', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `taxrate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `ticketreply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timelines`
--
ALTER TABLE `timelines`
  MODIFY `timeline_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timers`
--
ALTER TABLE `timers`
  MODIFY `timer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `webhooks_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_accommodations`
--
ALTER TABLE `xin_accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_advance_salaries`
--
ALTER TABLE `xin_advance_salaries`
  MODIFY `advance_salary_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_announcements`
--
ALTER TABLE `xin_announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `xin_appendix8a_submission`
--
ALTER TABLE `xin_appendix8a_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_appendix8b_submission`
--
ALTER TABLE `xin_appendix8b_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_assets`
--
ALTER TABLE `xin_assets`
  MODIFY `assets_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_assets_categories`
--
ALTER TABLE `xin_assets_categories`
  MODIFY `assets_category_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_attendance_time`
--
ALTER TABLE `xin_attendance_time`
  MODIFY `time_attendance_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `xin_attendance_time_request`
--
ALTER TABLE `xin_attendance_time_request`
  MODIFY `time_request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_awards`
--
ALTER TABLE `xin_awards`
  MODIFY `award_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `xin_award_type`
--
ALTER TABLE `xin_award_type`
  MODIFY `award_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_chat_messages`
--
ALTER TABLE `xin_chat_messages`
  MODIFY `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_clients`
--
ALTER TABLE `xin_clients`
  MODIFY `client_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_companies`
--
ALTER TABLE `xin_companies`
  MODIFY `company_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `xin_company_documents`
--
ALTER TABLE `xin_company_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_company_info`
--
ALTER TABLE `xin_company_info`
  MODIFY `company_info_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_company_policy`
--
ALTER TABLE `xin_company_policy`
  MODIFY `policy_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `xin_company_type`
--
ALTER TABLE `xin_company_type`
  MODIFY `type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_contract_type`
--
ALTER TABLE `xin_contract_type`
  MODIFY `contract_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_contribution_funds`
--
ALTER TABLE `xin_contribution_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_contribution_payslip`
--
ALTER TABLE `xin_contribution_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_contribution_rates`
--
ALTER TABLE `xin_contribution_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `xin_countries`
--
ALTER TABLE `xin_countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `xin_cpf_options`
--
ALTER TABLE `xin_cpf_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_cpf_payslip`
--
ALTER TABLE `xin_cpf_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_cpf_percentage`
--
ALTER TABLE `xin_cpf_percentage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `xin_cpf_submission`
--
ALTER TABLE `xin_cpf_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_currencies`
--
ALTER TABLE `xin_currencies`
  MODIFY `currency_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_currency_converter`
--
ALTER TABLE `xin_currency_converter`
  MODIFY `currency_converter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_database_backup`
--
ALTER TABLE `xin_database_backup`
  MODIFY `backup_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_departments`
--
ALTER TABLE `xin_departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_designations`
--
ALTER TABLE `xin_designations`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xin_document_type`
--
ALTER TABLE `xin_document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_efiling_appendix8a`
--
ALTER TABLE `xin_efiling_appendix8a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_efiling_appendix8b`
--
ALTER TABLE `xin_efiling_appendix8b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_efiling_details`
--
ALTER TABLE `xin_efiling_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_efiling_ir8a`
--
ALTER TABLE `xin_efiling_ir8a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_email_configuration`
--
ALTER TABLE `xin_email_configuration`
  MODIFY `email_config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_email_template`
--
ALTER TABLE `xin_email_template`
  MODIFY `template_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `xin_employees`
--
ALTER TABLE `xin_employees`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `xin_employee_accommodation`
--
ALTER TABLE `xin_employee_accommodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_bankaccount`
--
ALTER TABLE `xin_employee_bankaccount`
  MODIFY `bankaccount_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_complaints`
--
ALTER TABLE `xin_employee_complaints`
  MODIFY `complaint_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `xin_employee_contacts`
--
ALTER TABLE `xin_employee_contacts`
  MODIFY `contact_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_employee_contract`
--
ALTER TABLE `xin_employee_contract`
  MODIFY `contract_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_contribution_funds`
--
ALTER TABLE `xin_employee_contribution_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_documents`
--
ALTER TABLE `xin_employee_documents`
  MODIFY `document_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_driver_benefits`
--
ALTER TABLE `xin_employee_driver_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_exit`
--
ALTER TABLE `xin_employee_exit`
  MODIFY `exit_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `xin_employee_exit_type`
--
ALTER TABLE `xin_employee_exit_type`
  MODIFY `exit_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_employee_hotel_accommodation_benefits`
--
ALTER TABLE `xin_employee_hotel_accommodation_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_housekeeping_benefits`
--
ALTER TABLE `xin_employee_housekeeping_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_immigration`
--
ALTER TABLE `xin_employee_immigration`
  MODIFY `immigration_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_immigration_status`
--
ALTER TABLE `xin_employee_immigration_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `xin_employee_leave`
--
ALTER TABLE `xin_employee_leave`
  MODIFY `leave_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_location`
--
ALTER TABLE `xin_employee_location`
  MODIFY `office_location_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_other_benefits`
--
ALTER TABLE `xin_employee_other_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_overtime`
--
ALTER TABLE `xin_employee_overtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_overtime_rate`
--
ALTER TABLE `xin_employee_overtime_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_promotions`
--
ALTER TABLE `xin_employee_promotions`
  MODIFY `promotion_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `xin_employee_qualification`
--
ALTER TABLE `xin_employee_qualification`
  MODIFY `qualification_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_resignations`
--
ALTER TABLE `xin_employee_resignations`
  MODIFY `resignation_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `xin_employee_security_level`
--
ALTER TABLE `xin_employee_security_level`
  MODIFY `security_level_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_share_options`
--
ALTER TABLE `xin_employee_share_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_shift`
--
ALTER TABLE `xin_employee_shift`
  MODIFY `emp_shift_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_terminations`
--
ALTER TABLE `xin_employee_terminations`
  MODIFY `termination_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `xin_employee_transfer`
--
ALTER TABLE `xin_employee_transfer`
  MODIFY `transfer_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `xin_employee_travels`
--
ALTER TABLE `xin_employee_travels`
  MODIFY `travel_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_utility_benefits`
--
ALTER TABLE `xin_employee_utility_benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_warnings`
--
ALTER TABLE `xin_employee_warnings`
  MODIFY `warning_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `xin_employee_work_experience`
--
ALTER TABLE `xin_employee_work_experience`
  MODIFY `work_experience_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_year_leave`
--
ALTER TABLE `xin_employee_year_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_ethnicity_type`
--
ALTER TABLE `xin_ethnicity_type`
  MODIFY `ethnicity_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_events`
--
ALTER TABLE `xin_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_expenses`
--
ALTER TABLE `xin_expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_expense_type`
--
ALTER TABLE `xin_expense_type`
  MODIFY `expense_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_file_manager`
--
ALTER TABLE `xin_file_manager`
  MODIFY `file_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_file_manager_settings`
--
ALTER TABLE `xin_file_manager_settings`
  MODIFY `setting_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_finance_bankcash`
--
ALTER TABLE `xin_finance_bankcash`
  MODIFY `bankcash_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_deposit`
--
ALTER TABLE `xin_finance_deposit`
  MODIFY `deposit_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_expense`
--
ALTER TABLE `xin_finance_expense`
  MODIFY `expense_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_payees`
--
ALTER TABLE `xin_finance_payees`
  MODIFY `payee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_payers`
--
ALTER TABLE `xin_finance_payers`
  MODIFY `payer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_transaction`
--
ALTER TABLE `xin_finance_transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_transactions`
--
ALTER TABLE `xin_finance_transactions`
  MODIFY `transaction_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_finance_transfer`
--
ALTER TABLE `xin_finance_transfer`
  MODIFY `transfer_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_goal_tracking`
--
ALTER TABLE `xin_goal_tracking`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_goal_tracking_type`
--
ALTER TABLE `xin_goal_tracking_type`
  MODIFY `tracking_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_holidays`
--
ALTER TABLE `xin_holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hourly_templates`
--
ALTER TABLE `xin_hourly_templates`
  MODIFY `hourly_rate_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_invoices`
--
ALTER TABLE `xin_hrsale_invoices`
  MODIFY `invoice_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_invoices_items`
--
ALTER TABLE `xin_hrsale_invoices_items`
  MODIFY `invoice_item_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_module_attributes`
--
ALTER TABLE `xin_hrsale_module_attributes`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_module_attributes_select_value`
--
ALTER TABLE `xin_hrsale_module_attributes_select_value`
  MODIFY `attributes_select_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_module_attributes_values`
--
ALTER TABLE `xin_hrsale_module_attributes_values`
  MODIFY `attributes_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_quotes`
--
ALTER TABLE `xin_hrsale_quotes`
  MODIFY `quote_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_hrsale_quotes_items`
--
ALTER TABLE `xin_hrsale_quotes_items`
  MODIFY `quote_item_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_immigration_status`
--
ALTER TABLE `xin_immigration_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_income_categories`
--
ALTER TABLE `xin_income_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `xin_ir8a_submission`
--
ALTER TABLE `xin_ir8a_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_jobs`
--
ALTER TABLE `xin_jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_job_applications`
--
ALTER TABLE `xin_job_applications`
  MODIFY `application_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_job_categories`
--
ALTER TABLE `xin_job_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `xin_job_interviews`
--
ALTER TABLE `xin_job_interviews`
  MODIFY `job_interview_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_job_pages`
--
ALTER TABLE `xin_job_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `xin_job_type`
--
ALTER TABLE `xin_job_type`
  MODIFY `job_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_kpi_incidental`
--
ALTER TABLE `xin_kpi_incidental`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_kpi_maingoals`
--
ALTER TABLE `xin_kpi_maingoals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_kpi_variable`
--
ALTER TABLE `xin_kpi_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_languages`
--
ALTER TABLE `xin_languages`
  MODIFY `language_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `xin_leads`
--
ALTER TABLE `xin_leads`
  MODIFY `client_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_leads_followup`
--
ALTER TABLE `xin_leads_followup`
  MODIFY `leads_followup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_leave_applications`
--
ALTER TABLE `xin_leave_applications`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `xin_leave_type`
--
ALTER TABLE `xin_leave_type`
  MODIFY `leave_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `xin_make_payment`
--
ALTER TABLE `xin_make_payment`
  MODIFY `make_payment_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_meetings`
--
ALTER TABLE `xin_meetings`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_office_location`
--
ALTER TABLE `xin_office_location`
  MODIFY `location_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `xin_office_shift`
--
ALTER TABLE `xin_office_shift`
  MODIFY `office_shift_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_payment_deduction_types`
--
ALTER TABLE `xin_payment_deduction_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `xin_payment_method`
--
ALTER TABLE `xin_payment_method`
  MODIFY `payment_method_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_payroll_custom_fields`
--
ALTER TABLE `xin_payroll_custom_fields`
  MODIFY `payroll_custom_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_payslip_items`
--
ALTER TABLE `xin_payslip_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_performance_appraisal`
--
ALTER TABLE `xin_performance_appraisal`
  MODIFY `performance_appraisal_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_performance_appraisal_options`
--
ALTER TABLE `xin_performance_appraisal_options`
  MODIFY `performance_appraisal_options_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_performance_indicator`
--
ALTER TABLE `xin_performance_indicator`
  MODIFY `performance_indicator_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_performance_indicator_options`
--
ALTER TABLE `xin_performance_indicator_options`
  MODIFY `performance_indicator_options_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_person_id_type`
--
ALTER TABLE `xin_person_id_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_projects`
--
ALTER TABLE `xin_projects`
  MODIFY `project_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_projects_attachment`
--
ALTER TABLE `xin_projects_attachment`
  MODIFY `project_attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_projects_bugs`
--
ALTER TABLE `xin_projects_bugs`
  MODIFY `bug_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_projects_discussion`
--
ALTER TABLE `xin_projects_discussion`
  MODIFY `discussion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_projects_timelogs`
--
ALTER TABLE `xin_projects_timelogs`
  MODIFY `timelogs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_project_variations`
--
ALTER TABLE `xin_project_variations`
  MODIFY `variation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_qualification_education_level`
--
ALTER TABLE `xin_qualification_education_level`
  MODIFY `education_level_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_qualification_language`
--
ALTER TABLE `xin_qualification_language`
  MODIFY `language_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_qualification_skill`
--
ALTER TABLE `xin_qualification_skill`
  MODIFY `skill_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_quoted_projects`
--
ALTER TABLE `xin_quoted_projects`
  MODIFY `project_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_quoted_projects_attachment`
--
ALTER TABLE `xin_quoted_projects_attachment`
  MODIFY `project_attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_quoted_projects_discussion`
--
ALTER TABLE `xin_quoted_projects_discussion`
  MODIFY `discussion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_quoted_projects_timelogs`
--
ALTER TABLE `xin_quoted_projects_timelogs`
  MODIFY `timelogs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_recruitment_pages`
--
ALTER TABLE `xin_recruitment_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_recruitment_subpages`
--
ALTER TABLE `xin_recruitment_subpages`
  MODIFY `subpages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `xin_salary_allowances`
--
ALTER TABLE `xin_salary_allowances`
  MODIFY `allowance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_bank_allocation`
--
ALTER TABLE `xin_salary_bank_allocation`
  MODIFY `bank_allocation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_commissions`
--
ALTER TABLE `xin_salary_commissions`
  MODIFY `salary_commissions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_loan_deductions`
--
ALTER TABLE `xin_salary_loan_deductions`
  MODIFY `loan_deduction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_other_payments`
--
ALTER TABLE `xin_salary_other_payments`
  MODIFY `other_payments_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_overtime`
--
ALTER TABLE `xin_salary_overtime`
  MODIFY `salary_overtime_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslips`
--
ALTER TABLE `xin_salary_payslips`
  MODIFY `payslip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_allowances`
--
ALTER TABLE `xin_salary_payslip_allowances`
  MODIFY `payslip_allowances_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_commissions`
--
ALTER TABLE `xin_salary_payslip_commissions`
  MODIFY `payslip_commissions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_leave_deductions`
--
ALTER TABLE `xin_salary_payslip_leave_deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_loan`
--
ALTER TABLE `xin_salary_payslip_loan`
  MODIFY `payslip_loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_other_payments`
--
ALTER TABLE `xin_salary_payslip_other_payments`
  MODIFY `payslip_other_payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_overtime`
--
ALTER TABLE `xin_salary_payslip_overtime`
  MODIFY `payslip_overtime_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_share_options`
--
ALTER TABLE `xin_salary_payslip_share_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_payslip_statutory_deductions`
--
ALTER TABLE `xin_salary_payslip_statutory_deductions`
  MODIFY `payslip_deduction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_statutory_deductions`
--
ALTER TABLE `xin_salary_statutory_deductions`
  MODIFY `statutory_deductions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_salary_templates`
--
ALTER TABLE `xin_salary_templates`
  MODIFY `salary_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_security_level`
--
ALTER TABLE `xin_security_level`
  MODIFY `type_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_share_option_scheme`
--
ALTER TABLE `xin_share_option_scheme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_sub_departments`
--
ALTER TABLE `xin_sub_departments`
  MODIFY `sub_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `xin_support_tickets`
--
ALTER TABLE `xin_support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_support_tickets_employees`
--
ALTER TABLE `xin_support_tickets_employees`
  MODIFY `tickets_employees_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_support_ticket_files`
--
ALTER TABLE `xin_support_ticket_files`
  MODIFY `ticket_file_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_system_setting`
--
ALTER TABLE `xin_system_setting`
  MODIFY `setting_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_tasks`
--
ALTER TABLE `xin_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_tasks_attachment`
--
ALTER TABLE `xin_tasks_attachment`
  MODIFY `task_attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_tasks_comments`
--
ALTER TABLE `xin_tasks_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_task_categories`
--
ALTER TABLE `xin_task_categories`
  MODIFY `task_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `xin_tax_types`
--
ALTER TABLE `xin_tax_types`
  MODIFY `tax_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_termination_type`
--
ALTER TABLE `xin_termination_type`
  MODIFY `termination_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `xin_theme_settings`
--
ALTER TABLE `xin_theme_settings`
  MODIFY `theme_settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_tickets_attachment`
--
ALTER TABLE `xin_tickets_attachment`
  MODIFY `ticket_attachment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_tickets_comments`
--
ALTER TABLE `xin_tickets_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_trainers`
--
ALTER TABLE `xin_trainers`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xin_training`
--
ALTER TABLE `xin_training`
  MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `xin_training_types`
--
ALTER TABLE `xin_training_types`
  MODIFY `training_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xin_travel_arrangement_type`
--
ALTER TABLE `xin_travel_arrangement_type`
  MODIFY `arrangement_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_users`
--
ALTER TABLE `xin_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_user_roles`
--
ALTER TABLE `xin_user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_warning_type`
--
ALTER TABLE `xin_warning_type`
  MODIFY `warning_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `xin_contribution_rates`
--
ALTER TABLE `xin_contribution_rates`
  ADD CONSTRAINT `fk_contribution_id` FOREIGN KEY (`contribution_id`) REFERENCES `xin_contribution_funds` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
