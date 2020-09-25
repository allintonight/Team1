package Reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class ReservationDBBean {
	
	private static ReservationDBBean instance = new ReservationDBBean();

	public static ReservationDBBean getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection con = null;
		String url = "jdbc:mysql://203.245.44.74:3306/allintonight?serverTimezone=UTC"; 
		String user = "allintonight";
		String pwd = "team1team1";
		
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pwd);
			
			} catch (Exception e) { 
				e.printStackTrace();
			}
		return con;
	}
	
	//예약가능 여부 조회
		public int check(Date checkin, Date checkout) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			ResultSet rs = null;
			int re=-1;
			
			try {
				sql = "select checkin, checkout"
						+ " from reservation"
						+ " where ? >=checkin and ? < checkout";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setDate(1, checkin);
				pstmt.setDate(2, checkin);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					re = 1;
					System.out.println(checkin+"불가");
				}else {
					re = -1;
					System.out.println(checkin+"가능");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return re;
		}
		
		public int addReservation(ReservationBean reservationbean)  throws Exception{
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;

			try {
				sql="insert into reservation values(null,?,?,?,?,?,?,?,?,?,?,?)";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
//				pstmt.setInt(1, reservationbean.getRsno()); =========자동증가처리???한다면 열번호가 하나씩 밀립니다.
				pstmt.setInt(2, reservationbean.getMno());  //작업하실때 풀어서 test 하셔도 괜찮아유.수원씨 마음대로.♡
				pstmt.setInt(3, reservationbean.getRno());  
				pstmt.setString(4, reservationbean.getRname());
				pstmt.setString(5, reservationbean.getRemail());
				pstmt.setString(6, reservationbean.getRphone());
				pstmt.setDate(7, reservationbean.getCheck_in());			
				pstmt.setDate(8, reservationbean.getCheck_out());			
				pstmt.setInt(9, reservationbean.getUsemen());
				pstmt.setInt(10, reservationbean.getPrice());
				pstmt.setString(11, reservationbean.getPay_ment());
				pstmt.setString(12, reservationbean.getPaid());

				pstmt.executeUpdate();
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
				re = -1;
			}finally {
				con.close();
				pstmt.close();
			}
			return re;
		}
		
		public int ReservationBean(int rsno) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;

			try {
				sql="delete from reservation where rsno=?";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rsno);
				pstmt.executeUpdate();
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
				re = -1;
			}
			return re;
		}
		
		public ResultSet selectRoom(int rsno) throws SQLException {
			Connection con=null;
			Statement stmt = null;
			String sql=null;
			ResultSet rs = null;
			ReservationBean reservationbean=null;

			try {
				sql="select * from reservation where rsno="+rsno;
				con=getConnection();
				stmt=con.createStatement();
				rs = stmt.executeQuery(sql);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
//		ReservationBean ReservationDBBean reservation	
//		희순언니~ 혹시 이부분 관리자가 업데이트 하는 부분이면 paid 부분만 업데이트 하는건 어떨까요?
		
		public int updateRoom(int rsno,	int mno, int rno,
				String rname,String remail, String rphone, 
				Date check_in, Date check_out,int usemen, 
				int price,String pay_ment, String paid) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;

			try {
				sql="update room set mno=?, rno=?, rname=?, "
						+ "remail=?, rphone=? ,check_in=?,check_out=?, usemen=?, price=?,pay_ment=?, paid=?  where rsno=?;";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, mno);
				pstmt.setInt(2, rno);
				pstmt.setString(3, rname);
				pstmt.setString(4, remail);
				pstmt.setString(5, rphone);
				pstmt.setDate(6, check_in);
				pstmt.setDate(7, check_out);
				pstmt.setInt(8, usemen);			
				pstmt.setInt(9, price);			
				pstmt.setString(10, pay_ment);
				pstmt.setString(11, paid);

				pstmt.executeUpdate();
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
				re = -1;
			}
			return re;
		}
		
		//====이부분은 일단 적어놓고 만약에 안써도 될꺼같으면 나중에 지워버려요 !===//
		
		public ArrayList<ReservationBean> getAll() throws SQLException {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			ResultSet rs=null;

			ArrayList<ReservationBean> reservationBean = new ArrayList<ReservationBean>();

			try {
				sql="select * from reservation;";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();

				while(rs.next()) {
					reservationBean.add(new ReservationBean(
							rs.getInt(1),
							rs.getInt(2),
							rs.getInt(3),
							rs.getString(4),
							rs.getString(5),
							rs.getString(6),
							rs.getDate(7),
							rs.getDate(8),
							rs.getInt(9),
							rs.getInt(10),
							rs.getString(11),
							rs.getString(12)));
				}

			}catch(Exception e) {
				e.printStackTrace();
			}

			return reservationBean;

		}


}
