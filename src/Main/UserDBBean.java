package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDBBean {
	
private static UserDBBean instance = new UserDBBean();
	
	public static UserDBBean getinstance() {
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

	public int insertMember(UserBean userbean) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql=null;
		
			try {
				sql = "insert into member"
						+ " values(0,?,?,?,?,?);";
				con = getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, userbean.getId());
				pstmt.setString(2, userbean.getPassword());
				pstmt.setString(3, userbean.getName());
				pstmt.setString(4, userbean.getEmail());
				pstmt.setString(5, userbean.getPhone());
				pstmt.executeUpdate();
				re=1;
				System.out.println("추가 성공");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("추가 실패");
			}return re;
	}
	
	public int checkid(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql=null;
		ResultSet rs=null;
		try {
			sql="select id from member where id=?";
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				re = 1; //있으면 1
			}else {
				re = -1; //없으면 -1
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public int login(String id, String password) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		ResultSet rs=null;
		String sql=null;
		String pwd = null;
		try {
			sql = "select password from member where id=?";
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pwd = rs.getString(1);
				if(id.equals("admin")&&pwd.equals(password)) {
					re = 1;
				}else if(pwd.equals(password)){
					re = 0;
				}else {
					re=-1;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	//회원정보 및 예약시 사용 
	@SuppressWarnings("null")
	public UserBean memberInfo(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql=null;
		UserBean user = null;
		try {
			sql="select * from member where id=?;";
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				user = new UserBean();
				user.setMno(rs.getInt(1));
				user.setId(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setName(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setPhone(rs.getString(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(id);
			System.out.println(rs.getInt(1)+rs.getString(2)+rs.getString(3));
		}
		return user;
	}
	
	@SuppressWarnings("null")
	public int updateAccount(String password, String email, String phone, String id){
		Connection con = null;
		Statement stmt = null;
		int re=-1;
		String sql=null;
		try {
				sql="update member set password='"+password+"', email='"+email+"', phone='"+phone+"' where id='"+id+"';";
				con=getConnection();
				stmt=con.prepareStatement(sql);
				stmt.executeUpdate(sql);
				re = 1;
			
		}catch(Exception e) {
			e.printStackTrace();
			re = -1;
		}finally {
	        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	        if (con != null) try { con.close(); } catch(SQLException ex) {}
	    }
		return re;
	}
}	



