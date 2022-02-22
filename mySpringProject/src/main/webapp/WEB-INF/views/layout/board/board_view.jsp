<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>     
    
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
       margin-top: 20px; 
   }
   
   #user_img{
   		position : relative;
		width  : 45px;
		height : 45px;
		border-radius: 70%;
    	overflow: hidden;
   }
   
   #content_type{
       width: 100%;
       min-height: 100px; 
       height: auto;
       border: 1px solid #cccccc;
       padding: 5px;
   }
   
   /* 댓글입력창 */
   textarea#comment_content{
       
       width:  80%;
       height: 80px;
       resize: none;
       float:left;
       margin-bottom: 10px;
   }
   
   #comment_button{
       width:  20%;
       height: 80px;
       float:left;
   }
   
   #comment_display{
   
       clear:both;
       margin-top: 50px;
   }
   
   
   
</style>


<script type="text/javascript">
  
  var comment_page=1;
  
  
  function board_delete(){
	  
	  if(confirm("정말 삭제 하시겠습니까?")==false) return;
	  
	  //삭제      
	  location.href="board_delete.do?b_idx=${ vo.b_idx }&ca_idx=${vo.ca_idx}";
  }
  
  //로그인 기능 처리
  function show_login(){window.open("${ pageContext.request.contextPath }/member/login_form.do","로그인 창", "width=400, height=300,left=100,top=0");}
  
  //좋아요 처리
  function b_like(){
	location.href="b_like.do?b_idx=${vo.b_idx}&m_idx=${vo.m_idx}";
  }
  //싫어요 처리
  function b_hate(){
	location.href="b_hate.do?b_idx=${vo.b_idx}&m_idx=${vo.m_idx}";
  }
  
  //댓글달기
  function  add_comment(){
	  
	   //로그인 여부 체크
	   if("${ empty user }" == "true"){
		   
		   if(confirm("로그인 하신후 댓글쓰기가 가능합니다\n로그인 하시겠습니까?")==false)return;
		   
		   //로그인 폼
		   show_login();
		   return;
	   }
	   

	   var c_content = $("#comment_content").val().trim();
	   
	   if(c_content==''){
		   alert('댓글을 입력하세요');
		   $("#comment_content").val("");
		   $("#comment_content").focus();
		   return;
	   }
	   
	   $.ajax({
		   url	: "../comment/comment_insert.do",
		   data : {
			       "c_content" : c_content, 
			       "m_idx":"${ user.m_idx }", 
			       "m_id":"${ user.m_id}",
			       "m_name":"${ user.m_name}",
			       "b_idx" :"${ vo.b_idx }",
			       "m_image" :"${user.m_image}"
		          },
		    dataType: "json",
		    success : function(result_data){
		    	
		    	if(result_data.result =='fail'){
		    		alert("댓글쓰기 실패");
		    		return;
		    	}
		    	
		    	//성공했으면
		    	comment_list(1);
		    	
		    	
		    	//입력값 지우기
		    	$("#comment_content").val("");
		    },
		    error   : function(err){
		    	alert(err.responseText);
		    }
	   });

  }

  
  //댓글목록 가져오기
  function comment_list(page){
	  
	  comment_page = page;
	  
	  //ajax요청
	  $.ajax({
		  url	: "${ pageContext.request.contextPath }/comment/comment_list.do",
		  data	: {"b_idx":"${ vo.b_idx }" , "page": page },
		  success: function(result_data){
			  
			  $("#comment_display").html(result_data);
			  
		  },
		  error  : function(err){
			  
			  alert(err.responseText);
			  
		  }
	  });
  }
  
  
  //jQuery초기화
  $(document).ready(function(){
	  
	  comment_list(1);
	  
  });
  
  

</script>

</head>
<body>
  <div id="box">
  	    
  	    <div class="panel panel-primary" >
	      <div class="panel-heading"style="background-color: rgb(112,128,144)"><h3 style="text-align: center;">${ vo.b_title }</h3></div>
	      <div class="panel-body">
	          <table class="table">
	               
	               <!-- 제목 -->
	               <tr>
	                   <th width="20%"><a onclick="show_user(${ vo.m_idx });"><img id="user_img" src="${ pageContext.request.contextPath }/resources/images/member/${vo.m_image}"></a></th>
	                   <td>${ vo.m_name }</td>
	               </tr>
	               
	               <!-- 내용 -->
	               <tr>
	                   <td colspan="2">
	                      <div id="content_type">${ vo.b_content }</div>
	                   </td>  
	               </tr>
	               
	               <tr>
	                   <th>작성일자</th>
	                   <td>${ vo.b_regdate }</td>
	               </tr>
	               
	               <tr>
	                  <td colspan="2"  align="center">
	                        
	                        <input class="btn  btn-success" type="button"  value="(${ vo.b_like })좋아요" 
	                               onclick="b_like();">
	                        <input class="btn  btn-success" type="button"  value="(${ vo.b_hate })싫어요" 
	                               onclick="b_hate();">
	                       
	                        
	                        <!-- 글쓴이 본인만 처리되도록 -->
	                        <c:if test="${ user.m_idx == vo.m_idx }">
		                        <input class="btn  btn-info"    type="button"  value="수정하기" 
		                               onclick="location.href='modify_form.do?b_idx=${ vo.b_idx }&ca_idx=${ vo.ca_idx }'">
		                        <input class="btn  btn-danger"  type="button"  value="삭제하기" 
		                               onclick="board_delete();">
	                        </c:if>
	                  
	                  </td>
	               </tr>
	               
	          </table>
	      </div>
	    </div><!--End Panel  -->
	    
	    <!-- 댓글입력창 -->
	    <div>
	        <textarea id="comment_content" placeholder="댓글은 로그인후에 작성가능합니다"></textarea>
	        <input    id="comment_button"  type="button" value="댓글달기" onclick="add_comment();">    
	    </div>
	    
	    <hr>
	    
	    <!-- 댓글출력창  -->
	    <div id="comment_display">
	        
	    </div>
	    
	    
  </div><!-- End Box -->
</body>
</html>