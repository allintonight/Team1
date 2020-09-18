function check_ok(){
		if(document.form.name.value.length==0){
			alert("작성자를 써주세요")
			reg_frm.name.focus();
			return;
		}
		else if(document.form.title.value.length==0){
			alert("제목을 써주세요")
			reg_frm.title.focus();
			return;
		}
		else if(document.form.content.value.length==0){
			alert("내용을 써주세요")
			reg_frm.content.focus();
			return;
		}
	
		document.form.submit();
}