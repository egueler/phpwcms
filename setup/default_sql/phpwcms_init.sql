-- phpwcms default Schema
-- ======================

CREATE TABLE `phpwcms_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_key` varchar(255) NOT NULL DEFAULT '',
  `address_email` text NOT NULL,
  `address_name` text NOT NULL,
  `address_verified` int(1) NOT NULL DEFAULT '0',
  `address_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_subscription` blob NOT NULL,
  `address_iddetail` int(11) NOT NULL DEFAULT '0',
  `address_url1` varchar(255) NOT NULL DEFAULT '',
  `address_url2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_id`)
);

CREATE TABLE `phpwcms_ads_campaign` (
  `adcampaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `adcampaign_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adcampaign_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adcampaign_status` int(1) NOT NULL DEFAULT '0',
  `adcampaign_title` varchar(255) NOT NULL DEFAULT '',
  `adcampaign_comment` text NOT NULL,
  `adcampaign_datestart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adcampaign_dateend` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adcampaign_maxview` int(11) NOT NULL DEFAULT '0',
  `adcampaign_maxclick` int(11) NOT NULL DEFAULT '0',
  `adcampaign_maxviewuser` int(11) NOT NULL DEFAULT '0',
  `adcampaign_curview` int(11) NOT NULL DEFAULT '0',
  `adcampaign_curclick` int(11) NOT NULL DEFAULT '0',
  `adcampaign_curviewuser` int(11) NOT NULL DEFAULT '0',
  `adcampaign_type` int(11) NOT NULL DEFAULT '0',
  `adcampaign_place` int(11) NOT NULL DEFAULT '0',
  `adcampaign_data` mediumtext NOT NULL,
  PRIMARY KEY (`adcampaign_id`),
  KEY `adcampaign_status` (`adcampaign_status`,`adcampaign_datestart`,`adcampaign_dateend`,`adcampaign_type`,`adcampaign_place`),
  KEY `adcampaign_maxview` (`adcampaign_maxview`,`adcampaign_maxclick`,`adcampaign_maxviewuser`),
  KEY `adcampaign_curview` (`adcampaign_curview`,`adcampaign_curclick`,`adcampaign_curviewuser`)
);

CREATE TABLE `phpwcms_ads_formats` (
  `adformat_id` int(11) NOT NULL AUTO_INCREMENT,
  `adformat_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adformat_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adformat_status` int(1) NOT NULL DEFAULT '0',
  `adformat_title` varchar(25) NOT NULL DEFAULT '',
  `adformat_width` int(5) NOT NULL DEFAULT '0',
  `adformat_height` int(5) NOT NULL DEFAULT '0',
  `adformat_comment` text NOT NULL,
  PRIMARY KEY (`adformat_id`),
  KEY `adformat_status` (`adformat_status`)
);

CREATE TABLE `phpwcms_ads_place` (
  `adplace_id` int(11) NOT NULL AUTO_INCREMENT,
  `adplace_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adplace_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adplace_status` int(1) NOT NULL DEFAULT '0',
  `adplace_title` varchar(255) NOT NULL DEFAULT '',
  `adplace_format` int(11) NOT NULL DEFAULT '0',
  `adplace_width` int(11) NOT NULL DEFAULT '0',
  `adplace_height` int(11) NOT NULL DEFAULT '0',
  `adplace_prefix` varchar(255) NOT NULL DEFAULT '',
  `adplace_suffix` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`adplace_id`),
  KEY `adplace_status` (`adplace_status`)
);

CREATE TABLE `phpwcms_ads_tracking` (
  `adtracking_id` int(11) NOT NULL AUTO_INCREMENT,
  `adtracking_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adtracking_campaignid` int(11) NOT NULL DEFAULT '0',
  `adtracking_ip` varchar(30) NOT NULL DEFAULT '',
  `adtracking_cookieid` varchar(50) NOT NULL DEFAULT '',
  `adtracking_countclick` int(11) NOT NULL DEFAULT '0',
  `adtracking_countview` int(11) NOT NULL DEFAULT '0',
  `adtracking_useragent` varchar(255) NOT NULL DEFAULT '',
  `adtracking_ref` text NOT NULL,
  `adtracking_catid` int(11) NOT NULL DEFAULT '0',
  `adtracking_articleid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adtracking_id`),
  KEY `adtracking_campaignid` (`adtracking_campaignid`,`adtracking_ip`,`adtracking_countclick`,`adtracking_countview`),
  KEY `adtracking_cookieid` (`adtracking_cookieid`)
);

