insert into user(host, user, password, ssl_cipher, x509_issuer, x509_subject)
values('localhost', 'multi', password('media'),'','','');

flush privileges;