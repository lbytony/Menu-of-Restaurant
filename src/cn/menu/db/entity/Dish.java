package cn.menu.db.entity;

public class Dish {
	int dID;
	String dName;
	String dPicPath;
	boolean dKind;
	double dPrice;

	public Dish(int dID, String dName, String dPicPath, boolean dKind, double dPrice) {
		super();
		this.dID = dID;
		this.dName = dName;
		this.dPicPath = dPicPath;
		this.dKind = dKind;
		this.dPrice = dPrice;
	}

	public int getdID() {
		return dID;
	}

	public void setdID(int dID) {
		this.dID = dID;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getdPicPath() {
		return dPicPath;
	}

	public void setdPicPath(String dPicPath) {
		this.dPicPath = dPicPath;
	}

	public boolean isdKind() {
		return dKind;
	}

	public void setdKind(boolean dKind) {
		this.dKind = dKind;
	}

	public double getdPrice() {
		return dPrice;
	}

	public void setdPrice(double dPrice) {
		this.dPrice = dPrice;
	}

}
