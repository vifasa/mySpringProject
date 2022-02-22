package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CommentVo;

public class CommentDaoImpl implements CommentDao {
	
	SqlSession sqlSession;
	
	CommentDao comment_dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CommentVo> selectList(int b_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CommentVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("comment.comment_insert",vo);
	}

	@Override
	public int delete(int c_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("comment.comment_delete",c_idx);
	}

	@Override
	public int selectRowTotal(int b_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("comment.comment_row_total", b_idx);
	}

	@Override
	public List<CommentVo> selectList(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("comment.comment_page_list",map);
	}

}
