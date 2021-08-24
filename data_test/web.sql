create database web
use web 
go

create table PRODUCT
(
	ID nvarchar (20),
	nameProduct nvarchar(40),
	descriptions nvarchar(100),
	size int,
	color int,
	price float,
	visible int,
	categoryID int
	PRIMARY KEY (ID)
)

create table PRODUCTIMAGES
(
	ID int,
	productID nvarchar(20),
	pathurl nvarchar(100)
	PRIMARY KEY (ID)
)

create table CATEGORY
(
	ID int,
	nameCate nvarchar (40)
	PRIMARY KEY (ID)
)

create table PROMOTION
(
	ID nvarchar (20),
	Percentagee int,
	StartDate datetime,
	EndDate datetime
)

create table ORDERS
(
	ID int,
	userID int,
	created datetime,
	statusOrder int
	PRIMARY KEY (ID)
)

create table ORDERED
(
	ID int,
	quantity int,
	orderID int,
	productID nvarchar(20)
	PRIMARY KEY (ID)
)

create table USERS
(
	ID int,
	email nvarchar(60),
	passwords nvarchar(40),
	Roles int,
	firstName nvarchar(20),
	lastName nvarchar(20),
	phoneNumber nvarchar(20),
	addresss nvarchar(100),
	lastLogin datetime,
	avatarURL nvarchar(100)
	PRIMARY KEY (ID)
)

create table CART
(
	ID int,
	userID int
	PRIMARY KEY (ID)
)

create table PRODUCTINCART
(
	ID int,
	userID int,
	productID nvarchar(20),
	quantity int
	PRIMARY KEY (ID)
)

create table WISHLIST
(
	ID int,
	userID int,
	productID nvarchar(20),
	PRIMARY KEY (ID)
)

alter table PRODUCT add
	constraint FK_PRODUCT_CATEGORY foreign key (categoryID) references CATEGORY (ID)

alter table PRODUCTIMAGES add
	constraint FK_PRODUCTIMAGES_PRODUCT foreign key (productID) references PRODUCT (ID)

alter table ORDERS add
	constraint FK_ORDERS_USERS foreign key (userID) references USERS (ID)

alter table ORDERED add
	constraint FK_ORDERED_ORDERS foreign key (orderID) references ORDERS (ID),
	constraint FK_ORDERED_PRODUCT foreign key (productID) references PRODUCT (ID)

alter table CART add
	constraint FK_CART_USERS foreign key (userID) references USERS (ID)

alter table PRODUCTINCART add
	constraint FK_PRODUCTINCART_USERS foreign key (userID) references USERS (ID),
	constraint FK_PRODUCTINCART_PRODUCT foreign key (productID) references PRODUCT (ID)

alter table WISHLIST add
	constraint FK_WISHLIST_USERS foreign key (userID) references USERS (ID),
	constraint FK_WISHLIST_PRODUCT foreign key (productID) references PRODUCT (ID)


	--ID nvarchar (20),
	--nameProduct nvarchar(40),
	--descriptions nvarchar(100),
	--size int,
	--color int,
	--price float,
	--visible int,
	--categoryID int


INSERT INTO PRODUCT ( ID, nameProduct, descriptions, size, color, price, visible)
VALUES ('19127585', 'Skateboard', 'This product suck', 20, 1, 4.5, 1)

SELECT * FROM PRODUCT