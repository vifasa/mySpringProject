package vo;

public class MemberVo {
	
	int		m_idx;
	String	m_name;
	String 	m_id;
	String  m_pwd;
	String	m_text;
	String	m_grade;
	String	m_image;
	String 	m_mail;
	String	m_ip;
	int		m_point;
	String	m_regdate;
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	//맴버 생성
	public MemberVo(String m_name, String m_id, String m_pwd, String m_mail, String m_ip) {
		super();
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_mail = m_mail;
		this.m_ip = m_ip;
	}
	
	
	//멤버 수정
	public MemberVo(int m_idx, String m_name, String m_id, String m_pwd, String m_text, String m_grade, String m_image,
			String m_mail, String m_ip, int m_point) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_text = m_text;
		this.m_grade = m_grade;
		this.m_image = m_image;
		this.m_mail = m_mail;
		this.m_ip = m_ip;
		this.m_point = m_point;
	}

	//getter and setter 만들기
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_text() {
		return m_text;
	}
	public void setM_text(String m_text) {
		this.m_text = m_text;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	public String getM_ip() {
		return m_ip;
	}
	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	
	

	
	
	
	
	
	
}
