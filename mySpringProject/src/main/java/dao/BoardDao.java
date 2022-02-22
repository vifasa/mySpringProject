package dao;

import java.util.List;
import java.util.Map;

import vo.BoardVo;

public interface BoardDao {
	
	List<BoardVo> selectList();
	List<BoardVo> selectList(Map map);
	BoardVo		  selectOne(int b_idx);
	
	int			  selectRowTotal(Map map);
	
	int 		  insert(BoardVo vo);
	int			  update(BoardVo vo);
	int			  update_use_yn(int b_idx);
	int			  delete(int b_idx);
	int			  update_readhit(int b_idx);
	int			  update_like(int b_idx);
	int			  update_hate(int b_idx);
}
