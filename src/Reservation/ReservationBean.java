package Reservation;

import java.sql.Date;

public class ReservationBean {
	private int rsno;
	private int mno;
	private int rno;
	private String rname;
	private String remail;
	private String rphone;
	private Date check_in;
	private Date check_out;
	private int usemen;
	private int price;
	private String pay_ment;
	private String paid;
	
	public ReservationBean() {}
		
	public ReservationBean(int rsno, int mno, int rno, String rname, String remail, String rphone, Date check_in,
			Date check_out, int usemen, int price, String pay_ment, String paid) {
		super();
		this.rsno = rsno;
		this.mno = mno;
		this.rno = rno;
		this.rname = rname;
		this.remail = remail;
		this.rphone = rphone;
		this.check_in = check_in;
		this.check_out = check_out;
		this.usemen = usemen;
		this.price = price;
		this.pay_ment = pay_ment;
		this.paid = paid;
	}
	public int getRsno() {
		return rsno;
	}
	public void setRsno(int rsno) {
		this.rsno = rsno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRemail() {
		return remail;
	}
	public void setRemail(String remail) {
		this.remail = remail;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}
	public int getUsemen() {
		return usemen;
	}
	public void setUsemen(int usemen) {
		this.usemen = usemen;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPay_ment() {
		return pay_ment;
	}
	public void setPay_ment(String pay_ment) {
		this.pay_ment = pay_ment;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	
}
