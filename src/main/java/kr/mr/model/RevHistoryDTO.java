package kr.mr.model;

import java.sql.Date;
import java.text.DecimalFormat;

public class RevHistoryDTO {
	private int cNum;
	private String cName;
	private String fileName;
	
	private String id;
	private String isRented;
	
	private String revAddr;
	private int totalPrice;

	private Date revDate1;
	private Date revDate2;

	private int dateCnt;
	
	
	

	public int getDateCnt() {
		return dateCnt;
	}


	public void setDateCnt(int dateCnt) {
		this.dateCnt = dateCnt;
	}
	

	

	private String wtotalPrice; 

    public String getWtotalPrice() {
       DecimalFormat formatter = new DecimalFormat("###,###,###,###,###,###");
       int totalPrice = getTotalPrice();
       String wtotalPrice = formatter.format(totalPrice);
       
       return wtotalPrice;
    }   
	
	

	
	public RevHistoryDTO() {}



	public RevHistoryDTO(int cNum, String cName, String fileName, String id, String isRented, String revAddr,
			int totalPrice, Date revDate1, Date revDate2,int dateCnt) {
		super();
		this.cNum = cNum;
		this.cName = cName;
		this.fileName = fileName;
		this.id = id;
		this.isRented = isRented;
		this.revAddr = revAddr;
		this.totalPrice = totalPrice;
		this.revDate1 = revDate1;
		this.revDate2 = revDate2;
		this.dateCnt = dateCnt;
	}



	public int getcNum() {
		return cNum;
	}



	public void setcNum(int cNum) {
		this.cNum = cNum;
	}



	public String getcName() {
		return cName;
	}



	public void setcName(String cName) {
		this.cName = cName;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getIsRented() {
		return isRented;
	}



	public void setIsRented(String isRented) {
		this.isRented = isRented;
	}



	public String getRevAddr() {
		return revAddr;
	}



	public void setRevAddr(String revAddr) {
		this.revAddr = revAddr;
	}



	public int getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}



	public Date getRevDate1() {
		return revDate1;
	}



	public void setRevDate1(Date revDate1) {
		this.revDate1 = revDate1;
	}



	public Date getRevDate2() {
		return revDate2;
	}



	public void setRevDate2(Date revDate2) {
		this.revDate2 = revDate2;
	};
	
	
	
	
	
	
	
}