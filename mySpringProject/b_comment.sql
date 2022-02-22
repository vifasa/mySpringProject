/*
	--�Ϸù�ȣ
	create sequence seq_b_comment_c_idx
	
	--���̺�
	create table b_comment
	(
		c_idx					int,				--�Ϸù�ȣ
		m_idx					int,				--ȸ����ȣ
		m_id		  varchar2(200),				--ȸ�� ���̵�
		m_name		  varchar2(200),				--ȸ�� �̸�
		b_idx					int,				--���ñ� ���
		c_content	 varchar2(2000),				--����
		c_pwd		 varchar2(200) ,				--��й�ȣ
		c_like					int,				--���ƿ�
		c_hate					int, 				--�Ⱦ��
		c_regdate  	           date,				--�������
		c_use_yn			char(1) default 'y'		--�����
		c_ip	   			varchar2(200),			--������
		m_image				varchar2(200)			--���� �̹���
	) 
	
	--------
	drop table b_comment
	--------
 
 	delete from b_comment
 
 	--�⺻Ű 
 	alter table b_comment
 		add constraint pk_b_comment_c_idx primary key(c_idx);
 	
 	--�ܷ�Ű(m_idx)
 	alter table b_comment
 		add constraint fk_b_comment_m_idx foreign key(m_idx)
 									references member(m_idx);
 									
 	--�ܷ�Ű(b_idx)
 	alter table b_comment
 		add constraint fk_b_comment_b_idx foreign key(b_idx)
 									 references board(b_idx);
 	
 	--ip�߰�
	alter table b_comment add c_ip varchar(200);
	
	--m_image�߰�
	alter table b_comment add m_image varchar(200);
	
	select * from b_comment
	
	delete from b_comment;
*/