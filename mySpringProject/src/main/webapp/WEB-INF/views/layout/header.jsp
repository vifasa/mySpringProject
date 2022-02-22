<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("li.mainmenu ul").hide();
		
		
		$("li.mainmenu").click(function(){
			$("ul",this).toggle();
			//$("ul",this).fadeIn(110);
		});
	});
	
	function show_login(){window.open("${ pageContext.request.contextPath }/member/login_form.do","로그인 창", "width=400, height=300,left=100,top=0");}
	function show_user(a){window.open("${ pageContext.request.contextPath }/member/member_view.do?m_idx="+a,"로그인 창", "width=400, height=300,left=100,top=0");}
</script>
<style type="text/css">
	
	hr{
	margin-top: 0px;
	}

	#user_box{
		position : relative;
		bottom: 40px;
		left :	10px;
	}
	
	#user_box > a {
		font-size : 20px;
		font: bold;
		position : relative;
		top : 4px;
	}

	#user_box > div{
		float: left;
	}
	
	#user_box > ul li{
		list-style: none;
	}
	
	#user_image{
		position : relative;
		bottom : 8px;
		width  : 45px;
		height : 45px;
		border-radius: 70%;
    	overflow: hidden;
	}
	
	#user_name{
		position : relatice;
	}
	
	#user_image>img{
		width: 100%;
    	height: 100%;
		object-fit: cover;
	}
	
	#logo{
		position : relative;
		bottom : 0px;
		left :150px;
		height: 70px;
		margin-top: 0px;
		margin-left: 26px;
		float:left;
	}	
	
	#category_serch{
		color : gray;
		position : relative;
		top: 30px;
		width: 20%;
		min-height: 20px;
		list-style-type: none;
		margin-left: 5px;
		text-align: center;
		font-size: 20px;
	}
	
	#top_user{
		position : relative;
		bottom: -10px;
		left :750px;
		margin-right: 10px;
	}
	
	li.mainmenu{
		
		float:left;
		width: 20%;
		/* hight: 300px; */
		margin-top: 30px;
		min-height: 20px;
		list-style-type: none;
		margin-left: 5px;
		text-align: center;
		font-size: 20px;
		/* border: 1px solid red; */
		
	}
	
	.mainmenu > a{
		font: bold;
	}
	
	#category_serch{
		font: bold;
	}
	
	
	li.mainmenu>ul{
		position : absolute;
		margin-left:auto;
		margin-right: auto;
		list-style-type: none;
		display:display: block;
		text-align: center;
		background-color: white;
		

	}	
	
	.mainmenu a{
		color: gray;
		text-decoration: none;
	}
	
	#dropdownmenu{
		margin-left: 300px;
	}
	
	ul#dropdownmenu li :hover {
		color: gray;
	}
	
	li.submenu {
		float: left;
		list-style-type: none;
		width: auto;
		height: 35px;
		left: 0px;
		font-size: 15px;
		margin-top: 7px;
		margin-left: 30px;
 	    margin-right: 30px;
    	align-content: center;
	}
</style>
</head>
<body>
<div style="width: 100%; height: 90px; background-color: rgb(245,255,250);">
	<a href="${ pageContext.request.contextPath }/main.do"><img id="logo" alt="로고" src="${ pageContext.request.contextPath }/resources/images/site/logo.png"></a>
	
	<ul id="dropdownmenu">
		<li class="mainmenu">
			<a href="#">구독 채널▼</a>
			<ul>
				<c:if test="${ empty user }">
					<li class="submenu"><a>로그인을 하셔야합니다.</a></li>
				</c:if>
				<c:if test="${ not empty user }">
					<c:if test="${ empty f_list }">
						<li class="submenu">구독중인 채널이 없습니다.</li>
					</c:if>
					<c:if test="${ not empty f_list }">
						<c:forEach var="vo" items="${ f_list }">
							<li class="submenu"><a href="${ pageContext.request.contextPath }/board/board_list.do?ca_idx=${vo.ca_idx}&ca_name=${vo.ca_name}">${vo.ca_name}</a></li>
						</c:forEach>
					</c:if>
				</c:if>
			</ul>		
		</li>
			<a id="category_serch" href="${ pageContext.request.contextPath }/category/category_serch_form.do">채널 검색</a>
	</ul>

	<div id = "top_user" style="align-content: right;">
		<c:if test="${ empty user }">
		<ul>
			<a onclick="show_login()"><img style="width: 33px; height: 33px; position : absolute; bottom: -10px;" src="${ pageContext.request.contextPath }/resources/images/site/top_user/top_btn2.png"></a>		
		</ul>
		</c:if>
		<c:if test="${ not empty user }">
		<div id="user_box">
			<ul>
				<li class="mainmenu">
				<div id="user_image">
					<img src="${ pageContext.request.contextPath }/resources/images/member/${user.m_image}">
				</div>
					<ul>
						<li>${ user.m_name }</li>
						<li><a href="${ pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						<li><a href="${ pageContext.request.contextPath }/member/modify_form.do">설정</a></li>
						<li>point: ${ user.m_point }</li>
					</ul>
				</li>			
			</ul>
		</div>
		</c:if>
	</div>
</div>
</body>
</html>