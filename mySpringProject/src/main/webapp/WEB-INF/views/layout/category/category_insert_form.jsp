<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function send(f) {
		
		var ca_name = f.ca_name.value.trim();
		var ca_text = f.ca_text.value.trim();
		var image = f.image.value;
		
		if(ca_name==''){
			alert('카테고리 이름을 입력하세요');
			return;
		}
		
		if(ca_name==''){
			alert('카테고리 설명을 입력하세요');
			return;
		}
		
		if(image == ''){
			alert('카테고리 이미지를 입력해 주세요');
			return;
		}
		
		f.action="category_insert.do";
		f.submit();
	}

</script>
</head>
<body>

	<div>
		<form method="post" enctype="multipart/form-data">
		 	<table>
				<tr>
					<th>카테고리 이름</th>
					<td><input name="ca_name" type="text"></td>
				</tr>
				
				<tr>
					<th>카테고리 설명</th>
					<td><input name="ca_text" type="text"></td>
				</tr>
				
				<tr>
					<th>카테고리 이미지</th>
					<td><input name="image" type="file"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="send(this.form);">
						<input type="reset" value="리셋">
					</td>
				</tr>
			</table>
		</form>	
	</div>

</body>
</html>