CREATE TABLE `phpwcms_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_cid` int(11) NOT NULL DEFAULT '0',
  `article_tid` int(11) NOT NULL DEFAULT '0',
  `article_uid` int(11) NOT NULL DEFAULT '0',
  `article_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `article_username` varchar(255) NOT NULL DEFAULT '',
  `article_title` text NOT NULL,
  `article_alias` varchar(1000) NOT NULL DEFAULT '',
  `article_keyword` text NOT NULL,
  `article_public` int(1) NOT NULL DEFAULT '1',
  `article_deleted` int(1) NOT NULL DEFAULT '0',
  `article_begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `article_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `article_aktiv` int(1) NOT NULL DEFAULT '0',
  `article_subtitle` text NOT NULL,
  `article_summary` mediumtext NOT NULL,
  `article_redirect` text NOT NULL,
  `article_sort` int(11) NOT NULL DEFAULT '0',
  `article_notitle` int(1) NOT NULL DEFAULT '0',
  `article_hidesummary` int(1) NOT NULL DEFAULT '0',
  `article_image` blob NOT NULL,
  `article_created` varchar(14) NOT NULL DEFAULT '',
  `article_cache` varchar(10) NOT NULL DEFAULT '0',
  `article_nosearch` char(1) NOT NULL DEFAULT '0',
  `article_nositemap` int(1) NOT NULL DEFAULT '0',
  `article_aliasid` int(11) NOT NULL DEFAULT '0',
  `article_headerdata` int(1) NOT NULL DEFAULT '0',
  `article_morelink` int(1) NOT NULL DEFAULT '1',
  `article_noteaser` int(1) unsigned NOT NULL DEFAULT '0',
  `article_pagetitle` varchar(2000) NOT NULL DEFAULT '',
  `article_paginate` int(1) NOT NULL DEFAULT '0',
  `article_serialized` blob NOT NULL,
  `article_priorize` int(5) NOT NULL DEFAULT '0',
  `article_norss` int(1) NOT NULL DEFAULT '1',
  `article_archive_status` int(1) NOT NULL DEFAULT '1',
  `article_menutitle` varchar(2000) NOT NULL DEFAULT '',
  `article_description` text NOT NULL,
  `article_lang` varchar(255) NOT NULL DEFAULT '',
  `article_lang_type` varchar(255) NOT NULL DEFAULT '',
  `article_lang_id` int(11) unsigned NOT NULL DEFAULT '0',
  `article_opengraph` int(1) unsigned NOT NULL DEFAULT '1',
  `article_canonical` varchar(2000) NOT NULL DEFAULT '',
  `article_meta` mediumtext NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `article_aktiv` (`article_aktiv`),
  KEY `article_public` (`article_public`),
  KEY `article_deleted` (`article_deleted`),
  KEY `article_nosearch` (`article_nosearch`),
  KEY `article_begin` (`article_begin`),
  KEY `article_end` (`article_end`),
  KEY `article_cid` (`article_cid`),
  KEY `article_tstamp` (`article_tstamp`),
  KEY `article_priorize` (`article_priorize`),
  KEY `article_sort` (`article_sort`),
  KEY `article_alias` (`article_alias`),
  KEY `article_archive_status` (`article_archive_status`),
  KEY `article_lang` (`article_lang`),
  KEY `article_lang_type` (`article_lang_type`),
  KEY `article_lang_id` (`article_lang_id`),
  KEY `article_noteaser` (`article_noteaser`),
  KEY `article_opengraph` (`article_opengraph`)
);

CREATE TABLE `phpwcms_articlecat` (
  `acat_id` int(11) NOT NULL AUTO_INCREMENT,
  `acat_name` text NOT NULL,
  `acat_title` varchar(2000) NOT NULL DEFAULT '',
  `acat_info` text NOT NULL,
  `acat_public` int(1) NOT NULL DEFAULT '1',
  `acat_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `acat_aktiv` int(1) NOT NULL DEFAULT '0',
  `acat_uid` int(11) NOT NULL DEFAULT '0',
  `acat_trash` int(1) NOT NULL DEFAULT '0',
  `acat_struct` int(11) NOT NULL DEFAULT '0',
  `acat_sort` int(11) NOT NULL DEFAULT '0',
  `acat_alias` varchar(1000) NOT NULL DEFAULT '',
  `acat_hidden` int(1) NOT NULL DEFAULT '0',
  `acat_template` int(11) NOT NULL DEFAULT '0',
  `acat_ssl` int(1) NOT NULL DEFAULT '0',
  `acat_regonly` int(1) NOT NULL DEFAULT '0',
  `acat_topcount` int(11) NOT NULL DEFAULT '0',
  `acat_redirect` text NOT NULL,
  `acat_order` int(2) NOT NULL DEFAULT '0',
  `acat_cache` varchar(10) NOT NULL DEFAULT '',
  `acat_nosearch` char(1) NOT NULL DEFAULT '',
  `acat_nositemap` int(1) NOT NULL DEFAULT '0',
  `acat_permit` text NOT NULL,
  `acat_maxlist` int(11) NOT NULL DEFAULT '0',
  `acat_cntpart` varchar(255) NOT NULL DEFAULT '',
  `acat_pagetitle` varchar(2000) NOT NULL DEFAULT '',
  `acat_paginate` int(1) NOT NULL DEFAULT '0',
  `acat_overwrite` varchar(255) NOT NULL DEFAULT '',
  `acat_archive` int(1) NOT NULL DEFAULT '0',
  `acat_class` varchar(255) NOT NULL DEFAULT '',
  `acat_keywords` varchar(255) NOT NULL DEFAULT '',
  `acat_cpdefault` int(10) unsigned NOT NULL DEFAULT '0',
  `acat_lang` varchar(255) NOT NULL DEFAULT '',
  `acat_lang_type` varchar(255) NOT NULL DEFAULT '',
  `acat_lang_id` int(11) unsigned NOT NULL DEFAULT '0',
  `acat_disable301` int(1) unsigned NOT NULL DEFAULT '0',
  `acat_opengraph` int(1) unsigned NOT NULL DEFAULT '1',
  `acat_canonical` varchar(2000) NOT NULL DEFAULT '',
  `acat_breadcrumb` int(1) unsigned NOT NULL DEFAULT '0',
  `acat_onepage` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`acat_id`),
  KEY `acat_struct` (`acat_struct`),
  KEY `acat_sort` (`acat_sort`),
  KEY `acat_alias` (`acat_alias`),
  KEY `acat_archive` (`acat_archive`),
  KEY `acat_lang` (`acat_lang`),
  KEY `acat_lang_type` (`acat_lang_type`),
  KEY `acat_lang_id` (`acat_lang_id`),
  KEY `acat_opengraph` (`acat_opengraph`)
);

