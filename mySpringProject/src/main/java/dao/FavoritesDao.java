package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FavoritesVo;

public interface FavoritesDao {

	List<FavoritesVo>	selectList(int m_idx);
	
	int					insert(FavoritesVo vo);
	int					delete(FavoritesVo vo);

	
	
}
