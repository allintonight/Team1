package Reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

public class PayDBBean {
	private static PayDBBean instance = new PayDBBean();

	public static PayDBBean getinstance() {
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
	
	public int pay(PayBean paybean)  throws Exception{
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re=-1;

		try {
			if(paybean.getPay_method().equals("c")) {
				sql="insert into pay values(?,?,?,?,?,?,?,?,now())";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, paybean.getRsno()); 
				pstmt.setInt(2, paybean.getPaid_amout());
				pstmt.setString(3, paybean.getPay_name());
				pstmt.setString(4, paybean.getImp_uid());
				pstmt.setString(5, paybean.getApply_num());
				pstmt.setNull(6, Types.VARCHAR);
				pstmt.setNull(7, Types.VARCHAR);
				pstmt.setString(8, paybean.getPay_method());
			}else {
				sql="insert into pay values(?,?,?,?,?,?,?,?,?)";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, paybean.getRsno()); 
				pstmt.setInt(2, paybean.getPaid_amout());
				pstmt.setString(3, paybean.getPay_name());
				pstmt.setNull(4, Types.VARCHAR);
				pstmt.setNull(5, Types.VARCHAR);
				pstmt.setString(6, paybean.getBank_name());
				pstmt.setString(7, paybean.getBank_num());
				pstmt.setString(8, paybean.getPay_method());
				pstmt.setNull(9, Types.DATE);
			}
			pstmt.setString(8, paybean.getPay_method());
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
	public int updatePayDate(int rsno) throws Exception{
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re=-1;
		try {
			sql="update pay set pay_date=now() where rsno=?";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rsno);
				re = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
			pstmt.close();
		}
		return re;
	}
	
	//은행번호->은행명 찾는 매소드
	public String bankName(String no) throws Exception{
		String bank_name=null;
		String[] bankno = {"35","29","7","5","15","25"
							,"27","37","11","60","9"
							,"19","56","33","31","68"
							,"67","59","23","45","21"} ;
		
		String[] bankname = {"경남은행","광주은행","국민은행","기업은행","농협중앙회","대구은행"
							,"부산은행","새마을금고","수협중앙회","신한은행","외환은행"
							,"우리은행","우체국","전북은행","제주은행 ","카카오뱅크"
							,"케이뱅크","하나은행","한국씨티은행","HSB은행 ","SC제일은행"};
		
		for(int i=0;i<bankno.length;i++) {
			if(no.equals(bankno[i])) {
				bank_name=bankname[i];
				break;
			}else {
				continue;
			}
		}
		System.out.print(bank_name);
		return bank_name;
	}
	
	//예약취소 신청 시 결제 번호 및 계좌번호 위해서 출력
	public PayBean selectPay(int rsno) {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		ResultSet rs = null;
		PayBean pb = new PayBean();
		
		try {
			sql="select * from pay where rsno=?";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pb.setRsno(rs.getInt(1));
				pb.setPaid_amout(rs.getInt(2));
				pb.setPay_name(rs.getString(3));
				pb.setImp_uid(rs.getString(4));
				pb.setApply_num(rs.getString(5));
				pb.setBank_name(rs.getString(6));
				pb.setBank_num(rs.getString(7));
				pb.setPay_method(rs.getString(8));
			}else if(!rs.next()){
				pb.setRsno(0);
				pb.setPaid_amout(0);
				pb.setPay_name(null);
				pb.setImp_uid(null);
				pb.setApply_num(null);
				pb.setBank_name(null);
				pb.setBank_num(null);
				pb.setPay_method(null);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pb;
	}
	
	//예약취소 신청 시 결제 번호 및 계좌번호 위해서 출력
		public int selectCantcle(int rsno) {
			Connection con=null;
			PreparedStatement pstmt = null;
			String sql=null;
			int re=-1;
			ResultSet rs=null;
			
			try {
				sql="select * from cancle where rsno=?";
				con=getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rsno);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					re=1; // 이미 취소 완료된 건
				}else {
					re=-1;
				}
			}catch(Exception e) {
				e.printStackTrace();
				re=0;
			}
			return re;
		}
	
	// 관리자 예약 상세조회에서 사용 admin_resInfo.jsp
	public PayBean resInfo(int rsno) {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		ResultSet rs = null;
		PayBean pb = new PayBean();
		
		try {
			sql="select c.refund_price,c.cancle_date, p.*  from pay p left join cancle c on c.rsno = p.rsno where p.rsno=?";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pb.setRefund_price(rs.getInt(1));
				pb.setCancle_date(rs.getDate(2));
				pb.setRsno(rs.getInt(3));
				pb.setPaid_amout(rs.getInt(4));
				pb.setPay_name(rs.getString(5));
				pb.setImp_uid(rs.getString(6));
				pb.setApply_num(rs.getString(7));
				pb.setBank_name(rs.getString(8));
				pb.setBank_num(rs.getString(9));
				pb.setPay_method(rs.getString(10));
				pb.setPay_date(rs.getDate(11));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pb;
	}
	
	public int payCancle(PayBean paybean)  throws Exception{
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re=-1;

		try {
			sql="insert into cancle(rsno, refund_price, pay_name, cancle_date, rname, rphone) values(?,?,?,now(),?,?)";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, paybean.getRsno()); 
			pstmt.setInt(2, paybean.getRefund_price());
			pstmt.setString(3, paybean.getPay_name());
			pstmt.setString(4, paybean.getRname());
			pstmt.setString(5, paybean.getRphone());
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
	
	public ArrayList<PayBean> adminCancle(String pay_method) {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		ResultSet rs = null;
		ArrayList<PayBean> paybean = new ArrayList<PayBean>();
		
		try {
			if(pay_method.equals("m")) {
				sql=" select c.refund_price, c.cancle_date, p.*, c.rname from cancle c join pay p "
						+ "on c.rsno = p.rsno where pay_method='m' and cancled='n' order by cancle_date desc";
			}else {
				sql ="select c.refund_price, c.cancle_date, p.*, c.rname from cancle c join pay p "
						+ "on c.rsno = p.rsno where pay_method='c' and cancled='n' order by cancle_date desc";
			}
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				paybean.add(new PayBean(
						rs.getInt(1),
						rs.getDate(2),
						rs.getInt(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(12)));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }
		return paybean;
	}
	//예약 취소 완료 업데이트
	public int updateCancle(int rsno){
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re = -1;
		try {
			sql="update cancle set cancled='y', cancleOk_date=now(),rsno=null where rsno=?";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			pstmt.executeUpdate();
			re = 1;		
		}catch(Exception e){
			e.printStackTrace();
			re = -1;
		}finally {
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }
		return re;
	}
	public ArrayList<PayBean> adminCancleOk() {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		ResultSet rs = null;
		ArrayList<PayBean> paybean = new ArrayList<PayBean>();
		
		try {
			sql="select * from cancle where cancled='y' order by cancleOk_date DESC";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				paybean.add(new PayBean(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getDate(4),
						rs.getDate(6),
						rs.getString(7),
						rs.getString(8)));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }
		return paybean;
	}
	public int updateRsno(int rsno) {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re = -1;
		try {
			sql="update cancle set rsno=null where rsno=?";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			re=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }
		return re;
	}
	
	//예약 취소 완료 현황은 삼개월 동안 보관하다가 삭제
	public int deleteTMonth(){
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int re = -1;
		try {
			sql="delete from cancle where cancle_date=date_sub(now(), interval 3 month)";
			con=getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			con.setAutoCommit(true);
			re = 1;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }return re;
	}
}
