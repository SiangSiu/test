show tables;


desc db;

create database gboard;

insert into user(host, user, password, ssl_cipher, x509_issuer, x509_subject)
values('localhost', 'multi', password('media'),'','','');



flush privileges;

delete from user where user='multi';

commit;


delete from db where db='gboard' and user='multi';

rollback;


select * from db;


drop table member;




