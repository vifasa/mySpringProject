package vo;

public class FavoritesVo {
	
	int f_idx;
	int ca_idx;
	String ca_name;
	int m_idx;
	
	
	public FavoritesVo() {
		// TODO Auto-generated constructor stub
	}
	
	public FavoritesVo(int ca_idx, String ca_name, int m_idx) {
		super();
		this.ca_idx = ca_idx;
		this.ca_name = ca_name;
		this.m_idx = m_idx;
	}
	
	
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public int getCa_idx() {
		return ca_idx;
	}
	public void setCa_idx(int ca_idx) {
		this.ca_idx = ca_idx;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	
	
}
