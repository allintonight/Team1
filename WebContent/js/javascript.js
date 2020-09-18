$('.phone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});

$(function(){ $("#alert-success").hide(); 
			  $("#alert-danger").hide();
			  $("input").keyup(function(){ 
				  var pwd1=$("#pwd1").val(); 
				  var pwd2=$("#pwd2").val(); if(pwd1 != "" || pwd2 != "")
				  { if(pwd1 == pwd2){ $("#alert-success").show(); 
				  $("#alert-danger").hide(); 
				  $("#submit").removeAttr("disabled"); 
				  }else{ $("#alert-success").hide(); 
				  $("#alert-danger").show(); 
				  $("#submit").attr("disabled", "disabled");
				  } 
			} 
		}); 
	});
