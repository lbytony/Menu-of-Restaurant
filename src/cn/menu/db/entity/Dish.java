package cn.menu.db.entity;

public class Dish {
	int DID;
	String DName;
	String DPicPath;
	boolean DKind;
	double DPrice;

	public Dish(int DID, String DName, String DPicPath, boolean DKind, double DPrice) {
		this.DID = DID;
		this.DName = DName;
		this.DPicPath = DPicPath;
		this.DKind = DKind;
		this.DPrice = DPrice;
	}

	public int getDID() {
		return DID;
	}

	public void setDID(int dID) {
		DID = dID;
	}

	public String getDName() {
		return DName;
	}

	public void setDName(String dName) {
		DName = dName;
	}

	public String getDPicPath() {
		return DPicPath;
	}

	public void setDPicPath(String dPicPath) {
		DPicPath = dPicPath;
	}

	public boolean isDKind() {
		return DKind;
	}

	public void setDKind(boolean dKind) {
		DKind = dKind;
	}

	public double getDPrice() {
		return DPrice;
	}

	public void setDPrice(double dPrice) {
		DPrice = dPrice;
	}

}
