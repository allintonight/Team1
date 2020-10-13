package Community;


import java.sql.Timestamp;

public class QnaBean {
	private int no;
	private String name;
	private String password;
	private String email;	
	private String title;
	private String content;
	private Timestamp date;
	private int secret;
	private String comment;
	
	   public static int pagesize=10;
	   public static int pagecount = 1;
	   public static int pageNUM = 1;
	   
	   
	   public static String pageNumber(int limit) {
		   String str="";
		   int temp=(pageNUM-1) % limit;
		   int startPage = pageNUM - temp;
		   
		   if((startPage-limit)>0) {
			   str = "<a href='qna_list.jsp?pageNUM="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		   }
		   for(int i = startPage; i<(startPage+limit);i++) {
			   if(i==pageNUM) {
				   str += "["+i+"]&nbsp;&nbsp;";
			   }else {
				   str += "<a href='qna_list.jsp?pageNUM="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			   }
			   if(i >= pagecount) break;
		   }
		   if((startPage+limit) <= pagecount) {
			   str += "<a href='qna_list.jsp?pageNUM="+(startPage+limit)+"'>[다음]</a>";
			   
		   }
		   
		   return str;
	   }
	   
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}   
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
}
