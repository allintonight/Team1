package Reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
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
		public int check(ReservationBean reservationbean) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			ResultSet rs = null;
			int re=-1;
			
			try {
				sql = "select check_in, check_out"
						+ " from reservation"
						+ " where rno =? and ? >=check_in and ? < check_out";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, reservationbean.getRno());
				pstmt.setDate(2, reservationbean.getCheck_in());
				pstmt.setDate(3, reservationbean.getCheck_in());
				rs = pstmt.executeQuery();
				System.out.println(reservationbean.getCheck_in()+"가능");
					re = 1;
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println(reservationbean.getCheck_in()+"불가능");
			}
			return re;
		}
		public int max() throws Exception{
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			ResultSet rs = null;
			int re=-1;
			
			try {
				sql = "select max(rsno)+1 from reservation;";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					re = rs.getInt(1);
				}else {
					re=-1;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return re;
		}
		//예약
		public int addReservation(ReservationBean reservationbean)  throws Exception{
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;

			try {
				sql="insert into reservation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, reservationbean.getRsno()); 
//				pstmt.setInt(1, reservationbean.getRsno()); //=========자동증가처리???한다면 열번호가 하나씩 밀립니다.
				if(reservationbean.getMno()==0) {
					pstmt.setNull(2, Types.INTEGER);
				}else {
					pstmt.setInt(2, reservationbean.getMno());
				}  //작업하실때 풀어서 test 하셔도 괜찮아유.수원씨 마음대로.♡
				pstmt.setInt(3, reservationbean.getRno());  
				pstmt.setString(4, reservationbean.getRname());
				pstmt.setString(5, reservationbean.getRemail());
				pstmt.setString(6, reservationbean.getRphone());
				pstmt.setDate(7, reservationbean.getCheck_in());			
				pstmt.setDate(8, reservationbean.getCheck_out());			
				pstmt.setInt(9, reservationbean.getUsemen());
				pstmt.setInt(10, reservationbean.getPrice());
				pstmt.setNull(11, Types.CHAR); //결제사이트 이후에 선택 후 업데이트 시키는게 좋을까요 ..?
				pstmt.setString(12, reservationbean.getPaid());//처음에는 N으로 설정 해 놓고 나중에 관리자가 Y로 업데이트 시키기
				pstmt.setNull(13, Types.VARCHAR);//나중에 결제사이트 이후에 업데이트 시키기
				pstmt.setDate(14, reservationbean.getRes_date());

				pstmt.executeUpdate();
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
				re = -1;
				System.out.println(reservationbean.getMno());
			}finally {
				con.close();
				pstmt.close();
			}
			return re;
		}
		//예약 조회 후 결제사이트에서 가격 뽑기 위해서 추가 ㅠㅠ
		public ResultSet price(int rsno) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			ResultSet rs = null;
			
			try {
				sql="select * from reservation where rsno=?";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rsno);
				rs = pstmt.executeQuery();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
		public int update(String pay_ment, String pay_name, int rsno) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;
			String ypaid="y";
			String npaid="n";
			try {
				sql="update reservation set pay_ment=?, pay_name=?, paid=? where rsno=?;";
				con = getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, pay_ment);
				pstmt.setString(2, pay_name);
				if(pay_ment.equals("c")) {
					pstmt.setString(3, ypaid);
				}else {
					pstmt.setString(3, npaid);
				}
				pstmt.setInt(4, rsno);
				pstmt.executeUpdate();
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
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
				con.setAutoCommit(false);
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rsno);
				pstmt.executeUpdate();
				con.setAutoCommit(true);
				re = 1;
			}catch(Exception e) {
				e.printStackTrace();
				re = -1;
			}
			return re;
		}
		public ResultSet reservationpay(int rsno) throws SQLException {
			Connection con=null;
			Statement stmt = null;
			String sql=null;
			ResultSet rs = null;

			try {
				sql=" select r.rname, re.* from room r join reservation re on r.rno = re.rno where rsno = "+rsno;
				con=getConnection();
				stmt=con.createStatement();
				rs = stmt.executeQuery(sql);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return rs;
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
//		희순언니~ 혹시 이부분 관리자가 업데이트 하는 부분이면 paid 부분만		
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
							rs.getString(12),
							rs.getString(13),
							rs.getDate(14)));
				}

			}catch(Exception e) {
				e.printStackTrace();
			}

			return reservationBean;

		}
			
			
			@SuppressWarnings("deprecation")//쓰지말라는데... 무시하고 쓸려구요.. ㅋ 6줄짜리를 3줄로 줄이겠다고 이러고 있습니다.
			//Date형 자료를 int형(20200926)형식으로 바꿔주는 기능입니다.
			public int DateToStringToint(Date date) {
				String strDate ;
				strDate = Integer.toString(date.getYear()-100+2000);//2000년대4자리로 맞춤
				strDate += Integer.toString(date.getMonth()+1).length() == 1 ? "0" + Integer.toString(date.getMonth()+1) : Integer.toString(date.getMonth()+1) ;
				strDate += Integer.toString(date.getDate()).length()== 1? "0" + Integer.toString(date.getDate()):Integer.toString(date.getDate());
				return Integer.valueOf(strDate);	
			}


		}



