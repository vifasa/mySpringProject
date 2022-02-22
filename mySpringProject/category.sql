/*

 --일련번호
 create sequence seq_category_ca_idx
	
 --테이블 생성
 create table category
 (
 	ca_idx				  int,		    --카테고리 번호
 	ca_name		varchar2(500) not null, --카테고리 이름
 	ca_image	varchar2(500), --카테고리 사진
 	ca_text		varchar2(500) --카테고리 설명
 )
 
 ----
 삭제
 ----
 drop table category cascade constraints;
 
 --기본키 설정
	alter table category
		add constraint pk_category_ca_idx primary key(ca_idx);
	
	delete from category
	
 --데이터 확인
 	select * from category;
*/