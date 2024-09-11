
create Table role (
	Id serial primary key not null,
	Name varchar(50)
)

create Table Account (
	Id serial primary key not null,
	Name varchar(100),
	BirthDay date,
	Email varchar(100),
	PhoneNumber varchar(100),
	Password varchar(100),
	Avatar text,
	Status bit(1),
	RoleId integer,
	CONSTRAINT fk_RoleAccount FOREIGN KEY (RoleId) REFERENCES Role(Id)
)

create table Address (
	Id serial primary key not null,
	Ward varchar(100),
	District varchar(100),
	City varchar(100),
	SpecificAddress text,
	Status bit(1),
	CustomerName varchar(100),
	PhoneNumber varchar(100),
	AccountId integer,
	CONSTRAINT fk_AccountAddress FOREIGN KEY (AccountId) REFERENCES Account(Id)
)

create Table Product (
	Id serial primary key not null,
	Name varchar(100),
	Description text,
	Status bit(1)
)

create table ProductDetail (
	Id serial primary key not null,
	Code varchar(100),
	Quantity integer,
	Price money,
	Status bit(1),
	ProductId integer,
	CONSTRAINT fk_ProductProductDetail FOREIGN KEY (ProductId) REFERENCES Product(Id)
)

create table Cart (
	Id serial primary key not null,
	TotalPrice money,
	TotalItems integer,
	AccountId integer,
	CONSTRAINT fk_AccountCart FOREIGN KEY (AccountId) REFERENCES Account(Id)
)

create table CartDetail (
	Id serial primary key not null,
	Quantity integer,
	Price money,
	CartId integer,
	ProductDetailId integer,
	CONSTRAINT fk_ProductDetailCartDetail FOREIGN KEY (ProductDetailId) REFERENCES ProductDetail(Id),
	CONSTRAINT fk_CartCartDetail FOREIGN KEY (CartId) REFERENCES Cart(Id)
)

create table Bill (
	Id serial primary key not null,
	CustomerName varchar(100),
	Address varchar(100),
	PhoneNumber varchar(100),
	TextNote text,
	OrderDate TIMESTAMP,
    ConfirmDate TIMESTAMP,
    CompletionDate TIMESTAMP,
    Status integer,
    TotalPrice money,
    CreateDate TIMESTAMP,
    UpdateDate TIMESTAMP,
    Price money,
    AccountId integer,
    CONSTRAINT fk_AccountBill FOREIGN KEY (AccountId) REFERENCES Account(Id)
)

create table BillDetail (
	Id serial primary key not null,
	Quantity integer,
	Price money,
    Status bit(1),
    BillId integer,
    ProductDetailId integer,
    CONSTRAINT fk_BillBillDetail FOREIGN KEY (BillId) references Bill(Id),
    CONSTRAINT fk_ProductDetailBillDetail FOREIGN KEY (ProductDetailId) REFERENCES ProductDetail(Id)
)



-- Dummy data SQL
select * from role
insert into role (name) values ('Admin');
insert into role (name) values ('Employee');
insert into role (name) values ('User');

select * from account
insert into account (name, birthday, email, phoneNumber, password, avatar, status, roleid)
values ('Tùng', '09-06-2003', 'tung@vti.com.vn', '0987654321', '123456', 'avatar1', B'1', 1);
insert into account (name, birthday, email, phoneNumber, password, avatar, status, roleid)
values ('Hoàng', '09-06-2003', 'hoang@vti.com.vn', '0987654321', '123456', 'avatar1', B'1', 2);
insert into account (name, birthday, email, phoneNumber, password, avatar, status, roleid)
values ('Long', '09-06-2003', 'long@vti.com.vn', '0987654321', '123456', 'avatar1', B'0', 3);


select * from address
insert into address (ward, district, city, specificAddress, status, customerName, phoneNumber, accountId)
values ('Quốc Tuấn', 'Kiến Xương', 'Thái Bình', 'Thụy Lũng Nam', B'1', 'Dương', '273817320', 1);

