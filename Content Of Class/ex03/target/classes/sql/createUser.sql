/*  admin 유저로 접속*/
connect sys as sysdba

/*  계정 생성*/
create user book_ex indetified by book_ex
default tablespace users
temporary tablespace temp
quota unlimited on users;

/* 권한 부여*/
grant dba to book_ex