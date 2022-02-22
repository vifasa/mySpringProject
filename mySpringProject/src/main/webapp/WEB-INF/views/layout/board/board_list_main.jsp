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
      text-align: right;
      margin-top: 2px;
      margin-bottom: 5px;
  }
  
  .page_box{
     display: inline-block;
     width: 30px;
     height: 30px;
     border: 1px solid gray;
    
  }
    
  a:hover, /* OPTIONAL*/
  a:visited,
  a:focus
  {text-decoration: none;}  
    
  
</style>


<script type="text/javascript">
   
   function insert_form(){
	   
	   //로그인 여부 체크
	   if("${ empty user }" == "true"){
		   
		   if(confirm("로그인 하신후 글쓰기가 가능합니다\n로그인 하시겠습니까?")==false)return;
		   
		   //로그인 폼
		   window.open("${ pageContext.request.contextPath }/member/login_form.do","로그인 창", "width=400, height=300,left=100,top=0");
		   return;
	   }
	   
	   //글쓰기 폼으로 이동:
	   location.href="insert_form.do"
	   
   }//end-insert_form()
   
   
   //검색
   function search(){
	   
	   var search      = $("#search").val();
	   var search_text = $("#search_text").val().trim();
	   
	   if(search != 'all' && search_text==''){
		  alert('검색어를 입력하세요');
		  $("#search_text").val("");
		  $("#search_text").focus();
		  return;
	   }
	   
	   location.href="list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);

   }
   

</script>


<script type="text/javascript">

   $(document).ready(function(){

	   setTimeout(show_message,200);
	   
	   //검색메뉴 
	   if("${ not empty param.search }"=="true"){
		   
		   $("#search").val("${ param.search}");
		   
		   //전체보기면 ->검색어 지움
		   if("${ param.search eq 'all' }" =="true"){
			   
			   $("#search_text").val("");
		   }
	   }
	   	   
	   
	   
   });
   
   function show_message(){
	   
	   if("${ param.reason eq 'session_timeout'}" == "true"){
		   
		   alert("로그아웃되었습니다\n로그인 하신후 이용하세요");
		   
	   }
   }


</script>



</head>
<body>
  <div id="box">    
                      
       <!-- 게시판내용 -->
       <table class="table  table-striped  table-hover">
             
             <!-- 제목 -->
             <tr>
                 <th width="10%">번호</th>
                 <th width="50%">제목</th>
                 <th width="15%">작성자</th>
                 <th width="15%">작성일자</th>
                 <th width="10%">조회수</th>
             </tr>
             
             <!-- 데이터가 없는 경우 -->
             <c:if test="${ empty b_list }">
                 <tr>
                    <td colspan="5" align="center">
                       <font color="red">작성된 게시물이 없습니다</font>
                    </td>
                 </tr>
             </c:if>
        
             <!-- 데이터가 있는 경우 -->
             <!-- for(BoardVo vo : list)  -->
             <c:forEach var="vo"  items="${ b_list }">
                <tr>
                    <td>${ vo.no }(${ vo.b_idx })</td>
                    <td style="text-align: left; text-indent: 10px;">
                         
                         <!-- 삭제되지 않은 게시물 -->
                         <c:if test="${ vo.b_use_yn eq 'y' }">
                         	 <a href="${ pageContext.request.contextPath }/board/board_view.do?b_idx=${ vo.b_idx }">
                         	 ${ vo.b_title }
                         	 </a>
                         	 
                         	 <c:if test="${ vo.comment_count != 0 }">
                                 <font color=red>(${ vo.comment_count })</font>     	 
                                 <%-- <span class="badge">${vo.comment_count}</span> --%>
                         	 </c:if>
                         </c:if>
                         
                         <!-- 삭제된 게시물 -->
                         <c:if test="${ vo.b_use_yn eq 'n' }">
                             <font color=red>(삭제된 게시물) ${ vo.b_title }</font>
                         </c:if>
                         
                         
                    </td>
                    <td>${ vo.m_name }</td>
                    <td>${ fn:substring(vo.b_regdate,0,10) }</td>
                    <td>${ vo.b_readhit }</td>
                </tr>
             </c:forEach>
        
                 
        
             <!-- 페이지 메뉴 -->
             <tr>
                <td colspan="5" align="center">
                    
                    <div id="page_menu"> 
                     ${ pageMenu }
                    </div>
                                        
                     
                </td>
             </tr>
       
       </table>     
  </div>  
</body>
</html>











