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
//좋아요 처리
function m_like(a){
	location.href="m_like.do?m_idx="+a;
};
//싫어요 처리
function m_hate(a){
	location.href="m_hate.do?m_idx="+a;
};

</script>


</head>
<body onload="window.resizeTo(450,600)" style="width: 450px;height: 600px; position: relative; bottom: 55px;">

<form>
  <div id="box" style="width: 450px;height: 590px;">
   		<div class="panel panel-primary">
	      <div class="panel-heading"style="background-color: rgb(112,128,144)"><h4>회원정보</h4></div>
	      <div class="panel-body">
	          <table class="table table-striped">
	              
	                <tr>
	                   <td>
	                       <img src="${ pageContext.request.contextPath }/resources/images/member/${m_vo.m_image}">
	                   </td>
	               </tr>
	              
	               <tr>
	                   <td>이름:<a style="font-size: 15px">${ m_vo.m_name }</a></td>
	               </tr>
	               
	               <tr>
	                   <td>코맨트:${ m_vo.m_text }</td>
	               </tr>
	               
	               <tr>
	                   <td>e_mail:<a style="font-size: 15px">${ m_vo.m_mail }</a></td>
	               </tr>
	               
	               <tr>
	                   <td>point:<a style="font-size: 15px">${ m_vo.m_point }</a></td>
	               </tr>
	               
	               <tr>
	               	<td>
	               	   <input class="btn" type="button" value="좋아요" onclick="m_like(${m_vo.m_idx});">
	               	   <input class="btn" type="button" value="싫어요" onclick="m_hate(${m_vo.m_idx});">
	               	   <input class="btn  btn-primary"  type="button"  value="닫기" onclick="window.close()">
	               	</td>
	               </tr>
	               
	          </table>
	      </div>
	    </div>
  </div>
</form>


</body>
</html>