package community;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;



public class PostDBBean {
	private static PostDBBean instance=new PostDBBean();
	   
	   public static PostDBBean getInstance() {
	      return instance;
	   }
	   
	   public Connection getConnection() throws Exception{
		   Connection con = null;
		      String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC"; 
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

	   
	   public int insertPost(PostBean post) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      int number;
	      
	      try {
	         con=getConnection();
	         
	         sql="select max(no) from post";
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            number = rs.getInt(1)+1;
	         }else {
	            number = 1;
	         }
	         
	         sql="insert into post(no, name, password, email, title"
	               + ", content, upload_file, date) values(?, ?, ?, ?, ?, ?, ?, ?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, number);
	         pstmt.setString(2, HanConv.toKor(post.getName()));
	         pstmt.setString(3, post.getPassword());
	         pstmt.setString(4, post.getEmail());
	         pstmt.setString(5, HanConv.toKor(post.getTitle()));
	         pstmt.setString(6, HanConv.toKor(post.getContent()));
	         pstmt.setString(7, post.getUpload_file());
	         pstmt.setTimestamp(8, post.getDate());
	         
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return 1;
	   }
	   
	   public ArrayList<PostBean> listpost(){
	      Connection con=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      
	      ArrayList<PostBean> postList=new ArrayList<PostBean>();
	      
	      try {
	         con=getConnection();
	         stmt = con.createStatement();
             String sql="select * from post order by no";
	        
	         rs = stmt.executeQuery(sql);
	         
	         while(rs.next()) {
	        	 PostBean post=new PostBean();
	        	 post.setNo(rs.getInt(1));
	        	 post.setPassword(rs.getString(2));
	        	 post.setName(rs.getString(3));
	        	 post.setEmail(rs.getString(4));
	        	 post.setTitle(rs.getString(5));
	        	 post.setContent(rs.getString(6));
	        	 post.setUpload_file(rs.getString(7));                     
	        	 post.setDate(rs.getTimestamp(8));
	          
	            
	            postList.add(post);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(stmt != null) stmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return postList;
	   }
	   
	   public PostBean getPost(int no) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      PostBean post=null;
	      
	      try {
	         con=getConnection();
	         sql="update post set no=no+1 where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         pstmt.executeUpdate();
	         pstmt.close();
	         
	         sql="select * from post where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	               post .setNo(rs.getInt(1));
	               post .setName(rs.getString(2));
	               post .setEmail(rs.getString(3));
	               post .setTitle(rs.getString(4));
	               post .setContent(rs.getString(5));
	               post .setDate(rs.getTimestamp(5));
	               post .setPassword(rs.getString(7));
	               post .setUpload_file(rs.getString(8));  
		         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return post;
	   }
	   
	   public int deletePost(int no, String password) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="";
	      String pwd="";
	      int re=-1;
	      
	      try {
	         con=getConnection();
	         sql="select password from post where no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            pwd = rs.getString(1);
	            
	            if(!pwd.equals(password)) {
	               re=0;
	            }else {
	               sql="delete post where no=?";
	               pstmt=con.prepareStatement(sql);
	               pstmt.setInt(1, no);
	               pstmt.executeUpdate();
	               re=1;
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      return re;
	   }
		public int editPost(PostBean post) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="";
			String pwd="";
			int re=-1;
					
			try {
				con=getConnection();
				sql="select password from post where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, post.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pwd=rs.getString(1);
			 
				if(!pwd.equals(post.getPassword())) {
					re = 0;
				}else {
					sql="update post set Title = ?, Content = ? where no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(post.getTitle()));
					pstmt.setString(2, HanConv.toKor(post.getContent()));
					pstmt.setInt(3, post.getNo());
					pstmt.executeUpdate();
					re = 1;
				}
			
				
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}
	}

	

