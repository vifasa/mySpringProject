package vo;

public class CategoryVo {
	
	int		ca_idx;
	String  ca_name;
    String	ca_image;
	String  ca_text;
	
	//gatter & setter
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
	public String getCa_image() {
		return ca_image;
	}
	public void setCa_image(String ca_image) {
		this.ca_image = ca_image;
	}
	public String getCa_text() {
		return ca_text;
	}
	public void setCa_text(String ca_text) {
		this.ca_text = ca_text;
	}
	
	
}
