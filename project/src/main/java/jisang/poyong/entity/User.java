package jisang.poyong.entity;
 // DTO = 변수하나하나 만들어주기
public class User {

	// 필드명 property(프로퍼티) 속성
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_address;
	private String phone;
	private char user_div;
	private char user_obstc_code;
	private String user_parent_phone;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public char getUser_div() {
		return user_div;
	}
	public void setUser_div(char user_div) {
		this.user_div = user_div;
	}
	public char getUser_obstc_code() {
		return user_obstc_code;
	}
	public void setUser_obstc_code(char user_obstc_code) {
		this.user_obstc_code = user_obstc_code;
	}
	public String getUser_parent_phone() {
		return user_parent_phone;
	}
	public void setUser_parent_phone(String user_parent_phone) {
		this.user_parent_phone = user_parent_phone;
	}

	

}
