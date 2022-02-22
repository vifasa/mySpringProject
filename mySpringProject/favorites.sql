/*
	create sequence seq_favorites_f_idx;
	
	create table favorites
	(
		f_idx		int,			--���ã�� ��ȣ
		ca_idx		int,			--������ ī�װ� ��ȣ
		ca_name		varchar2(200),	--������ �̸�
		m_idx		int				--������ȣ
	)

	alter table favorites
		add constraint pk_favorites_f_idx primary key(f_idx);

	--�ܷ�Ű ����(ca_idx)
	alter table favorites
		add constraint fk_favorites_ca_idx foreign key(ca_idx)
								   references category(ca_idx);
	
	--�ܷ�Ű ����(m_idx)
	alter table favorites
		add constraint fk_favorites_m_idx foreign key(m_idx)
									references member(m_idx);
	select * from favorites
	
	delete from favorites;
*/