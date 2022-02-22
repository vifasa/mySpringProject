/*
--�Խ��� �Ϸù�ȣ
create sequence seq_board_b_idx

--���̺� ����
create table board
(
	b_idx		int,					 --�Խñ� ��ȣ
	ca_idx		int,					 --�Խñ� ī�װ�
	b_title 	varchar2(500) not null,	 --�Խñ� ����
	b_content 	clob		  not null,	 --�Խñ� ����
	b_ip		varchar2(200),			 --�Խñ� ������
	b_like		int,					 --�Խñ� ���ƿ�
	b_hate  	int,					 --�Խñ� �Ⱦ��
	m_idx		int,					 --�ɹ� ��ȣ	
	b_pwd		varchar2(200) ,  		 --�Խñ� ��й�ȣ
	b_readhit	int			  default 0, --�Խñ� ��ȸ��
	b_regdate	date,					 --�Խñ� �������
	b_use_yn	char(1) 	 default 'y',--�Խñ� �������
	m_name		varchar2(200) ,			 --�ɹ� �̸�
	m_image		varchar2(200)			 --�ɹ� �̹���
)

---------
���̺� ����
---------
drop table board cascade constraints;

--�⺻Ű
alter table board
	add constraint pk_board_b_idx primary key (b_idx);

--�ܷ�Ű(m_idx)
alter table board
	add constraint fk_board_m_idx foreign key(m_idx)
								  references  member(m_idx);	

--�ܷ�Ű(ca_idx)
alter table board
	add constraint fk_board_ca_idx foreign key(ca_idx)
								  references  category(ca_idx);
--�ܷ�Ű(ca_idx)����
alter table board
	drop constraint fk_board_ca_idx

--�ɹ� �̸� �߰�(�÷�)
alter table board add m_name varchar(200);

--�ɹ� �̹��� �߰�(�÷�)
alter table board add m_image varchar(200);

select * from board

delete from board

*/