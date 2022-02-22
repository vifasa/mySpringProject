package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.FavoritesVo;

public class FavoritesImpl implements FavoritesDao {

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FavoritesVo> selectList(int m_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("favorites.favorites_list", m_idx);
	}

	@Override
	public int insert(FavoritesVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("favorites.favorites_insert", vo);
	}

	@Override
	public int delete(FavoritesVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("favorites.favorites_delete", vo);
	}

	

	
}
