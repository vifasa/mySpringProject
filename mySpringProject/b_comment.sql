/*
	--일련번호
	create sequence seq_b_comment_c_idx
	
	--테이블
	create table b_comment
	(
		c_idx					int,				--일련번호
		m_idx					int,				--회원번호
		m_id		  varchar2(200),				--회원 아이디
		m_name		  varchar2(200),				--회원 이름
		b_idx					int,				--개시글 목록
		c_content	 varchar2(2000),				--내용
		c_pwd		 varchar2(200) ,				--비밀번호
		c_like					int,				--좋아요
		c_hate					int, 				--싫어요
		c_regdate  	           date,				--등록일자
		c_use_yn			char(1) default 'y'		--사용우뮤
		c_ip	   			varchar2(200),			--아이피
		m_image				varchar2(200)			--유저 이미지
	) 
	
	--------
	drop table b_comment
	--------
 
 	delete from b_comment
 
 	--기본키 
 	alter table b_comment
 		add constraint pk_b_comment_c_idx primary key(c_idx);
 	
 	--외래키(m_idx)
 	alter table b_comment
 		add constraint fk_b_comment_m_idx foreign key(m_idx)
 									references member(m_idx);
 									
 	--외래키(b_idx)
 	alter table b_comment
 		add constraint fk_b_comment_b_idx foreign key(b_idx)
 									 references board(b_idx);
 	
 	--ip추가
	alter table b_comment add c_ip varchar(200);
	
	--m_image추가
	alter table b_comment add m_image varchar(200);
	
	select * from b_comment
	
	delete from b_comment;
*/