package jisang.poyong.vo;
 // VO = 변수하나하나 만들어주기
public class UserVO {

	// 필드명 property(프로퍼티) 속성
	private String user_id; // 아이디
	private String user_pw; // 비번
	private String user_name; //이름
	private String user_address; //주소
	private String phone; //연락처 
	private char user_div; //유저 구분(비장애, 장애 , 기업)
	private char user_obstc_code; // 장애 분류 (0~15) 
	private String user_parent_phone; // 보호자 연락처
	
	
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
