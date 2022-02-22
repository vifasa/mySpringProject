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

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->


<style type="text/css">
  #box{
      width: 1000px;
      margin: auto;
      margin-top: 50px;
  }
  
  #title{
      text-align: center;
      font-size: 35px;
      font-family: 굴림체;
      font-weight: bold;
      
      color: #6699cc;
      
      text-shadow: 1px 1px 1px black;
  }
  
  th,td{
     text-align: center;
  }
  
  
  #page_menu{
      font-size: 20px;
      font-weight: bold;
  }
  
  #search_menu{
      text-align: center;
      margin-top: 1px;
      margin-bottom: 1px;
  }
  
  #search_text{
  	width: 800px;
  	height: 32px;
  	font-size: 15px;
  	board: 0;
  	border-radius: 15px;
  	outline: none;
  	padding-left: 10px;
  	background-color: rgb(233, 233, 233);
  }
  
    
  a:hover, /* OPTIONAL*/
  a:visited,
  a:focus
  {text-decoration: none;}  
    
  
</style>

<script type="text/javascript">

	

   $(document).ready(function(){

	   $("#search_text").keyup(function(){
		   var k = $(this).val();
		   $("#category_table > tbody > tr").hide();
		   var temp = $("#category_table > tbody > tr > td:nth-child(3n+2):contains('"+k+"')");
		   
		   $(temp).parent().show();
	   });

   });
   
   function addFavorites(a){
	   
	   var ca_idx  = a;
	   var m_idx   = $("#m_idx").val();	  
	   location.href="../member/favorites_insert.do?ca_idx="+ca_idx+"&m_idx="+m_idx;
   }
   
   function deleteFavorites(a){
	   var ca_idx  = a;
	   var m_idx   = $("#m_idx").val();	
	   location.href="../member/favorites_delete.do?ca_idx="+ca_idx+"&m_idx="+m_idx
   }
   
   function goInsert(){
		location.href="category_insert_form.do";
   }
  

</script>



</head>
<body>
	
     <!-- 검색메뉴 -->
	<div id="search_menu" style="margin-top: 12px;">
		<input id="search_text">
	</div>   
	
  <div id="box">
         
        <!-- 관리자 일경우 -->
       <c:if test="${ user.m_grade eq '관리자' }">
       		<input type="button" value="개시판 추가" onclick="goInsert();">
       </c:if>
       
             
       <!-- 카테고리내용 -->
       <table id="category_table" class="table  table-striped  table-hover">
       
       
   	   <!-- 데이터가 없는 경우 -->
             <c:if test="${ empty list }">
                 <tr>
                    <td colspan="5" align="center">
                       <font color="red">개시판이 없습니다</font>
                    </td>
                 </tr>
             </c:if>
        
             <!-- 데이터가 있는 경우 -->
             <!-- for(BoardVo vo : list)  -->
        
             <input id="m_idx" type="hidden" value="${ user.m_idx }">
             <c:forEach var="vo"  items="${ list }">
                <tbody>
		                <tr>
		                    <td><img alt="카테고리" src="${ pageContext.request.contextPath }/resources/images/category/${vo.ca_image}"
		                   		 width="80px" height="90px"></td>
		                    <td><input id="ca_name" type="hidden" value="${ vo.ca_name }"><a href="${ pageContext.request.contextPath }/board/board_list.do?ca_idx=${ vo.ca_idx }&ca_name=${ vo.ca_name }">${ vo.ca_name }</a></td>
		                    <td>${ vo.ca_text }</td>
		                    <td> 
		                    	<c:if test="${ not empty user }">
		                    	
		        
		                    		<c:set var="f" value="n"/>
		                    		<!-- 구독이 되어 있을시 -->
		                    		<c:forEach var="fvo" items="${ f_list }">
			                    		<c:if test="${ fvo.ca_idx eq vo.ca_idx }">
	                						<c:set var="f" value="y"/>
	                					</c:if>
	                				</c:forEach>
	                					<c:if test="${ f eq 'y' }">
	                						<input type="button" value="구독취소" onclick="deleteFavorites(${ vo.ca_idx });">
	                					</c:if>  
	                				  	<c:if test="${ f eq 'n' }">
	                				  		<input type="button" value="구독" onclick="addFavorites(${ vo.ca_idx });">
	                				  	</c:if>		
	                				  			
                				</c:if>
                			</td>
		                </tr>
                </tbody>	
             </c:forEach>   
   
       </table>   
  </div>  
</body>
</html>











