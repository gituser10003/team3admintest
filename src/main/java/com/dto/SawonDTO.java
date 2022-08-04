package com.dto;

public class SawonDTO {
	
	private String userid;
	private String passwd;
	private String username;
	private String phonenumber1;
	private String phonenumber2;
	private String phonenumber3;
	private String birthday1;
	private String birthday2;
	private String birthday3;
	private String email1;
	private String email2;
	private String sawongrade;
	
	public SawonDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SawonDTO(String userid, String passwd, String username, String phonenumber1, String phonenumber2,
			String phonenumber3, String birthday1, String birthday2, String birthday3, String email1, String email2,
			String sawongrade) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.phonenumber1 = phonenumber1;
		this.phonenumber2 = phonenumber2;
		this.phonenumber3 = phonenumber3;
		this.birthday1 = birthday1;
		this.birthday2 = birthday2;
		this.birthday3 = birthday3;
		this.email1 = email1;
		this.email2 = email2;
		this.sawongrade = sawongrade;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhonenumber1() {
		return phonenumber1;
	}

	public void setPhonenumber1(String phonenumber1) {
		this.phonenumber1 = phonenumber1;
	}

	public String getPhonenumber2() {
		return phonenumber2;
	}

	public void setPhonenumber2(String phonenumber2) {
		this.phonenumber2 = phonenumber2;
	}

	public String getPhonenumber3() {
		return phonenumber3;
	}

	public void setPhonenumber3(String phonenumber3) {
		this.phonenumber3 = phonenumber3;
	}

	public String getBirthday1() {
		return birthday1;
	}

	public void setBirthday1(String birthday1) {
		this.birthday1 = birthday1;
	}

	public String getBirthday2() {
		return birthday2;
	}

	public void setBirthday2(String birthday2) {
		this.birthday2 = birthday2;
	}

	public String getBirthday3() {
		return birthday3;
	}

	public void setBirthday3(String birthday3) {
		this.birthday3 = birthday3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getSawongrade() {
		return sawongrade;
	}

	public void setSawongrade(String sawongrade) {
		this.sawongrade = sawongrade;
	}

	@Override
	public String toString() {
		return "SawonDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", phonenumber1="
				+ phonenumber1 + ", phonenumber2=" + phonenumber2 + ", phonenumber3=" + phonenumber3 + ", birthday1="
				+ birthday1 + ", birthday2=" + birthday2 + ", birthday3=" + birthday3 + ", email1=" + email1
				+ ", email2=" + email2 + ", sawongrade=" + sawongrade + "]";
	}
	
	
	
}
