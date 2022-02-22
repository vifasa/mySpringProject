<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	
   #comment_image{
   	position : relative;
	bottom : 8px;
	width  : 30px;
	height : 30px;
	border-radius: 70%;
   	overflow: hidden;
   }
   
   #comment_image>img{
   		width: 100%;
    	height: 100%;
		object-fit: cover;
   }
	
   .comment_box{
      margin-top: 10px;
      border: 1px solid #cccccc;
     box-shadow: 1px 1px 5px #aaaaaa;
   }
   
   .comment_content_style{
      
      min-height: 50px;
      border: 1px solid #dddddd;
      /* box-shadow: -1px -1px 1px black; */
   }
   
   .page_box{
     display: inline-block;
     width: 20px;
     height: 22px;
     border: 1px solid gray;
     text-align: center;
    
  }
    
  a:hover, /* OPTIONAL*/
  a:visited,
  a:focus
  {text-decoration: none;}  
</style>


<script type="text/javascript">  
//덛글 지우기
function comment_delete(c_idx){
		
	if(confirm("정말 댓글을 삭제하시겠습니까?")==false)return;
		
	//ajax를 이용해서 삭제
	$.ajax({
		url	    : "${ pageContext.request.contextPath }/comment/comment_delete.do",
		data    : {"c_idx":c_idx},
		dataType: "json",
		success : function(result_data){
			if(result_data.result == 'fail'){
				alert('삭제오류.');
			}
			if(result_data.result == 'success'){
				alert('삭제되었습니다.');
				location.reload();
			}
		},
		error   : function(err){	
				alert("서버 오류..");
			}
		});
	}
</script>


</head>
<body>


  <c:forEach var ="c_vo"  items="${ c_list }">
	  <div class="comment_box">
	      
	      <!-- 로그인한 회원 이면.. -->
	      <c:if test="${ user.m_idx eq c_vo.m_idx }">
	      	<div style="text-align: right;"><input type="button"  value="x" onclick="comment_delete('${ c_vo.c_idx }');"></div>
	      </c:if>
		  <div id="comment_image"><img src="${ pageContext.request.contextPath }/resources/images/member/${c_vo.m_image}" onclick="show_user(${ c_vo.m_idx });"></div>
	      <div>${ c_vo.m_name} (${ c_vo.m_id })</div>
	      <div>${ c_vo.c_regdate }</div>
	      <div class="comment_content_style">${ c_vo.c_content }</div>
	  </div>
  </c:forEach>
</body>
</html>