CREATE TABLE `phpwcms_articlecontent` (
  `acontent_id` int(11) NOT NULL AUTO_INCREMENT,
  `acontent_aid` int(11) NOT NULL DEFAULT '0',
  `acontent_uid` int(11) NOT NULL DEFAULT '0',
  `acontent_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acontent_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `acontent_title` text NOT NULL,
  `acontent_text` mediumtext NOT NULL,
  `acontent_type` int(10) NOT NULL DEFAULT '0',
  `acontent_sorting` int(11) NOT NULL DEFAULT '0',
  `acontent_image` text NOT NULL,
  `acontent_files` text NOT NULL,
  `acontent_visible` int(1) NOT NULL DEFAULT '0',
  `acontent_subtitle` text NOT NULL,
  `acontent_before` varchar(10) NOT NULL DEFAULT '',
  `acontent_after` varchar(10) NOT NULL DEFAULT '',
  `acontent_top` int(1) NOT NULL DEFAULT '0',
  `acontent_redirect` text NOT NULL,
  `acontent_html` mediumtext NOT NULL,
  `acontent_trash` int(1) NOT NULL DEFAULT '0',
  `acontent_alink` text NOT NULL,
  `acontent_media` mediumtext NOT NULL,
  `acontent_form` mediumtext NOT NULL,
  `acontent_newsletter` mediumtext NOT NULL,
  `acontent_block` varchar(200) NOT NULL DEFAULT 'CONTENT',
  `acontent_anchor` int(1) NOT NULL DEFAULT '0',
  `acontent_template` varchar(255) NOT NULL DEFAULT '',
  `acontent_spacer` int(1) NOT NULL DEFAULT '0',
  `acontent_tid` int(11) NOT NULL DEFAULT '0',
  `acontent_livedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acontent_killdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acontent_module` varchar(255) NOT NULL DEFAULT '',
  `acontent_comment` text NOT NULL,
  `acontent_paginate_page` int(5) NOT NULL DEFAULT '0',
  `acontent_paginate_title` varchar(2000) NOT NULL DEFAULT '',
  `acontent_category` varchar(255) NOT NULL DEFAULT '',
  `acontent_granted` int(11) NOT NULL DEFAULT '0',
  `acontent_tab` varchar(2000) NOT NULL DEFAULT '',
  `acontent_lang` varchar(255) NOT NULL DEFAULT '',
  `acontent_attr_class` varchar(255) NOT NULL DEFAULT '',
  `acontent_attr_id` varchar(255) NOT NULL DEFAULT '',
  `acontent_setting` mediumtext,
  `acontent_type_setting` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`acontent_id`),
  KEY `acontent_aid` (`acontent_aid`),
  KEY `acontent_sorting` (`acontent_sorting`),
  KEY `acontent_type` (`acontent_type`),
  KEY `acontent_livedate` (`acontent_livedate`,`acontent_killdate`),
  KEY `acontent_paginate` (`acontent_paginate_page`),
  KEY `acontent_granted` (`acontent_granted`),
  KEY `acontent_lang` (`acontent_lang`)
);

CREATE TABLE `phpwcms_cache` (
  `cache_id` int(11) NOT NULL AUTO_INCREMENT,
  `cache_hash` varchar(50) NOT NULL DEFAULT '',
  `cache_uri` text NOT NULL,
  `cache_cid` int(11) NOT NULL DEFAULT '0',
  `cache_aid` int(11) NOT NULL DEFAULT '0',
  `cache_timeout` varchar(20) NOT NULL DEFAULT '0',
  `cache_isprint` int(1) NOT NULL DEFAULT '0',
  `cache_changed` int(14) DEFAULT NULL,
  `cache_use` int(1) NOT NULL DEFAULT '0',
  `cache_searchable` int(1) NOT NULL DEFAULT '0',
  `cache_page` longtext NOT NULL,
  `cache_stripped` longtext NOT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `cache_hash` (`cache_hash`),
  FULLTEXT KEY `cache_stripped` (`cache_stripped`)
);

CREATE TABLE `phpwcms_calendar` (
  `calendar_id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `calendar_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `calendar_status` int(1) NOT NULL DEFAULT '0',
  `calendar_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `calendar_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `calendar_allday` int(1) NOT NULL DEFAULT '0',
  `calendar_range` int(1) NOT NULL DEFAULT '0',
  `calendar_range_start` date NOT NULL DEFAULT '0000-00-00',
  `calendar_range_end` date NOT NULL DEFAULT '0000-00-00',
  `calendar_title` varchar(255) NOT NULL DEFAULT '',
  `calendar_where` varchar(255) NOT NULL DEFAULT '',
  `calendar_teaser` text NOT NULL,
  `calendar_text` mediumtext NOT NULL,
  `calendar_tag` varchar(255) NOT NULL DEFAULT '',
  `calendar_object` longtext NOT NULL,
  `calendar_refid` varchar(1000) NOT NULL DEFAULT '',
  `calendar_lang` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`calendar_id`),
  KEY `calendar_status` (`calendar_status`),
  KEY `calendar_start` (`calendar_start`),
  KEY `calendar_end` (`calendar_end`),
  KEY `calendar_tag` (`calendar_tag`),
  KEY `calendar_refid` (`calendar_refid`),
  KEY `calendar_range` (`calendar_range`),
  KEY `calendar_lang` (`calendar_lang`)
);

CREATE TABLE `phpwcms_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_type` varchar(255) NOT NULL DEFAULT '',
  `cat_pid` int(11) NOT NULL DEFAULT '0',
  `cat_status` int(1) NOT NULL DEFAULT '0',
  `cat_createdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cat_changedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_info` text NOT NULL,
  `cat_sort` int(11) NOT NULL DEFAULT '0',
  `cat_opengraph` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`),
  KEY `cat_type` (`cat_type`,`cat_status`),
  KEY `cat_pid` (`cat_pid`),
  KEY `cat_sort` (`cat_sort`),
  KEY `cat_opengraph` (`cat_opengraph`)
);

