CREATE DATABASE IF NOT EXISTS RestaurantMenu CHARACTER SET utf8;
USE RestaurantMenu;
CREATE TABLE IF NOT EXISTS Users(
	UID INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UName VARCHAR(15) NOT NULL, 
    UPassword CHAR(32) NOT NULL, 
    URegDate DATE DEFAULT "2019-12-12",
    URole BOOL DEFAULT TRUE, 	-- 1: User	0: Admin
    USex BOOL DEFAULT TRUE		-- 1: Man	0: Woman
);
CREATE TABLE IF NOT EXISTS Dish(
	DID INT AUTO_INCREMENT PRIMARY KEY, 
    DName VARCHAR(20), 
    DPicPath VARCHAR(255), 
    DKind BOOL DEFAULT TRUE, 	-- 1: RAW	0: VEG
    DPrice DOUBLE
);
CREATE TABLE IF NOT EXISTS OrderForm(
	OID INT AUTO_INCREMENT PRIMARY KEY, 
    UID INT NOT NULL, 
    OTime DATETIME,
    OPrice DOUBLE NOT NULL, 
    FOREIGN KEY(UID) REFERENCES Users(UID)
);
CREATE TABLE IF NOT EXISTS OrderDetail(
	ODID INT PRIMARY KEY AUTO_INCREMENT,  -- 主键
	OID INT,                   			-- 外键：引入的是订单表的主键
	DID INT,                   			-- 外键：引用的是菜信息表的主键
    DCount INT,                       	-- 菜的数量
	FOREIGN KEY(OID) REFERENCES OrderForm(OID),
    FOREIGN KEY(DID) REFERENCES Dish(DID)
);
INSERT INTO Users VALUE(NULL, 'admin', MD5('admin'), '2019-12-10', false, true);
INSERT INTO Users VALUE(NULL, 'liboyan', MD5('1123'), '2019-12-24', true, true)
INSERT INTO Dish VALUE(NULL, "Test", "image/test.jpg", true, 12.0);
INSERT INTO Dish VALUE(NULL, "西红柿炒鸡蛋", "image/xhscjd.jpg", false, 15.0);
INSERT INTO Dish VALUE(NULL, "200", "images/200x200.png", false, 11.0);
INSERT INTO OrderForm Value(NULL, 1, NOW(), 0);