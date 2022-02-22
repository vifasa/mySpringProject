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
	    width: 800px;
	    margin: auto;
	    margin-top: 50px; 
	}
	
	#m_id_message{
	   color: red;
	}

</style>


<script type="text/javascript">
  
 
//회원가입버튼클릭시
function member_modify(f){
	   
	   //입력값 체크
	   var image		=  f.image.value;
	   var m_name   	=  f.m_name.value.trim();
	   var m_pwd    	=  f.m_pwd.value.trim(); 
	   var ch_pwd       =  f.ch_pwd.value.trim();
	   
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
	   
	   if(m_pwd != ch_pwd){
		   alert('비밀번호를 확인하세요');
		   f.m_pwd.value='';
		   f.ch_pwd.value='';
		   f.m_pwd.focus();
		   return;
	   }
	   
	   if(confirm("수정시 다시 로그인 하셔야 합니다.")==false){
		   return;
	   }
	   
	   f.action = "member_modify.do";  //MemberModifyAction
	   f.submit();
	   
}
   
   //jQuery초기화
   $(document).ready(function(){
	   
	   //회원구분 값 설정
	   $("select[name='m_grade']").val('${ user.m_grade }');

   });
   
   

</script>


</head>
<body>

<form  method="post" enctype="multipart/form-data">
  <input type="hidden"  name="m_idx"  value="${ user.m_idx }">
  <div id="box">
   		<div class="panel panel-primary">
	      <div class="panel-heading"style="background-color: rgb(112,128,144)"><h4>회원수정</h4></div>
	      <div class="panel-body">
	          <table class="table table-striped">
	              
	                <tr>
	                   <th>회원 이미지</th>
	                   <td>
	                       <img src="${ pageContext.request.contextPath }/resources/images/member/${user.m_image}">
	                       <input id="image" name="image" type="file">
	                   </td>
	               </tr>
	              
	               <tr>
	                   <th>이름</th>
	                   <td><input name="m_name"  value="${ user.m_name }"></td>
	               </tr>
	               
	               <tr>
	                   <th>아이디</th>
	                   <td>
	                      <input name="m_id"  value="${ user.m_id }"  readonly="readonly">
	                   </td>
	               </tr>
	               
	               <tr>
	                   <th>비밀번호</th>
	                   <td><input type="password" name="m_pwd"  value="${ user.m_pwd }"></td>
	               </tr>
	               
	               <tr>
	                   <th>비밀번호 확인란</th>
	                   <td><input type="" name="ch_pwd"  value=""></td>
	               </tr>      
	               
	               <tr>
	                   <th>코맨트</th>
	                   <td><input name="m_text"  id="m_text" value="${ user.m_text }"></td>
	               </tr>
	               
	               <tr>
	                   <th>이메일</th>
	                   <td><input name="m_mail"  id="m_mail"  size="70" value="${ user.m_mail }"></td>
	               </tr>
	               
	               <tr>
	                   <th>회원 point :</th>
	                   <td>${ user.m_point }</td>
	               </tr>
	               
	               <tr>
	                   <th>회원구분</th>
	                   <td>
	                       <select name="m_grade">
	                           <option value="일반">일반</option>
	                           <option value="관리자">관리자</option>
	                       </select>
	                   </td>
	               </tr>
	               
	               
	               
	               <tr>
	                    <td colspan="2" align="center">
	                         <input class="btn  btn-primary"  type="button"  value="회원수정" 
	                                onclick="member_modify(this.form);">
	                    </td>
	               </tr>
	               
	          </table>
	      </div>
	    </div>
  </div>
</form>


</body>
</html>