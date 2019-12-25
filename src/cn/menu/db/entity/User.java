package cn.menu.db.entity;

public class User {
	int UID;
	String UName;
	String UPassword;
	String URegDate;
	boolean URole;
	boolean USex;

	public User() {

	}

	public User(int uID, String uName, String uPassword, String uRegDate, boolean uRole, boolean uSex) {
		UID = uID;
		UName = uName;
		UPassword = uPassword;
		URegDate = uRegDate;
		URole = uRole;
		USex = uSex;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public String getUName() {
		return UName;
	}

	public void setUName(String uName) {
		UName = uName;
	}

	public String getUPassword() {
		return UPassword;
	}

	public void setUPassword(String uPassword) {
		UPassword = uPassword;
	}

	public String getURegDate() {
		return URegDate;
	}

	public void setURegDate(String uRegDate) {
		URegDate = uRegDate;
	}

	public boolean isURole() {
		return URole;
	}

	public void setURole(boolean uRole) {
		URole = uRole;
	}

	public boolean isUSex() {
		return USex;
	}

	public void setUSex(boolean uSex) {
		USex = uSex;
	}
}
