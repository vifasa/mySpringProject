/*

 --�Ϸù�ȣ
 create sequence seq_category_ca_idx
	
 --���̺� ����
 create table category
 (
 	ca_idx				  int,		    --ī�װ� ��ȣ
 	ca_name		varchar2(500) not null, --ī�װ� �̸�
 	ca_image	varchar2(500), --ī�װ� ����
 	ca_text		varchar2(500) --ī�װ� ����
 )
 
 ----
 ����
 ----
 drop table category cascade constraints;
 
 --�⺻Ű ����
	alter table category
		add constraint pk_category_ca_idx primary key(ca_idx);
	
	delete from category
	
 --������ Ȯ��
 	select * from category;
*/