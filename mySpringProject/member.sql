/*
 
 --m_idx�Ϸù�ȣ ����
create sequence seq_member_m_idx

 --���̺� ����
 create table member
 (
 m_idx		int,					--ȸ����ȣ
 m_name		varchar2(200) not null,	--ȸ�� �̸�
 m_id		varchar2(200) not null,	--ȸ�� ���̵�
 m_pwd 		varchar2(200) not null,	--ȸ�� ��й�ȣ
 m_text		varchar2(500) 		  ,	--ȸ�� ������
 m_grade	varchar2(200)		  , --ȸ�� ����(�Ϲ�/������)
 m_image	varchar2(200)		  , --ȸ�� ������ �̹���
 m_mail 	varchar2(200),			--ȸ�� �̸���
 m_ip		varchar2(200),			--ȸ�� ������
 m_point 	int			 ,			--ȸ�� ����Ʈ
 m_regdate	date					--ȸ�� ������
 )
 
 ------------
 ���� ��ɾ�
 ------------
 drop table member cascade constraints;
 
 
 --�⺻Ű ����
 alter table member
 	add constraint pk_member_idx primary key(m_idx);
 	
 --�ߺ����� unique����
 alter table member
 	add constraint unique_member_id unique(m_id);
 
--����
 update member set m_image = 'user0.jpg'
 	where m_idx=1;

--�׽�Ʈ�� ������ ����
	insert into member values((select nvl(max(m_idx),0) + 1 from member),
		     		'�����',
		     		'admin',
		     		'1234',
		     		 null,
		     		'������',
		     		'user0.jpg',
		     		'admin@gmail.com',
		     		'192.0.0.1',
		     		0,
		     		sysdate
		     		) 		 
 				
 --ȸ�� Ȯ�� 
 select * from member
 
 delete from member
 * 
 */