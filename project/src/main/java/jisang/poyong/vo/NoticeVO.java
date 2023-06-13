package jisang.poyong.vo;

public class NoticeVO {

	private int noticeidx; // 공고번호 (PK)
	private String userid; // 유저 아이디 (FK)
	private String companyname; // 사업장 명
	private String noticejobcode; // 모집직종
	private String noticeemp; // 고용형태
	private String noticewagemode; // 임금형태
	private int noticewage; // 임금
	private String noticejoinmode; //입사형태
	private String noticecarrer; // 요구경력
	private String noticeedu; // 요구경력
	private String companyaddress; // 사업장 주소
	private String noticeregdate; // 공고글 등록일
	private String noticeperiod; // 구인 마감기간
	
	
	public int getNoticeidx() {
		return noticeidx;
	}
	public void setNoticeidx(int noticeidx) {
		this.noticeidx = noticeidx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getNoticejobcode() {
		return noticejobcode;
	}
	public void setNoticejobcode(String noticejobcode) {
		this.noticejobcode = noticejobcode;
	}
	public String getNoticeemp() {
		return noticeemp;
	}
	public void setNoticeemp(String noticeemp) {
		this.noticeemp = noticeemp;
	}
	public String getNoticewagemode() {
		return noticewagemode;
	}
	public void setNoticewagemode(String noticewagemode) {
		this.noticewagemode = noticewagemode;
	}
	public int getNoticewage() {
		return noticewage;
	}
	public void setNoticewage(int noticewage) {
		this.noticewage = noticewage;
	}
	public String getNoticejoinmode() {
		return noticejoinmode;
	}
	public void setNoticejoinmode(String noticejoinmode) {
		this.noticejoinmode = noticejoinmode;
	}
	public String getNoticecarrer() {
		return noticecarrer;
	}
	public void setNoticecarrer(String noticecarrer) {
		this.noticecarrer = noticecarrer;
	}
	public String getNoticeedu() {
		return noticeedu;
	}
	public void setNoticeedu(String noticeedu) {
		this.noticeedu = noticeedu;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}
	public String getNoticeregdate() {
		return noticeregdate;
	}
	public void setNoticeregdate(String noticeregdate) {
		this.noticeregdate = noticeregdate;
	}
	public String getNoticeperiod() {
		return noticeperiod;
	}
	public void setNoticeperiod(String noticeperiod) {
		this.noticeperiod = noticeperiod;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeidx=" + noticeidx + ", userid=" + userid + ", companyname=" + companyname
				+ ", noticejobcode=" + noticejobcode + ", noticeemp=" + noticeemp + ", noticewagemode=" + noticewagemode
				+ ", noticewage=" + noticewage + ", noticejoinmode=" + noticejoinmode + ", noticecarrer=" + noticecarrer
				+ ", noticeedu=" + noticeedu + ", companyaddress=" + companyaddress + ", noticeregdate=" + noticeregdate
				+ ", noticeperiod=" + noticeperiod + "]";
	}


}
