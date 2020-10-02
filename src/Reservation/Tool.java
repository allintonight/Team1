package Reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Tool {
	private static Tool instance = new Tool();

	public static Tool getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection con = null;
		String url = "jdbc:mysql://203.245.44.74:3306/allintonight?serverTimezone=UTC"; 
		String user = "allintonight";
		String pwd = "team1team1";
		
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pwd);
			
			} catch (Exception e) { 
				e.printStackTrace();
			}
		return con;
	}
	
	public int getPage() {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		
		String sql="select count(*) cnt from reservation where paid='n' and pay_ment='m';";
		
		try {
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}	