select * from product
insert into product (name, description, status)
values ('Product 1', 'Description 1', B'1');
insert into product (name, description, status)
values ('Product 2', 'Description 2', B'1');
insert into product (name, description, status)
values ('Product 3', 'Description 3', B'1');
insert into product (name, description, status)
values ('Product 4', 'Description 4', B'1');


select * from productDetail
insert into productDetail (code, quantity, price, status, productId)
values ('PD1', 300, 1000, B'1', 1);
insert into productDetail (code, quantity, price, status, productId)
values ('PD2', 400, 1000, B'1', 1);
insert into productDetail (code, quantity, price, status, productId)
values ('PD3', 340, 1000, B'1', 2);
insert into productDetail (code, quantity, price, status, productId)
values ('PD4', 500, 2000, B'1', 2);
insert into productDetail (code, quantity, price, status, productId)
values ('PD5', 300, 3000, B'1', 3);
insert into productDetail (code, quantity, price, status, productId)
values ('PD6', 300, 4000, B'1', 3);
insert into productDetail (code, quantity, price, status, productId)
values ('PD7', 300, 5000, B'1', 4);
insert into productDetail (code, quantity, price, status, productId)
values ('PD8', 300, 6000, B'1', 4);

select * from bill
insert into bill (customerName, address, phoneNumber, textNote, orderDate, confirmDate, completionDate, status, totalPrice, createDate, updateDate, accountId)
values ('bill 1', 'Thái bình', '023489231', 'note 1', '01-01-2024', '02-01-2024', '03-01-2024', 1, 100000, '01-01-2024', '01-01-2024', 1);
insert into bill (customerName, address, phoneNumber, textNote, orderDate, confirmDate, completionDate, status, totalPrice, createDate, updateDate, accountId)
values ('bill 2', 'Phú Thọ', '023489231', 'note 1', '01-01-2024', '02-01-2024', '03-01-2024', 1, 230000, '01-01-2024', '01-01-2024', 1);
insert into bill (customerName, address, phoneNumber, textNote, orderDate, confirmDate, completionDate, status, totalPrice, createDate, updateDate, accountId)
values ('bill 3', 'Ninh Bình', '023489231', 'note 1', '01-01-2024', '02-01-2024', '03-01-2024', 1, 50000, '01-01-2024', '01-01-2024', 1);
insert into bill (customerName, address, phoneNumber, textNote, orderDate, confirmDate, completionDate, status, totalPrice, createDate, updateDate, accountId)
values ('bill 4', 'Tuyên Quang', '023489231', 'note 4', '01-01-2024', '02-01-2024', '03-01-2024', 1, 50000, '01-01-2024', '01-01-2024', 1);


select * from billdetail
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 10000, 1, 1);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 20000, 1, 2);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 10000, 2, 3);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 20000, 2, 4);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 30000, 3, 5);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 40000, 3, 6);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 50000, 4, 7);
insert into billdetail (quantity, price, billId, productDetailId)
values (10, 60000, 4, 8);


--Câu lệnh tổng hợp số lượng mặt hàng user mua trong tháng
--Lấy ra tháng chỉ định
select a.id, SUM(bd.quantity) as TongMatHang from account a 
inner join bill b on a.id = b.accountid 
inner join billdetail bd on b.id = bd.billid
where a.id = 1 and b.status = 1 and EXTRACT(MONTH FROM b.completiondate) = 3
group by a.id

--Lấy ra tháng hiện tại
select a.id, SUM(bd.quantity) as TongMatHang from account a 
inner join bill b on a.id = b.accountid 
inner join billdetail bd on b.id = bd.billid
where a.id = 1 and b.status = 1 and EXTRACT(MONTH FROM b.completiondate) = EXTRACT(MONTH FROM CURRENT_DATE)
group by a.id

-- tổng hợp doanh thu của cửa hàng trong tháng
select SUM(b.totalprice) as tongDoanhThu from bill b
inner join billdetail bd on b.id = bd.billid
where b.status = 1 and EXTRACT(MONTH FROM b.completiondate) = 3







