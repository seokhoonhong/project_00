<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" href="../../resources/css/login.css">
<linkhref='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script src="../../resources/js/login.js" defer></script>

<style>

	.idStore
	{
		float : right;
		margin-right : 360px;
	}
	
</style>

<body>

<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
    </div>

			<div class="col-sm-8">
				<div class="logo"></div>
				<div class="login-block">
				<form action="loginTry" class="loginTry" method="post">
					<input type="text"class="form-control usr" name="id" placeholder="Username" value="">
					<input type="password" class="password" name="password" placeholder="Password" />
					<button type="button" class = "loginBtn">로그인</button>
				</form>
					<a href="${pageContext.request.contextPath }/join"><button>회원가입</button></a>
				</div>
				<div class = "idStore">id저장 <input type="checkbox" id="checkBox"></div>
			</div>
			<script>
				var responseMsg = "<%= request.getAttribute("message") %>";
				if(responseMsg != "null") alert(responseMsg);
			</script>
			<div class="col-sm-2 sidenav">
    </div>
  </div>
  
</div>

</body>
