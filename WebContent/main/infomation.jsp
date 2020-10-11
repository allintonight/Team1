<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type ="text/javascript" src="../js/javascript.js" defer> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../bootstrap/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
	<script src="https://kit.fontawesome.com/9db93bd103.js" crossorigin="anonymous"></script>
</head>
<style>
	.accordion{
		margin-top:10%;
	}
	.card-header{
		background-color:#585858;
	}
</style>
<body>
<div class="container">
<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne" >
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="color:#fff;">
         	CODIV-19에 관한 공지 사항
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
      	<div class="container">
      		<div class="container row">
      			<div class="col-lg">
      			<img class="w-100 p-3 h-100 d-inline-block" src="../img/main_img/codiv-19(1).png">
      			</div>
      			<div class="col-lg">
      			<img class="w-100 p-3 h-100 d-inline-block" src="../img/main_img/codiv-19(2).png">
      			</div>
      		</div>
      		<p class="text-sm-left" style="color:#616161;">
      			TEAM1펜션에서는 안심 방역 및 직원들의 마스크 착용을 의무화 하고 있습니다.
      		</p>
      	</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="color:#fff;">
          펜션 이용 공지사항
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
      	<div class="container text-left">
      		예약공지<br>
			- 최대인원을 초과하여 이용하실 수 없으며 현장에서 입실 거부될 수 있습니다.(환불불가) <br>
			- 다른 이용객을 위하여 애완동물의 동반입실은 불가합니다.<br>
			- 미성년자는 보호자 동반없이 이용하실 수 없습니다.<br>
			- 객실및주변 시설 이용 시 시설물의 훼손, 분실에 대한 책임은 고객님에게 있으니 주의하시기 바랍니다<br>
			- 집기 파손 시 파손 물품에 대해서 실구입가 기준으로 변상을 해야 할 수 있으니 유의바랍니다.<br>
			- 개인적으로 준비해오시는 취사도구(그릴, 숯, 전기/전열기구)는 안전과 관리상의 문제로 절대 반입 금지입니다.<br>    
			- 객실 내 흡연은 금지되며, 지정된 장소에서 이용바랍니다.<br>
			- 객실 내에서 생선이나 고기 등을 굽는 직화 방식은 허용되지 않습니다.<br>
			- 유의사항 미숙지로 인한 입실불가,예약취소,환불요구 등은 귀책사유이므로 필히 숙지 후 예약하시기 바랍니다.<br>	
      	</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="color:#fff;">
          Collapsible Group Item #3 <!-- 뭘로 하면 좋을지 .. 같이 정하기:) -->
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
</div>			
</div>
</body>
</html>