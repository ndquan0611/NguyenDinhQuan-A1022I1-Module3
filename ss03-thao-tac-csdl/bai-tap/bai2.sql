create database thaotaccsdl_2;
use thaotaccsdl_2;
create table Customer(
	Customer_ID int auto_increment primary key,
    Customer_Name varchar(25),
    Customer_Age tinyint
);

create table `Order`(
	Order_ID int auto_increment primary key, 
    Customer_ID int, 
	Order_Date datetime,
    Order_TotalPrice int,
    constraint FK_O_Customer_ID foreign key (Customer_ID) references Customer(Customer_ID)
);

create table Product(
	Product_ID int auto_increment primary key,
    Product_Name varchar(25),
    Product_Price int
);

create table OrderDetail(
	Order_ID int,
    Product_ID int,
    OrderDetail_QTY int,
    primary key (Order_ID, Product_ID),
    constraint FK_OD_Order_ID foreign key (Order_ID) references `Order`(Order_ID),
    constraint FK_OD_Product_ID foreign key (Product_ID) references Product(Product_ID)
);

insert into Customer(Customer_Name, Customer_Age)
values 	('Minh Quan', 10),
		('Ngoc Oanh', 20),
		('Hong Ha', 50);
        
insert into `Order`(Customer_ID, Order_Date, Order_TotalPrice)
values	(1, '2006-03-21', null),
		(2, '2006-03-23', null),
		(1, '2006-03-16', null);

insert into Product(Product_Name, Product_Price)
values	('May Giat', 3),
		('Tu Lanh', 5),
        ('Dieu Hoa', 7),
        ('Quat', 1),
        ('Bep Dien', 2);

insert into OrderDetail 
values 	(1, 1, 3),
		(1, 3, 7),
        (1, 4, 2),
        (2, 1, 1),
        (3, 1, 8),
        (2, 5, 4),
        (2, 3, 3);

select * from Customer;
select * from `Order`;
select * from Product;
select * from OrderDetail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select Order_ID, Order_Date, Order_TotalPrice from `Order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select C.Customer_Name, P.Product_Name from `Order` O 
inner join Customer C on O.Customer_ID = C.Customer_ID
inner join OrderDetail OD on OD.Order_ID = O.Order_ID
inner join Product P on OD.Product_ID = P.Product_ID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from Customer C left join `Order` O on C.Customer_ID = O.Customer_ID where Order_ID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select O.Order_ID, O.Order_Date, sum(P.Product_Price * OD.OrderDetail_QTY) total from `Order` O
join OrderDetail OD on O.Order_ID = OD.Order_ID 
join Product P on OD.Product_ID = P.Product_ID
group by O.Order_ID;