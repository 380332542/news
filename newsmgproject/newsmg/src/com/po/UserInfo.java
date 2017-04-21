package com.po;



//user的实体对象
public class UserInfo extends PageInfo{
    private int userId;
    private String userName;
    private String pwd;
    private String email;
    private String phone;
    
    
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName
				+ ", pwd=" + pwd + ", email=" + email + ", phone=" + phone
				+ ", getStart()=" + getStart() + ", getPageSize()="
				+ getPageSize() + ", getCurrentPage()=" + getCurrentPage()
				+ "]";
	}
	
	
	
	
    
    
}
