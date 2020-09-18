package Room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomDBBean {
	
	private static RoomDBBean instance = new RoomDBBean();

	public static RoomDBBean getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/team1?serverTimezone=UTC"; 
		String user = "root";
		String pwd = "1234";
		
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pwd);
			
			} catch (Exception e) { 
				e.printStackTrace();
			}
		return con;
	}
	
	public ArrayList<RoomBean> getAll() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql=null;
		ResultSet rs=null;
		
		ArrayList<RoomBean> roomBean = new ArrayList<RoomBean>();
		
		try {
			sql="select * from room;";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				roomBean.add(new RoomBean(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)
										, rs.getInt(5), rs.getInt(6)));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return roomBean;
		
	}
}