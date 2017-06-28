/* Create table pharmacist_info and configure it. */
DROP TABLE pharmacist_info;
CREATE TABLE pharmacist_info
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	user_id int unsigned NOT NULL,
	name varchar(50) NOT NULL,
	street varchar(80) NOT NULL,
	postcode varchar(10),
	suburb varchar(30),
	phone varchar(30),
	PRIMARY KEY (id)
);
INSERT INTO pharmacist_info (user_id,name,street,postcode,suburb,phone)
VALUES
	('1','Hospital Hill Pharmacy','338 Crown St','2500','Wollongong','(02) 4229 5868'),
	('2','Wollongong City Pharmacy','237 Crown St','2500','Wollongong','(02) 4229 5724'),
	('3','Harrison''s Pharmacy Wollongong','132 Crown St','2500','Wollongong','(02) 4229 1622'),
	('4','Downtown MediAdvice Pharmacy','60 Crown St','2500','Wollongong','(02) 4229 1025');

/* Create table drug and configure it. */
DROP TABLE drugs;
CREATE TABLE drugs
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	serial varchar(20) NOT NULL,
	producer varchar(50) NOT NULL,
	package varchar(30) NOT NULL,
	price numeric(15,2),
	type int(1) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO drugs
	(name, serial, producer, package, price, type)
VALUES 
	('Herceptin','L01XC03','Roche','100 tablets','500.00', '1'),
	('Sorafenib','L01XE05','Bayer','200 capsules','800.00', '1'),
  ('Glivec','L01XE01','Novartis','80 capsules','730.00', '1'),
  ('Iressa','L01XE02','AstraZeneca','160 tablets','480.00', '1');
    
/* Create table orders and configure it. */
DROP TABLE orders;
CREATE TABLE orders
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	order_id varchar(12) NOT NULL,
	prescription_id int NOT NULL,
	phar_id int NOT NULL,
	order_time DATETIME NOT NULL,
	pick_time DATE,
	status int(1) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO orders (order_id, prescription_id, phar_id, order_time, status)
VALUES
	('201610061023','1','2',STR_TO_DATE('10-06-2016 00:00:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610071012','2','1',STR_TO_DATE('10-07-2016 00:00:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610071023','2','2',STR_TO_DATE('10-07-2016 10:23:00','%m-%d-%Y %H:%i:%s'), 1),
  ('201610071031','1','2',STR_TO_DATE('10-07-2016 10:31:00','%m-%d-%Y %H:%i:%s'), 1),
  ('201610081017','3','1',STR_TO_DATE('10-08-2016 10:17:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610081180','1','4',STR_TO_DATE('10-08-2016 11:08:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610081753','2','2',STR_TO_DATE('10-08-2016 17:53:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610081943','1','3',STR_TO_DATE('10-08-2016 19:43:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610090902','2','3',STR_TO_DATE('10-09-2016 09:02:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610091017','2','2',STR_TO_DATE('10-09-2016 10:17:00','%m-%d-%Y %H:%i:%s'), 0),
  ('201610091133','1','1',STR_TO_DATE('10-09-2016 11:33:00','%m-%d-%Y %H:%i:%s'), 0);

/* Create table order_detail and configure it. */
DROP TABLE order_detail;
CREATE TABLE order_detail
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	order_id varchar(12) NOT NULL,
	drug_id int NOT NULL,
	value int NOT NULL,
  status int(1) NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO order_detail
(order_id, drug_id, value, status)
VALUES
	('201610061023','1','2',0),
	('201610061023','2','1',0);


/* Create table stocks and configure it. */
DROP TABLE stocks;
CREATE TABLE stocks
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	phar_id int NOT NULL,
	drug_id int NOT NULL,
	stock int NOT NULL,
	PRIMARY KEY (id)
);
INSERT INTO stocks
	(phar_id, drug_id, stock)
VALUES 
	('1','1','20'),
	('1','2','15');