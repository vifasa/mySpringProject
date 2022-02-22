/*
--게시판 일련번호
create sequence seq_board_b_idx

--테이블 생성
create table board
(
	b_idx		int,					 --게시글 번호
	ca_idx		int,					 --게시글 카테고리
	b_title 	varchar2(500) not null,	 --게시글 제목
	b_content 	clob		  not null,	 --게시글 내용
	b_ip		varchar2(200),			 --게시글 아이피
	b_like		int,					 --게시글 좋아요
	b_hate  	int,					 --게시글 싫어요
	m_idx		int,					 --맴버 번호	
	b_pwd		varchar2(200) ,  		 --게시글 비밀번호
	b_readhit	int			  default 0, --게시글 조회수
	b_regdate	date,					 --게시글 등록일자
	b_use_yn	char(1) 	 default 'y',--게시글 사용유무
	m_name		varchar2(200) ,			 --맴버 이름
	m_image		varchar2(200)			 --맴버 이미지
)

---------
테이블 삭제
---------
drop table board cascade constraints;

--기본키
alter table board
	add constraint pk_board_b_idx primary key (b_idx);

--외래키(m_idx)
alter table board
	add constraint fk_board_m_idx foreign key(m_idx)
								  references  member(m_idx);	

--외래키(ca_idx)
alter table board
	add constraint fk_board_ca_idx foreign key(ca_idx)
								  references  category(ca_idx);
--외래키(ca_idx)삭제
alter table board
	drop constraint fk_board_ca_idx

--맴버 이름 추가(컬럼)
alter table board add m_name varchar(200);

--맴버 이미지 추가(컬럼)
alter table board add m_image varchar(200);

select * from board

delete from board

*/