create table databoard(
id		number primary key,
name		varchar2(10) not null,
password	varchar2(10) not null,
email		varchar2(50),
subject		varchar2(50) not null,
content		VARCHAR2(1000) not null,
inputdate	varchar2(20) not null,
masterid	number default 0,
readcount	number default 0,
replynum	number default 0,
step		number default 0,
filename	varchar2(50),
filesize	number default 0
);