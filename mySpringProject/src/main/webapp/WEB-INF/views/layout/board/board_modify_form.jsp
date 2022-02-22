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

<!-- CKEditor  -->
<script src="https://cdn.ckeditor.com/4.17.1/full/ckeditor.js"></script>

<script type="text/javascript">

	var toolbarGroups = [
		{ name: 'document', groups: [ 'mode'/* , 'document', 'doctools' */ ] }, 
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'insert', groups: [ 'Image' ] }
		/* { name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] } */
	];



</script>


<style type="text/css">
  #box{
      width: 700px;
      margin: auto;
      margin-top: 50px;
  }
  
  textarea {
	  width: 100%;
	  height: 150px;
	  resize: none;
  }

</style>

<script type="text/javascript">

  

  function send(f){
	  
	  var b_title = f.b_title.value.trim();
	 
	  var b_content = CKEDITOR.instances.b_content.getData()
	                          .replaceAll("<p>&nbsp;","")
	                          .replaceAll("&nbsp;</p>","")
	                          .replaceAll("&nbsp;","")
	                          .replaceAll("\n","")
	                          .trim()
	                          ;
	                          
	  

	  if(b_title==''){
		  alert("제목을 입력하세요");
		  f.b_title.value='';
		  f.b_title.focus();
		  return;
	  }
	  
	  if(b_content==''){
		  alert("내용을 입력하세요");
		  CKEDITOR.instances.b_content.setData("");
		  
		
		  CKEDITOR.instances.b_content.focus();
	
		  return ;
	  }
	  
	  f.action = "board_modify.do"; 
	  f.submit();
	  
	  
  }

 
  
  

</script>


</head>
<body>

<form>
  <input type="hidden"  name="b_idx"        value="${ vo.b_idx }">
  <input type="hidden"  name="ca_idx"       value="${ ca_idx }">
  <input type="hidden"  name="page"         value="${ param.page }">
  <input type="hidden"  name="search"       value="${ param.search }">
  <input type="hidden"  name="search_text"  value="${ param.search_text }">
  
  <div id="box">
        <div class="panel panel-primary">
	      <div class="panel-heading"><h3>글수정하기</h3></div>
	      <div class="panel-body">
	          <table class="table">
	              <tr>
	                 <th width="10%">제목</th>
	                 <td><input name="b_title"  style="width: 100%;"  value="${ vo.b_title }"></td>
	              </tr>
	              
	              <tr>
	                 <th>내용</th>
	                 <td>
	                     <textarea id="b_content" name="b_content" >${ vo.b_content }</textarea>
	                     <script>
		                     CKEDITOR.replace( 'b_content' ,{
		                        	toolbarGroups : toolbarGroups,
		                        	filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload.do'
		                        });
		                        
		                        CKEDITOR.on('dialogDefinition', function( ev ){
			                            var dialogName = ev.data.name;
			                            var dialogDefinition = ev.data.definition;
			                          
			                            switch (dialogName) {
			                                case 'image': 
			                		              dialogDefinition.removeContents('Link');
			                		              dialogDefinition.removeContents('advanced');
			                		              break;
			                	    }
			                	 });
			             </script>
	                 </td>
	              </tr>
	              
	              <tr>
	                 <td colspan="2" align="center">
	                      <input class="btn  btn-primary" type="button"  value="수정하기" onclick="send(this.form);">
	                      <input class="btn  btn-success" type="button"  value="목록보기" onclick="location.href='board_list.do'">
	                 </td>
	              </tr>
	          </table>
	      
	      </div>
	    </div>
  </div>
</form>
  
</body>
</html>