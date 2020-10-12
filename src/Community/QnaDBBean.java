package community;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class QnaDBBean {
	private static QnaDBBean instance=new QnaDBBean();
	   
	   public static QnaDBBean getInstance() {
	      return instance;
	   }
	   
	   public Connection getConnection() throws Exception{
		 	Connection con = null;
		 	String url = "jdbc:mysql://203.245.44.74:3306/allintonight?serverTimezone=UTC"; 
		    String user = "allintonight";
		    String pwd = "team1team1";
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);

		         
		         } catch (Exception e) { 
		            e.printStackTrace();
		         }
		      return con;
		   }

	   
	   public int insertQna(QnaBean qna) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      int number;
	      
	      try {
	         con=getConnection();
	         
	         sql="select max(no) from qna";
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            number = rs.getInt(1)+1;
	         }else {
	            number = 1;
	         }
	         
	         sql="insert into qna(no, name, password, email, title, content, date, secret, comment) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, number);
	         pstmt.setString(2, qna.getName());
	         pstmt.setString(3, qna.getPassword());
	         pstmt.setString(4, qna.getEmail());
	         pstmt.setString(5, qna.getTitle());
	         pstmt.setString(6, qna.getContent());
	         pstmt.setTimestamp(7, qna.getDate());
	         pstmt.setInt(8, qna.getSecret());
	         pstmt.setString(9, qna.getComment());
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
	   
	   public ArrayList<QnaBean> listQna(String pageNumber, String subject, String word){
	      Connection con=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      ResultSet pageset=null;
	      
	      int absolutepage=1;
	      int dbcount=0;
	      String sql="";
	      
	      ArrayList<QnaBean> qnaList=new ArrayList<QnaBean>();
	      
	      try {
	         con=getConnection();
	         stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	         pageset=stmt.executeQuery("select count(no) from qna");
	         
	         if(pageset.next()) {
	        	 dbcount=pageset.getInt(1);
	        	 pageset.close();
	         }
	         if(dbcount % QnaBean.pagesize ==0) {
	        	 QnaBean.pagecount = dbcount / (QnaBean.pagesize);
	         }else {
	        	 QnaBean.pagecount = dbcount / (QnaBean.pagesize)+1;	        	 
	         }
	         
	         if(pageNumber != null) {
	        	 QnaBean.pageNUM = Integer.parseInt(pageNumber);
	        	 absolutepage=(QnaBean.pageNUM-1)*QnaBean.pagesize+1;
	         }
	         
	         if(subject == null) {
	        	 sql="select * from qna order by no desc";
	         }else if(subject.equals("1")) {
        		 sql="select * from qna where title like '%"+word+"%' or content like '%"+word+"%'";
	         }else {
	        	 sql="select * from qna where name like '%"+word+"%'";
	         }
	         
	         rs = stmt.executeQuery(sql);
	         
	         if(rs.next()) {
	        	 rs.absolute(absolutepage);
	        	 int count=0;
	         
	         while(count < QnaBean.pagesize) {
	        	 QnaBean qna =new QnaBean();
	        	 qna.setNo(rs.getInt(1));
	        	 qna.setName(rs.getString(2));
	        	 qna.setPassword(rs.getString(3));
	        	 qna.setEmail(rs.getString(4));
	        	 qna.setTitle(rs.getString(5));
	        	 qna.setContent(rs.getString(6));
	        	 qna.setDate(rs.getTimestamp(7));
	        	 qna.setSecret(rs.getInt(8));
	        	 qna.setComment(rs.getString(9));
	          
	            
	            qnaList.add(qna);
	            
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
	      
	      return qnaList;
	   }
	   
	   public QnaBean getQna(int no) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      QnaBean qna=null;
	      
	      try {
	         con=getConnection();    
	         
	         sql="select * from qna where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	   qna = new QnaBean();
	               qna.setNo(rs.getInt(1));
	               qna.setName(rs.getString(2));
	               qna.setPassword(rs.getString(3));
	               qna.setEmail(rs.getString(4));
	               qna.setTitle(rs.getString(5));
	               qna.setContent(rs.getString(6));
	               qna.setDate(rs.getTimestamp(7));
	               qna.setSecret(rs.getInt(8));
	               qna.setComment(rs.getString(9));
	               
	              
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
	      
	      return qna;
	   }
	   
	   public int deleteQna(int no, String password) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="";
	      String pwd="";
	      int re=-1;
	      
	      try {
	         con=getConnection();
	         sql="select password from qna where no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            pwd = rs.getString(1);
	            
	            if(!pwd.equals(password)) {
	               re=0;
	            }else {
	               sql="delete from qna where no=?";
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
	   public int editQna(QnaBean qna) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="";
			String pwd="";
			int re=-1;
					
			try {
				con=getConnection();
				sql="select password from qna where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, qna.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pwd=rs.getString(1);
			 
				if(!pwd.equals(qna.getPassword())) {
					re = 0;
				}else {
					sql="update qna set Title = ?, Content = ?, Secret = ? where no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, qna.getTitle());
					pstmt.setString(2, qna.getContent());
					pstmt.setInt(3, qna.getSecret());
					pstmt.setInt(4, qna.getNo());
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
	   public String secretQna(QnaBean qna) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="";
			String pwd="";
			int re=-1;
					
			try {
				con=getConnection();
				sql="select password from qna where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, qna.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pwd=rs.getString(1);
			 		
						
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
			return pwd;
		}
	   
	   public int commentQna(String comment, int no) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="";
			int re=-1;
					
			try {
				con=getConnection();
				sql="update qna set Comment = ? where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, comment);
				pstmt.setInt(2, no);
				pstmt.executeUpdate();
				re = 1;
			
				
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