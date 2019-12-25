package cn.menu.db.entity;

public class OrderDetail {
	int ODID;
	int OID;
	int DID;
	int DCount;
	String DName;
	double DPrice;

	public OrderDetail(int oDID, int oID, int dID, int dCount, String dName, double dPrice) {
		super();
		ODID = oDID;
		OID = oID;
		DID = dID;
		DCount = dCount;
		DName = dName;
		DPrice = dPrice;
	}

	public int getODID() {
		return ODID;
	}

	public void setODID(int oDID) {
		ODID = oDID;
	}

	public int getOID() {
		return OID;
	}

	public void setOID(int oID) {
		OID = oID;
	}

	public int getDID() {
		return DID;
	}

	public void setDID(int dID) {
		DID = dID;
	}

	public int getDCount() {
		return DCount;
	}

	public void setDCount(int dCount) {
		DCount = dCount;
	}

	public String getDName() {
		return DName;
	}

	public void setDName(String dName) {
		DName = dName;
	}

	public double getDPrice() {
		return DPrice;
	}

	public void setDPrice(double dPrice) {
		DPrice = dPrice;
	}

}
