create database CSDL;

create table CSDL.customer
(
customerNumber int not null primary key,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFirstName varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
country varchar(50) not null,
postal varchar(15) not null,
creditLimit float
);

create table CSDL.orders
(
orderNumber int not null primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date not null,
status varchar(15) not null,
comments text ,
quantityOrdered int not null,
priceEach float not null,
customer_num INT,
   FOREIGN KEY (customer_num ) REFERENCES CSDL.customer(customerNumber)
);

create table CSDL.payment(
orderNumber int not null,
checkNumber varchar(50) not null,
paymentDate date not null,
amount float not null,
customer_payment int,
foreign key(customer_payment) references CSDL.customer(customerNumber)
);

create table CSDL.orderDetails(
productCode int ,
foreign key(productCode)references customer(customerNumber),
ordernumber int ,
foreign key(ordernumber) references CSDL.orders(orderNumber)
);

create table CSDL.products(
productCode varchar(15) not null primary key,
productName varchar(70) not null,
productScale varchar (10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice float not null,
MSRP float not null,
fk_productLine varchar(50),
foreign key(fk_productLine) references CSDL.productlines(productLine)
);

create table CSDL.productlines(
productLine varchar(50) not null primary key,
textDescription text,
image varchar(500)
);
create table CSDL.employee(
employeeNumber int not null primary key,
lastName varchar(50) not null,
firstName varchar(50) not null,
email varchar(100) not null,
jobTitle varchar(50) not null,
salesRepEmployeeNumber int,
foreign key(salesRepEmployeeNumber)references CSDL.customer(customerNumber),
reportTo int,
foreign key(reportTo) references CSDL.employee(employeeNumber),
fk_officeCode varchar(10),
foreign key(fk_officeCode) references CSDL.offices(officeCode)
);

create table CSDL.offices(
officeCode varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) not null,
state varchar(50) not null,
country varchar(50) not null,
postalCode varchar(15) not null
);