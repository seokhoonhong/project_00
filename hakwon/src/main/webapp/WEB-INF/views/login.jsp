<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" href="../../resources/css/login.css">
<linkhref='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<body>

<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
    </div>

			<div class="col-sm-8">
				<div class="logo"></div>
				<div class="login-block">
				<form action="loginTry" class="loginTry" method="post">
					<input type="text"class="form-control usr" name="id" placeholder="Username">
					<input type="password" class="password" name="password" placeholder="Password" />
					<button type="button" class = "loginBtn">로그인</button>
				</form>
					<a href="${pageContext.request.contextPath }/join"><button>회원가입</button></a>
				</div>
			</div>
			<script>
			
				$('.loginBtn').on("click" , function()
				{
					if( $(".usr").val() == "" ) return alert("아이디를 입력해 주세요.");
					if( $(".password").val() == "" ) return alert("비밀번호를 입력해 주세요.");
					$('.loginTry').submit();
				})
			
			</script>
			
			

			<div class="col-sm-2 sidenav">
    </div>
    
  </div>
</div>

</body>
