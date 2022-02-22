<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 다음우편번호 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<style type="text/css">
	#box{
	    width: 700px;
	    margin: auto;
	    margin-top: 50px; 
	}
	
	#m_id_message{
	   color: red;
	}

</style>


<script type="text/javascript">
   $(document).ready(function(){
	   
	   $("#m_id").keyup(function(event){
		   
		   var m_id = $(this).val();
		   console.log(m_id);
		   
		   if(m_id.length<3){
			   $("#m_id_message").html("아이디는 3자리 이상 영문자/숫자조합 이어야 합니다").css("color","red");

			   $("#bt_register").attr("disabled", true);
			   return;
		   }
		   
		   $.ajax({
			   url		: 'check_id.do',		
			   data 	: {'m_id': m_id},       
			   dataType	: 'json',					   
			   success	: function(result_data){
				   
				   if(result_data.result){
					  
					   $("#m_id_message").html("사용가능한 아이디 입니다").css("color","blue");
					   
					  
					   $("#bt_register").attr("disabled", false);
					   
				   }else{
					
					   $("#m_id_message").html("이미 사용중인 아이디 입니다").css("color","red");
					   
			
					   $("#bt_register").attr("disabled", true);
				   }
			   },  
			   error	: function(err){
				   alert(err.responseText);
			   }
		   });
	   });
   });
   
   
   
   
   //회원가입버튼클릭시
   function  send(f){
	   
	   var ch_mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
	   //입력값 체크
	   var m_name   	=  f.m_name.value.trim();
	   var m_pwd    	=  f.m_pwd.value.trim(); 
	   var m_pwd_ch    	=  f.m_pwd_ch.value.trim(); 
	   var m_mail		=  f.m_mail.value.trim();
	   
	   if(m_name==''){
		   alert('이름을 입력하세요');
		   f.m_name.value='';
		   f.m_name.focus();
		   return;
	   }
	   
	   if(m_pwd==''){
		   alert('비밀번호를 입력하세요');
		   f.m_pwd.value='';
		   f.m_pwd.focus();
		   return;
	   }
	   
	   if(m_pwd!=m_pwd_ch){
		   alert('비밀번호가 일치하지 않습니다.');
		   f.m_pwd.value='';
		   f.m_pwd.focus();
		   f.m_pwd_ch.value='';
		   f.m_pwd_ch.focus();
		   return;
	   }
	   
	   
	   if(m_mail==''){
		   alert('e-mail을 입력하세요');
		   f.m_mail.value='';
		   f.m_mail.focus();
		   return;
	   }
	   
	   if(!ch_mail.test(m_mail)){
		   alert('e-mail 양식을 맞춰 주세요')
		   f.m_mail.value='';
		   f.m_mail.focus();
		   return;
	   }
	   
	   f.action = "insert.do"; 
	   f.submit();
	   
   }


</script>


</head>
<body>

<form>
  <div id="box">
   		<div class="panel panel-primary">
	      <div class="panel-heading" style="background-color: rgb(112,128,144)"><h4>회원가입</h4></div>
	      <div class="panel-body">
	          <table class="table table-striped">
	               <tr>
	                   <th>이름</th>
	                   <td><input name="m_name"></td>
	               </tr>
	               
	               <tr>
	                   <th>아이디</th>
	                   <td>
	                      <input name="m_id"  id="m_id">
	                      <span id="m_id_message"></span>   
	                   </td>
	               </tr>
	               
	               <tr>
	                   <th>비밀번호</th>
	                   <td><input type="password" name="m_pwd"></td>
	               </tr>
	               
	                <tr>
	                   <th>비밀번호 확인</th>
	                   <td><input type="password" name="m_pwd_ch"></td>
	               </tr>
	               
	               
	               <tr>
	                   <th>e-mail</th>
	                   <td><input name="m_mail"  id="m_mail"  size="70"></td>
	               </tr>
	               
	               <tr>
	                    <td colspan="2" align="center">
	                         <input class="btn"  type="button"  value="회원가입"  id="bt_register" disabled="disabled"
	                                onclick="send(this.form);"> 
	                         <input class="btn"  type="button"  value="메인보기"
	                                onclick="location.href='../main.do'" >
	                    </td>
	               </tr>
	               
	          </table>
	      </div>
	    </div>
  </div>
</form>


</body>
</html>