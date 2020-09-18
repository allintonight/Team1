package community;

import java.sql.Timestamp;

public class PostBean {

   private int no;
   private String name;
   private String email;
   private String title;
   private String content;
   private String password;
   private String upload_file;   
   private Timestamp date;
   
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
	return email;
   }
   public void setEmail(String email) {
	this.email = email;
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
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getUpload_file() {
      return upload_file;
   }
   public void setUpload_file(String upload_file) {
      this.upload_file = upload_file;
   }
   public Timestamp getDate() {
      return date;
   }
   public void setDate(Timestamp date) {
      this.date = date;
   }
}