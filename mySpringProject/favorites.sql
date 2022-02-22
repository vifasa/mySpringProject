/*
	create sequence seq_favorites_f_idx;
	
	create table favorites
	(
		f_idx		int,			--즐겨찾기 번호
		ca_idx		int,			--개시판 카테고리 번호
		ca_name		varchar2(200),	--개시판 이름
		m_idx		int				--유저번호
	)

	alter table favorites
		add constraint pk_favorites_f_idx primary key(f_idx);

	--외래키 설정(ca_idx)
	alter table favorites
		add constraint fk_favorites_ca_idx foreign key(ca_idx)
								   references category(ca_idx);
	
	--외래키 설정(m_idx)
	alter table favorites
		add constraint fk_favorites_m_idx foreign key(m_idx)
									references member(m_idx);
	select * from favorites
	
	delete from favorites;
*/