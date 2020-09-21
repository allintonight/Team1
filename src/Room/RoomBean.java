package Room;

public class RoomBean {
	private int rno;
	private String rname;
	private int men;
	private int weekday;
	private int weekend;
	private int sweekday;
	
	public RoomBean() {}
	
	public RoomBean(int rno, String rname, int men, int weekday, int weekend, int sweekday) {
		this.rno = rno;
		this.rname = rname;
		this.men = men;
		this.weekday = weekday;
		this.weekend = weekend;
		this.sweekday = sweekday;
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
	public int getMen() {
		return men;
	}
	public void setMen(int men) {
		this.men = men;
	}
	public int getWeekday() {
		return weekday;
	}
	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}
	public int getWeekend() {
		return weekend;
	}
	public void setWeekend(int weekend) {
		this.weekend = weekend;
	}
	public int getSweekday() {
		return sweekday;
	}
	public void setSweekday(int sweekday) {
		this.sweekday = sweekday;
	}
	
	
}
