package Reservation;

import java.sql.Date;
import java.sql.Timestamp;


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
	private String roomname;
	private String pay_name;
	private Timestamp res_date; 
	private int rn;
	
	public ReservationBean() {}
	
	public ReservationBean(String roomname,String paid, Date check_in, Date check_out) {
		this.roomname = roomname;
		this.paid = paid;
		this.check_in = check_in;
		this.check_out = check_out;
	}
	
	public ReservationBean(int rsno, String roomname,Date check_in, Date check_out, String rname) {
		this.rsno = rsno;
		this.roomname = roomname;
		this.check_in = check_in;
		this.check_out = check_out;
		this.rname = rname;
	}
	
	public ReservationBean(int rsno, int mno, int rno, String rname, String remail, String rphone, Date check_in,
			Date check_out, int usemen, int price, String pay_ment, String paid, String pay_name, Timestamp res_date) {
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
		this.pay_name = pay_name;
		this.res_date = res_date;
	}
	
	
	
	public int getRsno() {
		return rsno;
	}

	public void setRsno(int rsno) {
		this.rsno = rsno;
	}

	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public String getRphone() {
		return rphone;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
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

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public Timestamp getRes_date() {
		return res_date;
	}

	public void setRes_date(Timestamp res_date) {
		this.res_date = res_date;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn, int i) {
		this.rn = rn+i;
	}
	
}