CREATE TABLE `phpwcms_chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_uid` int(11) NOT NULL DEFAULT '0',
  `chat_name` varchar(30) NOT NULL DEFAULT '',
  `chat_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chat_text` varchar(255) NOT NULL DEFAULT '',
  `chat_cat` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chat_id`)
);

CREATE TABLE `phpwcms_content` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnt_pid` int(11) NOT NULL DEFAULT '0',
  `cnt_created` int(11) NOT NULL DEFAULT '0',
  `cnt_changed` int(11) NOT NULL DEFAULT '0',
  `cnt_status` int(1) NOT NULL DEFAULT '0',
  `cnt_type` varchar(255) NOT NULL DEFAULT '',
  `cnt_module` varchar(255) NOT NULL DEFAULT '',
  `cnt_group` int(11) NOT NULL DEFAULT '0',
  `cnt_owner` int(11) NOT NULL DEFAULT '0',
  `cnt_livedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cnt_killdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cnt_archive_status` int(11) NOT NULL DEFAULT '0',
  `cnt_sort` int(11) NOT NULL DEFAULT '0',
  `cnt_prio` int(11) NOT NULL DEFAULT '0',
  `cnt_alias` varchar(255) NOT NULL DEFAULT '',
  `cnt_name` varchar(255) NOT NULL DEFAULT '',
  `cnt_title` varchar(255) NOT NULL DEFAULT '',
  `cnt_subtitle` varchar(255) NOT NULL DEFAULT '',
  `cnt_editor` varchar(255) NOT NULL DEFAULT '',
  `cnt_place` varchar(255) NOT NULL DEFAULT '',
  `cnt_teasertext` text NOT NULL,
  `cnt_text` text NOT NULL,
  `cnt_lang` varchar(10) NOT NULL DEFAULT '',
  `cnt_object` text NOT NULL,
  `cnt_opengraph` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cnt_id`),
  KEY `cnt_livedate` (`cnt_livedate`),
  KEY `cnt_killdate` (`cnt_killdate`),
  KEY `cnt_module` (`cnt_module`),
  KEY `cnt_type` (`cnt_type`),
  KEY `cnt_group` (`cnt_group`),
  KEY `cnt_owner` (`cnt_owner`),
  KEY `cnt_alias` (`cnt_alias`),
  KEY `cnt_pid` (`cnt_pid`),
  KEY `cnt_sort` (`cnt_sort`),
  KEY `cnt_prio` (`cnt_prio`),
  KEY `cnt_opengraph` (`cnt_opengraph`)
);

CREATE TABLE `phpwcms_country` (
  `country_id` int(4) NOT NULL AUTO_INCREMENT,
  `country_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_iso` char(2) NOT NULL DEFAULT '',
  `country_iso3` char(3) NOT NULL DEFAULT '',
  `country_isonum` int(11) NOT NULL DEFAULT '0',
  `country_continent_code` char(2) NOT NULL DEFAULT '',
  `country_name` varchar(255) NOT NULL DEFAULT '',
  `country_name_de` varchar(255) NOT NULL DEFAULT '',
  `country_continent` varchar(255) NOT NULL DEFAULT '',
  `country_continent_de` varchar(255) NOT NULL DEFAULT '',
  `country_region` varchar(255) NOT NULL DEFAULT '',
  `country_region_de` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_iso` (`country_iso`),
  UNIQUE KEY `country_name` (`country_name`)
);

