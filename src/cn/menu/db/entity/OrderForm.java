package cn.menu.db.entity;

public class OrderForm {
	int OID;
	int UID;
	String OTime;
	String OPTime;
	double OPrice;
	boolean OStatus;

	public OrderForm(int OID, int UID, String OTime, String OPTime, double OPrice, boolean OStatus) {
		this.OID = OID;
		this.UID = UID;
		this.OTime = OTime;
		this.OPTime = OPTime;
		this.OPrice = OPrice;
		this.OStatus = OStatus;
	}

	public int getOID() {
		return OID;
	}

	public void setOID(int oID) {
		OID = oID;
	}

	public int getUID() {
		return UID;
	}

	public void setUID(int uID) {
		UID = uID;
	}

	public String getOTime() {
		return OTime;
	}

	public void setOTime(String oTime) {
		OTime = oTime;
	}

	public String getOPTime() {
		return OPTime;
	}

	public void setOPTime(String oPTime) {
		OPTime = oPTime;
	}

	public double getOPrice() {
		return OPrice;
	}

	public void setOPrice(double oPrice) {
		OPrice = oPrice;
	}

	public boolean isOStatus() {
		return OStatus;
	}

	public void setOStatus(boolean oStatus) {
		OStatus = oStatus;
	}

}
