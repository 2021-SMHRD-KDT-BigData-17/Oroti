package jisang.poyong.vo;
 // VO = 변수하나하나 만들어주기
public class UserVO {

	// 필드명 property(프로퍼티) 속성
	private String userid; // 아이디
	private String userpw; // 비번
	private String username; //이름
	private String useremail; //이메일
	private String userphone; //연락처 
	private char userdiv; //유저 구분(일반 , 기업)
	private char userobstccode; // 장애 분류 (0~15) 
	private String userparentphone; // 보호자 연락처
	private String businessidx;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public char getUserdiv() {
		return userdiv;
	}
	public void setUserdiv(char userdiv) {
		this.userdiv = userdiv;
	}
	public char getUserobstccode() {
		return userobstccode;
	}
	public void setUserobstccode(char userobstccode) {
		this.userobstccode = userobstccode;
	}
	public String getUserparentphone() {
		return userparentphone;
	}
	public void setUserparentphone(String userparentphone) {
		this.userparentphone = userparentphone;
	}
	public String getBusinessidx() {
		return businessidx;
	}
	public void setBusinessidx(String businessidx) {
		this.businessidx = businessidx;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", useremail=" + useremail
				+ ", userphone=" + userphone + ", userdiv=" + userdiv + ", userobstccode=" + userobstccode
				+ ", userparentphone=" + userparentphone + ", businessidx=" + businessidx + "]";
	}
}