<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.js"></script>
<script src="../../../resources/js/write.js" defer></script>
<link rel="stylesheet" href="../../../resources/css/write.css">
<body>


<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
    </div>

			<div class="col-sm-8">

				<form method="post" action="boardUpload" class="boardUpload" enctype="multipart/form-data">

					<div class="container">
						<h2>게시판 글쓰기</h2>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<input type="text" class="form-control contentTitle" placeholder="글 제목" name="contentTitle" maxlength="40">
									</td>
								</tr>
								<tr>
										<td class="box-file-input">
											<label><input type="file" name="file" class="file-input"></label>
											<span class="filename">파일을 선택해주세요.
										</td>
								</tr>
								<tr>
									<td>
										<textarea type="text" class="form-control" name="contentText" placeholder="글 내용을 작성하세요" maxlength="1024" style="height: 400px;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>

						<input type="button" class="btn btn-primary pull-right writeBtn" value="글쓰기">
					</div>

				</form>
				
				
			</div>
			
			<div class="col-sm-2 sidenav">
    </div>
    
  </div>
</div>

<script>
	var responseMsg = "<c:out value="${message}" />"
</script>

</body>