CREATE TABLE `phpwcms_crossreference` (
  `cref_id` int(11) NOT NULL AUTO_INCREMENT,
  `cref_type` varchar(255) NOT NULL DEFAULT '',
  `cref_module` varchar(255) NOT NULL DEFAULT '',
  `cref_rid` int(11) NOT NULL DEFAULT '0',
  `cref_int` int(11) NOT NULL DEFAULT '0',
  `cref_str` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cref_id`),
  KEY `cref_type` (`cref_type`),
  KEY `cref_rid` (`cref_rid`),
  KEY `cref_int` (`cref_int`),
  KEY `cref_str` (`cref_str`),
  KEY `cref_module` (`cref_module`)
);

CREATE TABLE `phpwcms_file` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_pid` int(11) NOT NULL DEFAULT '0',
  `f_uid` int(11) NOT NULL DEFAULT '0',
  `f_kid` int(2) NOT NULL DEFAULT '0',
  `f_is_variation` int(11) NOT NULL DEFAULT '0',
  `f_order` int(11) NOT NULL DEFAULT '0',
  `f_trash` int(1) NOT NULL DEFAULT '0',
  `f_aktiv` int(1) NOT NULL DEFAULT '0',
  `f_public` int(1) NOT NULL DEFAULT '0',
  `f_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `f_name` varchar(255) NOT NULL DEFAULT '',
  `f_cat` varchar(255) NOT NULL DEFAULT '',
  `f_created` int(11) NOT NULL DEFAULT '0',
  `f_changed` int(11) NOT NULL DEFAULT '0',
  `f_size` int(15) unsigned NOT NULL DEFAULT '0',
  `f_type` varchar(200) NOT NULL DEFAULT '',
  `f_ext` varchar(50) NOT NULL DEFAULT '',
  `f_svg` int(1) unsigned NOT NULL DEFAULT '0',
  `f_image_width` varchar(20) NOT NULL DEFAULT '',
  `f_image_height` varchar(20) NOT NULL DEFAULT '',
  `f_shortinfo` varchar(1000) NOT NULL DEFAULT '',
  `f_longinfo` text NOT NULL,
  `f_keywords` varchar(1000) NOT NULL DEFAULT '',
  `f_hash` varchar(255) NOT NULL DEFAULT '',
  `f_dlstart` int(11) NOT NULL DEFAULT '0',
  `f_dlfinal` int(11) NOT NULL DEFAULT '0',
  `f_refid` int(11) NOT NULL DEFAULT '0',
  `f_copyright` varchar(1000) NOT NULL DEFAULT '',
  `f_tags` varchar(1000) NOT NULL DEFAULT '',
  `f_granted` int(11) NOT NULL DEFAULT '0',
  `f_gallerystatus` int(1) NOT NULL DEFAULT '0',
  `f_vars` blob NOT NULL,
  `f_sort` int(11) NOT NULL DEFAULT '0',
  `f_title` varchar(1000) NOT NULL DEFAULT '',
  `f_alt` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`f_id`),
  KEY `f_granted` (`f_granted`),
  KEY `f_sort` (`f_sort`),
  KEY `f_pid` (`f_pid`),
  KEY `f_is_variation` (`f_is_variation`),
  FULLTEXT KEY `f_name` (`f_name`),
  FULLTEXT KEY `f_shortinfo` (`f_shortinfo`)
);

CREATE TABLE `phpwcms_filecat` (
  `fcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `fcat_name` varchar(255) NOT NULL DEFAULT '',
  `fcat_aktiv` int(1) NOT NULL DEFAULT '0',
  `fcat_deleted` int(1) NOT NULL DEFAULT '0',
  `fcat_needed` int(1) NOT NULL DEFAULT '0',
  `fcat_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fcat_id`)
);

CREATE TABLE `phpwcms_filekey` (
  `fkey_id` int(11) NOT NULL AUTO_INCREMENT,
  `fkey_cid` int(11) NOT NULL DEFAULT '0',
  `fkey_name` varchar(255) NOT NULL DEFAULT '',
  `fkey_aktiv` int(1) NOT NULL DEFAULT '0',
  `fkey_deleted` int(1) NOT NULL DEFAULT '0',
  `fkey_sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fkey_id`)
);

CREATE TABLE `phpwcms_formresult` (
  `formresult_id` int(11) NOT NULL AUTO_INCREMENT,
  `formresult_pid` int(11) NOT NULL DEFAULT '0',
  `formresult_createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `formresult_ip` varchar(50) NOT NULL DEFAULT '',
  `formresult_content` mediumblob NOT NULL,
  PRIMARY KEY (`formresult_id`),
  KEY `formresult_pid` (`formresult_pid`)
);

CREATE TABLE `phpwcms_formtracking` (
  `formtracking_id` int(11) NOT NULL AUTO_INCREMENT,
  `formtracking_hash` varchar(50) NOT NULL DEFAULT '',
  `formtracking_ip` varchar(20) NOT NULL DEFAULT '',
  `formtracking_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `formtracking_sentdate` varchar(20) NOT NULL DEFAULT '',
  `formtracking_sent` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`formtracking_id`)
);

CREATE TABLE `phpwcms_glossary` (
  `glossary_id` int(11) NOT NULL AUTO_INCREMENT,
  `glossary_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `glossary_changed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `glossary_title` text NOT NULL,
  `glossary_tag` varchar(255) NOT NULL DEFAULT '',
  `glossary_keyword` varchar(255) NOT NULL DEFAULT '',
  `glossary_text` mediumtext NOT NULL,
  `glossary_highlight` int(1) NOT NULL DEFAULT '0',
  `glossary_object` mediumtext NOT NULL,
  `glossary_status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`glossary_id`),
  KEY `glossary_status` (`glossary_status`),
  KEY `glossary_tag` (`glossary_tag`),
  KEY `glossary_keyword` (`glossary_keyword`),
  KEY `glossary_highlight` (`glossary_highlight`)
);

CREATE TABLE `phpwcms_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `guestbook_cid` int(11) NOT NULL DEFAULT '0',
  `guestbook_msg` text NOT NULL,
  `guestbook_name` text NOT NULL,
  `guestbook_email` text NOT NULL,
  `guestbook_created` int(11) NOT NULL DEFAULT '0',
  `guestbook_trashed` int(1) NOT NULL DEFAULT '0',
  `guestbook_url` text NOT NULL,
  `guestbook_show` int(1) NOT NULL DEFAULT '0',
  `guestbook_ip` varchar(20) NOT NULL DEFAULT '',
  `guestbook_useragent` varchar(255) NOT NULL DEFAULT '',
  `guestbook_image` varchar(255) NOT NULL DEFAULT '',
  `guestbook_imagename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`guestbook_id`)
);

CREATE TABLE `phpwcms_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(255) NOT NULL DEFAULT '',
  `keyword_created` varchar(14) NOT NULL DEFAULT '',
  `keyword_trash` int(1) NOT NULL DEFAULT '0',
  `keyword_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keyword_description` text NOT NULL,
  `keyword_link` varchar(255) NOT NULL DEFAULT '',
  `keyword_sort` int(11) NOT NULL DEFAULT '0',
  `keyword_important` int(1) NOT NULL DEFAULT '0',
  `keyword_abbr` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`keyword_id`),
  KEY `keyword_abbr` (`keyword_abbr`)
);

