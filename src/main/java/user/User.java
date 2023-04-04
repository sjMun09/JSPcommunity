package user;

public class User {

	//DB 확인하고 생성해줌 
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	
	
	// 전부 다 사용하기 위해서 게더 세터를 생성해줌.
	// 자바빈즈 생성(jsp에서)
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	 

}
