package dao;

import java.util.List;

import vo.CategoryVo;

public interface CategoryDao {
	List<CategoryVo>	selectList();
	CategoryVo	selectOne(String ca_name);
	String	selectOne(int ca_idx);
	
	int			insert(CategoryVo vo);
	int			update(CategoryVo vo);
	int			delete(int ca_idx);
}
