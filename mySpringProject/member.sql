/*
 
 --m_idx일련번호 생성
create sequence seq_member_m_idx

 --테이블 생성
 create table member
 (
 m_idx		int,					--회원번호
 m_name		varchar2(200) not null,	--회원 이름
 m_id		varchar2(200) not null,	--회원 아이디
 m_pwd 		varchar2(200) not null,	--회원 비밀번호
 m_text		varchar2(500) 		  ,	--회원 프로필
 m_grade	varchar2(200)		  , --회원 구분(일반/관리자)
 m_image	varchar2(200)		  , --회원 프로필 이미지
 m_mail 	varchar2(200),			--회원 이메일
 m_ip		varchar2(200),			--회원 아이피
 m_point 	int			 ,			--회원 포인트
 m_regdate	date					--회원 가입일
 )
 
 ------------
 삭제 명령어
 ------------
 drop table member cascade constraints;
 
 
 --기본키 설정
 alter table member
 	add constraint pk_member_idx primary key(m_idx);
 	
 --중복방지 unique설정
 alter table member
 	add constraint unique_member_id unique(m_id);
 
--수정
 update member set m_image = 'user0.jpg'
 	where m_idx=1;

--테스트용 관리자 생성
	insert into member values((select nvl(max(m_idx),0) + 1 from member),
		     		'김관리',
		     		'admin',
		     		'1234',
		     		 null,
		     		'관리자',
		     		'user0.jpg',
		     		'admin@gmail.com',
		     		'192.0.0.1',
		     		0,
		     		sysdate
		     		) 		 
 				
 --회원 확인 
 select * from member
 
 delete from member
 * 
 */