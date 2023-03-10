use bookstore ;
create table book (
book_id int(11) not null auto_increment ,
title varchar(128) not null,
author varchar(45) not null,
price float not null,
primary key (book_id),
unique key book_id_unique (book_id),
unique key title_unique (title)
) ENGINE = innoDB auto_increment=11 default CHARSET = latin1;

insert into book (title, author, price) values ('Mysql for dummies', 'Moi&lui', 12.50);