CREATE TABLE `phpwcms_language` (
  `lang_id` varchar(255) NOT NULL DEFAULT '',
  `lang_html` int(1) NOT NULL DEFAULT '1',
  `lang_type` int(1) NOT NULL DEFAULT '0',
  `EN` text NOT NULL,
  `DE` text NOT NULL,
  `BG` text NOT NULL,
  `CA` text NOT NULL,
  `CZ` text NOT NULL,
  `DA` text NOT NULL,
  `EE` text NOT NULL,
  `ES` text NOT NULL,
  `FI` text NOT NULL,
  `FR` text NOT NULL,
  `GR` text NOT NULL,
  `HU` text NOT NULL,
  `IT` text NOT NULL,
  `LT` text NOT NULL,
  `NL` text NOT NULL,
  `NO` text NOT NULL,
  `PL` text NOT NULL,
  `PT` text NOT NULL,
  `RO` text NOT NULL,
  `SE` text NOT NULL,
  `SK` text NOT NULL,
  `VN` text NOT NULL,
  PRIMARY KEY (`lang_id`)
);

CREATE TABLE `phpwcms_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_type` varchar(50) NOT NULL DEFAULT '',
  `log_ip` varchar(30) NOT NULL DEFAULT '',
  `log_user_agent` varchar(255) NOT NULL DEFAULT '',
  `log_user_id` int(11) NOT NULL DEFAULT '0',
  `log_user_name` varchar(255) NOT NULL DEFAULT '',
  `log_referrer_id` int(11) NOT NULL DEFAULT '0',
  `log_referrer_url` text NOT NULL,
  `log_data1` varchar(255) NOT NULL DEFAULT '',
  `log_data2` varchar(255) NOT NULL DEFAULT '',
  `log_data3` varchar(255) NOT NULL DEFAULT '',
  `log_msg` text NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_referrer_id` (`log_referrer_id`),
  KEY `log_type` (`log_type`)
);

CREATE TABLE `phpwcms_log_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `domain` varchar(255) NOT NULL DEFAULT '',
  `query` varchar(255) NOT NULL DEFAULT '',
  `pos` int(11) NOT NULL DEFAULT '0',
  `referrer` text NOT NULL,
  `hash` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
);

CREATE TABLE `phpwcms_map` (
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_cid` int(11) NOT NULL DEFAULT '0',
  `map_x` int(5) NOT NULL DEFAULT '0',
  `map_y` int(5) NOT NULL DEFAULT '0',
  `map_title` text NOT NULL,
  `map_zip` varchar(255) NOT NULL DEFAULT '',
  `map_city` text NOT NULL,
  `map_deleted` int(1) NOT NULL DEFAULT '0',
  `map_entry` text NOT NULL,
  `map_vars` text NOT NULL,
  PRIMARY KEY (`map_id`)
);

CREATE TABLE `phpwcms_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_pid` int(11) NOT NULL DEFAULT '0',
  `msg_uid` int(11) NOT NULL DEFAULT '0',
  `msg_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msg_subject` varchar(150) NOT NULL DEFAULT '',
  `msg_text` blob NOT NULL,
  `msg_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `msg_read` tinyint(1) NOT NULL DEFAULT '0',
  `msg_to` blob NOT NULL,
  `msg_from` int(11) NOT NULL DEFAULT '0',
  `msg_from_del` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`)
);

CREATE TABLE `phpwcms_newsletter` (
  `newsletter_id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `newsletter_lastsending` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `newsletter_subject` text NOT NULL,
  `newsletter_changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `newsletter_vars` mediumblob NOT NULL,
  `newsletter_trashed` int(1) NOT NULL DEFAULT '0',
  `newsletter_active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`newsletter_id`)
);

CREATE TABLE `phpwcms_newsletterqueue` (
  `queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `queue_changed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `queue_status` int(11) NOT NULL DEFAULT '0',
  `queue_pid` int(11) NOT NULL DEFAULT '0',
  `queue_rid` int(11) NOT NULL DEFAULT '0',
  `queue_errormsg` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`queue_id`),
  KEY `nlqueue` (`queue_pid`,`queue_status`)
);

