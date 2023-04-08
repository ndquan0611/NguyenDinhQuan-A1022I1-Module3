create database thiet_ke_csdl_2;
use thiet_ke_csdl_2;
create table Customer(
	C_ID int auto_increment primary key,
    C_Name varchar(50) not null,
    C_Age int
);

create table `Order`(
	O_ID int auto_increment primary key,
    C_ID int,
    O_Date date,
    O_TotalPrice int,
    constraint FK_C_ID foreign key (C_ID) references Customer(C_ID)
);

create table Product(
	P_ID int auto_increment primary key,
    P_Name varchar(50) not null,
    P_Price int
);

create table OrderDetail(
	O_ID int,
    P_ID int,
    OD_QTY varchar(50),
    primary key(O_ID, P_ID),
    constraint FK_O_ID foreign key (O_ID) references `Order`(O_ID),
    constraint FK_P_ID foreign key (P_ID) references Product(P_ID)
);

