package community;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class PostDBBean {
	private static PostDBBean instance=new PostDBBean();
	   
	   public static PostDBBean getInstance() {
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
	         
	         sql="insert into post(no, name, password, email, title, content, upload_file, date) values(?, ?, ?, ?, ?, ?, ?, ?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, number);
	         pstmt.setString(2, post.getName());
	         pstmt.setString(3, post.getPassword());
	         pstmt.setString(4, post.getEmail());
	         pstmt.setString(5, post.getTitle());
	         pstmt.setString(6, post.getContent());
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
	   
	   public ArrayList<PostBean> listPost(String pageNumber, String subject, String word){
	      Connection con=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      ResultSet pageset=null;	      
	     
	      int absolutepage=1;//ÆäÀÌÂ¡ º¯¼ö
	      int dbcount=0;
	      String sql="";
	     
	      ArrayList<PostBean> postList=new ArrayList<PostBean>();
	      
	      
	      try {
	         con=getConnection();
	         stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	         pageset=stmt.executeQuery("select count(no) from post");
	         
	         if(pageset.next()) {
	        	 dbcount=pageset.getInt(1);
	        	 pageset.close();
	         }
	         if(dbcount % PostBean.pagesize ==0) {
	        	 PostBean.pagecount = dbcount / (PostBean.pagesize);
	         }else {
	        	 PostBean.pagecount = dbcount / (PostBean.pagesize)+1;	        	 
	         }
	         
	         if(pageNumber != null) {
	        	 PostBean.pageNUM = Integer.parseInt(pageNumber);
	        	 absolutepage=(PostBean.pageNUM-1)*PostBean.pagesize+1;
	         }
	         
	         if(subject == null) {
	        	 sql="select * from post order by no desc";
	         }else if(subject.equals("1")) {
        		 sql="select * from post where title like '%"+word+"%' or content like '%"+word+"%' desc";
	         }else {
	        	 sql="select * from post where name like '%"+word+"%' desc";
	         }
	        
	         rs = stmt.executeQuery(sql);
	         
	         if(rs.next()) {
	        	 rs.absolute(absolutepage);
	        	 int count=0;
	         
	         while(count < PostBean.pagesize) {
	        	 PostBean post=new PostBean();
	        	 post.setNo(rs.getInt(1));
	        	 post.setName(rs.getString(2));
	        	 post.setPassword(rs.getString(3));
	        	 post.setEmail(rs.getString(4));
	        	 post.setTitle(rs.getString(5));
	        	 post.setContent(rs.getString(6));
	        	 post.setUpload_file(rs.getString(7));                     
	        	 post.setDate(rs.getTimestamp(8));
	          
	            
	            postList.add(post);
	            
	            if(rs.isLast()) {
	            	break;
	            	}else {
	            		rs.next();
	            	}
	            	count++;
	            }
	         } 
	        	      
	      }catch(Exception e){
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
	         sql="select * from post where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	   post = new PostBean();
	               post.setNo(rs.getInt(1));
	               post.setName(rs.getString(2));
	               post.setPassword(rs.getString(3));
	               post.setEmail(rs.getString(4));
	               post.setTitle(rs.getString(5));
	               post.setContent(rs.getString(6));
	               post.setUpload_file(rs.getString(7));  
	               post.setDate(rs.getTimestamp(8));
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
	               sql="delete from post where no=?";
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
					sql="update post set Password=?, Title = ?, Content = ?, Upload_file=? where no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, post.getPassword());
					pstmt.setString(2, post.getTitle());
					pstmt.setString(3, post.getContent());
					pstmt.setString(4, post.getUpload_file());
					pstmt.setInt(5, post.getNo());
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
			}return re;
			
		}


		public int searchPost(String word) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int no=0;
			String sql="";
					
			try {
				con=getConnection();
				sql="select no from post where name=? and content=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, word);
				pstmt.setString(2, word);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					no=rs.getInt(1);
			 
				}else {
					no=0;
				
			}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}return no;
			
		
	}
}


	