CREATE TABLE `phpwcms_pagelayout` (
  `pagelayout_id` int(11) NOT NULL AUTO_INCREMENT,
  `pagelayout_name` varchar(255) NOT NULL DEFAULT '',
  `pagelayout_default` int(1) NOT NULL DEFAULT '0',
  `pagelayout_var` mediumblob NOT NULL,
  `pagelayout_trash` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pagelayout_id`)
);

CREATE TABLE `phpwcms_profession` (
  `prof_id` int(4) NOT NULL AUTO_INCREMENT,
  `prof_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`prof_id`)
);

CREATE TABLE `phpwcms_redirect` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `aid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `views` bigint(20) unsigned NOT NULL DEFAULT '0',
  `active` int(1) unsigned NOT NULL DEFAULT '0',
  `shortcut` int(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `target` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `id` (`id`,`aid`,`alias`),
  KEY `active` (`active`),
  KEY `link` (`link`)
);

CREATE TABLE `phpwcms_shop_orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) NOT NULL DEFAULT '',
  `order_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_name` varchar(255) NOT NULL DEFAULT '',
  `order_firstname` varchar(255) NOT NULL DEFAULT '',
  `order_email` varchar(255) NOT NULL DEFAULT '',
  `order_net` float NOT NULL DEFAULT '0',
  `order_gross` float NOT NULL DEFAULT '0',
  `order_payment` varchar(255) NOT NULL DEFAULT '',
  `order_data` mediumtext NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `order_number` (`order_number`,`order_status`)
);

CREATE TABLE `phpwcms_shop_products` (
  `shopprod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopprod_createdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shopprod_changedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shopprod_status` int(1) unsigned NOT NULL DEFAULT '0',
  `shopprod_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `shopprod_ordernumber` varchar(255) NOT NULL DEFAULT '',
  `shopprod_model` varchar(255) NOT NULL DEFAULT '',
  `shopprod_name1` varchar(255) NOT NULL DEFAULT '',
  `shopprod_name2` varchar(255) NOT NULL DEFAULT '',
  `shopprod_tag` varchar(255) NOT NULL DEFAULT '',
  `shopprod_vat` float unsigned NOT NULL DEFAULT '0',
  `shopprod_netgross` int(1) unsigned NOT NULL DEFAULT '0',
  `shopprod_price` float NOT NULL DEFAULT '0',
  `shopprod_maxrebate` float NOT NULL DEFAULT '0',
  `shopprod_description0` text NOT NULL,
  `shopprod_description1` text NOT NULL,
  `shopprod_description2` text NOT NULL,
  `shopprod_description3` text NOT NULL,
  `shopprod_var` mediumtext NOT NULL,
  `shopprod_category` varchar(255) NOT NULL DEFAULT '',
  `shopprod_weight` float NOT NULL DEFAULT '0',
  `shopprod_color` varchar(255) NOT NULL DEFAULT '',
  `shopprod_size` varchar(255) NOT NULL DEFAULT '',
  `shopprod_listall` int(1) unsigned DEFAULT '0',
  `shopprod_special_price` text NOT NULL,
  `shopprod_track_view` int(11) NOT NULL DEFAULT '0',
  `shopprod_lang` varchar(255) NOT NULL DEFAULT '',
  `shopprod_overwrite_meta` int(1) NOT NULL DEFAULT '1',
  `shopprod_opengraph` int(1) unsigned NOT NULL DEFAULT '1',
  `shopprod_unit` varchar(100) NOT NULL DEFAULT '',
  `shopprod_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shopprod_id`),
  KEY `shopprod_status` (`shopprod_status`),
  KEY `category` (`shopprod_category`),
  KEY `tag` (`shopprod_tag`),
  KEY `all` (`shopprod_listall`),
  KEY `shopprod_track_view` (`shopprod_track_view`),
  KEY `shopprod_lang` (`shopprod_lang`),
  KEY `shopprod_opengraph` (`shopprod_opengraph`)
);

CREATE TABLE `phpwcms_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_name` text NOT NULL,
  `subscription_info` blob NOT NULL,
  `subscription_active` int(1) NOT NULL DEFAULT '0',
  `subscription_lang` varchar(100) NOT NULL DEFAULT '',
  `subscription_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscription_id`)
);

CREATE TABLE `phpwcms_sysvalue` (
  `sysvalue_key` varchar(255) NOT NULL DEFAULT '',
  `sysvalue_group` varchar(255) NOT NULL DEFAULT '',
  `sysvalue_lastchange` int(11) NOT NULL DEFAULT '0',
  `sysvalue_status` int(1) NOT NULL DEFAULT '0',
  `sysvalue_vartype` varchar(255) NOT NULL DEFAULT '',
  `sysvalue_value` mediumtext NOT NULL,
  PRIMARY KEY (`sysvalue_key`),
  KEY `sysvalue_group` (`sysvalue_group`),
  KEY `sysvalue_status` (`sysvalue_status`)
);

CREATE TABLE `phpwcms_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_type` int(11) NOT NULL DEFAULT '1',
  `template_name` varchar(255) NOT NULL DEFAULT '',
  `template_default` int(1) NOT NULL DEFAULT '0',
  `template_var` mediumblob NOT NULL,
  `template_trash` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`)
);

