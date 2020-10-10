package Reservation;

import java.sql.Date;

public class PayBean {
	private int rsno;
	private String rname;
	private String rphone;
	private int paid_amout;
	private String pay_name;
	private String imp_uid;
	private String apply_num;
	private String bank_name;
	private String bank_num;
	private String pay_method;
	private int refund_price;
	private int rn;
	private Date pay_date;
	private Date cancle_date;
	private Date cancleOk_date;
	
	
	public PayBean() {}
	
	public PayBean(int refund_price, Date cancle_date, int rsno, int paid_amout, 
			String pay_name, String imp_uid, String apply_num, String bank_name,
			String bank_num, String pay_method, String rname) {
		this.refund_price = refund_price;
		this.rsno = rsno;
		this.paid_amout = paid_amout;
		this.pay_name = pay_name;
		this.imp_uid = imp_uid;
		this.apply_num = apply_num;
		this.bank_name = bank_name;
		this.bank_num = bank_num;
		this.pay_method = pay_method;
		this.rname = rname;
	}
	
	public PayBean(int rsno, int refund_price, String pay_name, Date cancle_date,
				   Date cancleOk_date, String rname, String rphone) {
		this.rsno = rsno;
		this.rname = rname;
		this.pay_name = pay_name;
		this.refund_price = refund_price;
		this.cancle_date = cancle_date;
		this.cancleOk_date = cancleOk_date;
		this.rphone = rphone;
	}

	public int getRsno() {
		return rsno;
	}
	public void setRsno(int rsno) {
		this.rsno = rsno;
	}
	public int getPaid_amout() {
		return paid_amout;
	}
	public void setPaid_amout(int paid_amout) {
		this.paid_amout = paid_amout;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_num() {
		return bank_num;
	}
	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public int getRefund_price() {
		return refund_price;
	}
	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}
	public int getRn() {
		return rn;
	}

	public void setRn(int rn, int i) {
		this.rn = rn+i;
	}

	public Date getCancle_date() {
		return cancle_date;
	}

	public void setCancle_date(Date cancle_date) {
		this.cancle_date = cancle_date;
	}

	public Date getCancleOk_date() {
		return cancleOk_date;
	}

	public void setCancleOk_date(Date cancleOk_date) {
		this.cancleOk_date = cancleOk_date;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getRphone() {
		return rphone;
	}

	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	
}
