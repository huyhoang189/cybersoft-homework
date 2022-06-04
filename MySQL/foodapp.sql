create database foodapp;
use foodapp;

create table users (
	id int not null auto_increment,
	username varchar(50),
    password varchar(28),
    fullname nvarchar(50),
    type_login varchar(50)
); 

create table profiles (
	user_id int not null,
    state nvarchar(100),
    adress nvarchar(100),
    phone_number varchar(12),
    city nvarchar(100)
);

create table reviews (
	id int not null auto_increment,
    rating float,
    comment text,
    user_id int not null,
    restaurent_id int not null
);

create table restaurents (
	id int not null auto_increment,
    name nvarchar(100),
    adress nvarchar(200),
	url_image text
);

create table categorys (
	id int not null auto_increment,
    name nvarchar(100),
    url_image text
);

create table menus (
	id int not null auto_increment,
	name nvarchar(100),
    rating float,
    price varchar(12),
    description text,
    url_image text,
    restaurent_id int not null,
    category_id int not null
);

create table promos (
	id int not null auto_increment,
    name nvarchar(100),
    discount float,
    expried_date datetime
);

create table promoDetail (
	id int not null auto_increment,
    memu_id int not null,
    promo_id int not null
);

create table status (
	id int not null auto_increment,
    name text
);

create table orders(
	id int not null auto_increment,
    start_date datetime,
    end_date datetime,
    status_id int not null,
    user_id int not null
);

create table orderDetail (
	id int not null auto_increment,
    order_id int not null,
    menu_id int not null
);

create table subMenu (
	id int not null auto_increment,
	url_image text,
    name varchar(100),
    price varchar(12),
     restaurent_id int not null
);

create table menuDetail (
	id int not null auto_increment,
    menu_id int not null,
    sub_menu int not null
);


alter table profiles add foreign key (user_id) references users (id);

alter table menus add foreign key (category_id) references categorys (id);

alter table menuDetail add foreign key (menu_id) references menus (id);

alter table orders add foreign key (status_id) references status (id);

alter table orders add foreign key (user_id) references users (id);

alter table orderDetail add foreign key (order_id) references orders (id);

alter table orderDetail add foreign key (menu_id) references menus (id);

alter table promoDetail add foreign key (memu_id) references menus (id);

alter table promoDetail add foreign key (promo_id) references promos (id);

alter table subMenu add foreign key (restaurent_id) references restaurents (id);

alter table menuDetail add foreign key (sub_menu) references subMenu (id);

alter table reviews add foreign key (user_id) references users (id);

alter table reviews add foreign key (restaurent_id) references restaurents (id);

alter table menus add foreign key (restaurent_id) references restaurents (id);


