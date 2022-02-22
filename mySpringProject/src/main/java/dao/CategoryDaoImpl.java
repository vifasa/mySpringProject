/**
 * 
 */
package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CategoryVo;


public class CategoryDaoImpl implements CategoryDao {

	SqlSession sqlSession;
	
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CategoryVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("category.category_list");
	}

	@Override
	public CategoryVo selectOne(String ca_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CategoryVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("category.category_insert",vo);
	}

	@Override
	public int update(CategoryVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int ca_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectOne(int ca_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("category.category_name",ca_idx);
	}
	
	

}
