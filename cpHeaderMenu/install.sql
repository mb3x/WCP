DROP TABLE IF EXISTS wcf1_page_menu_item;
CREATE TABLE wcf1_page_menu_item (
	menuItemID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	packageID INT(10) NOT NULL DEFAULT 0,
	menuItem VARCHAR(255) NOT NULL DEFAULT '',
	menuItemLink VARCHAR(255) NOT NULL DEFAULT '',
	menuItemIconS VARCHAR(255) NOT NULL DEFAULT '',	
	menuItemIconM VARCHAR(255) NOT NULL DEFAULT '',
	menuPosition ENUM('header', 'footer') NOT NULL DEFAULT 'header',
	parentMenuItem VARCHAR( 255 ) NOT NULL DEFAULT '',
	showOrder INT(10) NOT NULL DEFAULT 0,
	permissions TEXT NULL,
	groupIDs TEXT NULL,
	options TEXT NULL,
	native TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '1',
	isDisabled TINYINT(1) NOT NULL DEFAULT 0,
	UNIQUE KEY (packageID, menuItem)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;