CREATE TABLE `phpwcms_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_login` varchar(30) NOT NULL DEFAULT '',
  `usr_pass` varchar(255) NOT NULL DEFAULT '',
  `usr_email` varchar(150) NOT NULL DEFAULT '',
  `usr_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usr_rechte` tinyint(4) NOT NULL DEFAULT '0',
  `usr_admin` tinyint(1) NOT NULL DEFAULT '0',
  `usr_avatar` varchar(50) NOT NULL DEFAULT '',
  `usr_aktiv` int(1) NOT NULL DEFAULT '0',
  `usr_name` varchar(100) NOT NULL DEFAULT '',
  `usr_var_structure` blob NOT NULL,
  `usr_var_publicfile` blob NOT NULL,
  `usr_var_privatefile` blob NOT NULL,
  `usr_lang` varchar(50) NOT NULL DEFAULT '',
  `usr_wysiwyg` int(2) NOT NULL DEFAULT '0',
  `usr_fe` int(1) NOT NULL DEFAULT '0',
  `usr_vars` mediumtext NOT NULL,
  PRIMARY KEY (`usr_id`)
);

CREATE TABLE `phpwcms_userdetail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_regkey` varchar(255) NOT NULL DEFAULT '',
  `detail_pid` int(11) NOT NULL DEFAULT '0',
  `detail_formid` int(11) NOT NULL DEFAULT '0',
  `detail_tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `detail_title` varchar(255) NOT NULL DEFAULT '',
  `detail_salutation` varchar(255) NOT NULL DEFAULT '',
  `detail_firstname` varchar(255) NOT NULL DEFAULT '',
  `detail_lastname` varchar(255) NOT NULL DEFAULT '',
  `detail_company` varchar(255) NOT NULL DEFAULT '',
  `detail_street` varchar(255) NOT NULL DEFAULT '',
  `detail_add` varchar(255) NOT NULL DEFAULT '',
  `detail_city` varchar(255) NOT NULL DEFAULT '',
  `detail_zip` varchar(255) NOT NULL DEFAULT '',
  `detail_region` varchar(255) NOT NULL DEFAULT '',
  `detail_country` varchar(255) NOT NULL DEFAULT '',
  `detail_fon` varchar(255) NOT NULL DEFAULT '',
  `detail_fax` varchar(255) NOT NULL DEFAULT '',
  `detail_mobile` varchar(255) NOT NULL DEFAULT '',
  `detail_signature` varchar(255) NOT NULL DEFAULT '',
  `detail_prof` varchar(255) NOT NULL DEFAULT '',
  `detail_notes` blob NOT NULL,
  `detail_public` int(1) NOT NULL DEFAULT '1',
  `detail_aktiv` int(1) NOT NULL DEFAULT '1',
  `detail_newsletter` int(11) NOT NULL DEFAULT '0',
  `detail_website` varchar(255) NOT NULL DEFAULT '',
  `detail_userimage` varchar(255) NOT NULL DEFAULT '',
  `detail_gender` varchar(255) NOT NULL DEFAULT '',
  `detail_birthday` date NOT NULL DEFAULT '0000-00-00',
  `detail_varchar1` varchar(255) NOT NULL DEFAULT '',
  `detail_varchar2` varchar(255) NOT NULL DEFAULT '',
  `detail_varchar3` varchar(255) NOT NULL DEFAULT '',
  `detail_varchar4` varchar(255) NOT NULL DEFAULT '',
  `detail_varchar5` varchar(255) NOT NULL DEFAULT '',
  `detail_text1` text NOT NULL,
  `detail_text2` text NOT NULL,
  `detail_text3` text NOT NULL,
  `detail_text4` text NOT NULL,
  `detail_text5` text NOT NULL,
  `detail_email` varchar(255) NOT NULL DEFAULT '',
  `detail_login` varchar(255) NOT NULL DEFAULT '',
  `detail_password` varchar(255) NOT NULL DEFAULT '',
  `userdetail_lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `detail_int1` bigint(20) NOT NULL DEFAULT '0',
  `detail_int2` bigint(20) NOT NULL DEFAULT '0',
  `detail_int3` bigint(20) NOT NULL DEFAULT '0',
  `detail_int4` bigint(20) NOT NULL DEFAULT '0',
  `detail_int5` bigint(20) NOT NULL DEFAULT '0',
  `detail_float1` double NOT NULL DEFAULT '0',
  `detail_float2` double NOT NULL DEFAULT '0',
  `detail_float3` double NOT NULL DEFAULT '0',
  `detail_float4` double NOT NULL DEFAULT '0',
  `detail_float5` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`detail_id`),
  KEY `detail_pid` (`detail_pid`),
  KEY `detail_formid` (`detail_formid`),
  KEY `detail_password` (`detail_password`),
  KEY `detail_aktiv` (`detail_aktiv`),
  KEY `detail_regkey` (`detail_regkey`)
);

CREATE TABLE `phpwcms_usergroup` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(200) NOT NULL DEFAULT '',
  `group_member` mediumtext NOT NULL,
  `group_value` longblob NOT NULL,
  `group_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `group_trash` int(1) NOT NULL DEFAULT '0',
  `group_active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `group_member` (`group_member`(255))
);

CREATE TABLE `phpwcms_userlog` (
  `userlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `logged_user` varchar(30) NOT NULL DEFAULT '',
  `logged_username` varchar(100) NOT NULL DEFAULT '',
  `logged_start` int(11) unsigned NOT NULL DEFAULT '0',
  `logged_change` int(11) unsigned NOT NULL DEFAULT '0',
  `logged_in` int(1) NOT NULL DEFAULT '0',
  `logged_ip` varchar(24) NOT NULL DEFAULT '',
  `logged_section` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userlog_id`)
);