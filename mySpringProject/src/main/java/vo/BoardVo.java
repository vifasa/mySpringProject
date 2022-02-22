package vo;

public class BoardVo {

	int    no;
	int    comment_count;
	
	int			b_idx;
	int			ca_idx;
	String		b_title;
	String		b_content;
	String		b_ip;
	int			b_like;
	int			b_hate;
	int			m_idx;
	String		b_pwd;
	int			b_readhit;
	String		b_regdate;
	String		b_use_yn;
	String 		m_name;
	String		m_image;
	
	
	
	//getter & setter
	
	
	
	public int getB_idx() {
		return b_idx;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getCa_idx() {
		return ca_idx;
	}
	public void setCa_idx(int ca_idx) {
		this.ca_idx = ca_idx;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_hate() {
		return b_hate;
	}
	public void setB_hate(int b_hate) {
		this.b_hate = b_hate;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public int getB_readhit() {
		return b_readhit;
	}
	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_use_yn() {
		return b_use_yn;
	}
	public void setB_use_yn(String b_use_yn) {
		this.b_use_yn = b_use_yn;
	}
	
	
}
