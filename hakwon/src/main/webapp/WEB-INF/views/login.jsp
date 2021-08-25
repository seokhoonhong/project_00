<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 700px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    .phone-input-2, .phone-input-3 {
    	height: 19.6px;
    	width: 63.4px;
    }
  </style>
  
</head>


<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
    </div>
    
    <div class="col-sm-8 text-left">
				<form>
						</br>
						</br>
						<label for="usr">아이디:</label> <input type="text"class="form-control" id="usr">	<button type="button" class="btn">중복 검사</button>
						</br>
						<label for="pwd">비밀번호:</label> <input type="password"class="form-control pwd-1" onkeyup="pwdCheck()">
						</br><sapn class="hidden"></sapn>
						<label for="pwd">비밀번호 재확인:</label> <input type="password"class="form-control pwd-2" >
						</br><sapn class="hidden"></sapn>
						<label for="usr">이름:</label> <input type="text"class="form-control">
						</br>
						<label for="usr">전화번호:</label>
						<select name ="job" class="phone-input-1">
							<option selected>010</option>
							<option>019</option>
						</select>
						- <input type="text" class="phone-input-2" onkeypress="phoneNumberCheck();"/>
						- <input type="text" class="phone-input-3" onkeypress="phoneNumberCheck2();"/>
					<br/>
					<button type="button" class="btn">회원가입</button>
				</form>
			</div>
    		
    		<script>

    		//비밀번호 js검증 
    		function pwdCheck()
			{
    			 var pw = $(".pwd-1").val();
    			 var num = pw.search(/[0-9]/g); 
    			 var eng = pw.search(/[a-z]/ig);
    			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    			 if(pw.length < 8 || pw.length > 20){

    			  alert("8자리 ~ 20자리 이내로 입력해주세요.");
    			  return false;
    			 }else if(pw.search(/\s/) != -1){
    			  alert("비밀번호는 공백 없이 입력해주세요.");
    			  return false;
    			 }else if(num < 0 || eng < 0 || spe < 0 ){
    			  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
    			  return false;
    			 }else {
    				console.log("통과"); 
    			    return true;
    			 }

			}
    		
    			function phoneNumberCheck()
    			{
    				var N = ($('.phone-input-1')[0].value == '019') ? 2 : 3; 
    				if((event.target.value.length > N) || event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
    				if(event.target.value.length == N+1) $('.phone-input-3').focus();
    			}
    			function phoneNumberCheck2()
    			{
    				if((event.target.value.length > 3) || event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
    			}
    		</script>
    		
    <div class="col-sm-2 sidenav">
>
    </div>
    
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
