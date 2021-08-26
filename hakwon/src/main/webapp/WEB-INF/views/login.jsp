<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="ko">
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
    
    .name{
    	width: 83px;
    }
  </style>
  
</head>

<header>

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

</header>

<body>

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
						<label for="pwd">비밀번호:</label> <input type="password"class="form-control pwd-1">
						<sapn class="pw-text1"></sapn>
						</br>
						<label for="pwd">비밀번호 재확인:</label> <input type="password"class="form-control pwd-2">
						<sapn class="pw-text2"></sapn>
						</br>
						<label for="usr">이름:</label> <input type="text"class="form-control name">
						<textarea rows="5" cols="100" class ="form-control hidden name-textarea"></textarea>
						</br>
						<label for="usr">전화번호:</label>
						<select name ="job" class="phone-input-1">
							<option selected>010</option>
							<option>019</option>
						</select>
						- <input type="text" class="phone-input-2"/>
						- <input type="text" class="phone-input-3"/>
					<br/>
					<button type="button" class="btn">회원가입</button>
				</form>
			</div>
    		
    		<script>
	   		var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글 정규식

    		//비밀번호 검증 - 공백x , 한글x 
    		$('.pwd-1').on("keyup",function()
			{
    			 var pw = $(".pwd-1").val();
	
	   			 if(pw.search(/\s/) != -1){
	   				$('.pw-text1').html("비밀번호는 공백 없이 입력해주세요.");
	   				$('.pw-text1').css('color','red');
	   			  	return;
	   			 }else if(kor.test(pw))
	   			{
	   				$('.pw-text1').html("한글은 비밀번호로 사용할수 없습니다.");
	   				$('.pw-text1').css('color','red');
	   			  	return;
	   			 }else {
	   				 $('.pw-text1').html("사용가능한 비밀번호입니다."); 
	   				 $('.pw-text1').css('color','green');
	   			    return;
	   			 }
			});
    		
	   		//비밀번호 재확인 - 1차 비밀번호랑 일치해야함
    		$('.pwd-2').on("keyup",function()
    		{
    			if( $('.pwd-1')[0].value != event.target.value){
    				$('.pw-text2').html("비밀번호가 일치하지 않습니다.");
    				$('.pw-text2').css('color' , 'red');
    				return;
    			}
    			else{
    				$('.pw-text2').html("비밀번호가 일치합니다.");
    				$('.pw-text2').css('color','green');
    			}
    		});
    		
	   		//이름 - 한글만 , 4글자 이상시 textarea로 변경
    		$('.name , .name-textarea').on
    		({
    			keypress : function()
	    		{
	    			var name = $('.name').val();
    				var num = name.search(/[0-9]/g); 
       			 	var eng = name.search(/[a-z]/ig);
       			 	var spe = name.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    			
	    			if ( name.search(/\s/) != -1 || num < 0 || eng < 0 || spe < 0 )
	    			{
	    				event.returnValue = false;
	    			}
	    			console.log(name);
	    		},
	    		keydown : function()
	    		{
	    			if($(this).val().length > 3 && $('.name-textarea').hasClass('hidden'))
	    			{
	    				$('.name-textarea').val( $('.name').val() );
	    				$('.name').addClass('hidden');
	    				$('.name-textarea').removeClass('hidden');
	    				$('.name-textarea').focus();
	    			}
	    		}
    		});
    		
    		//휴대폰 번호 중간 - 010,019에따라 2번째칸 숫자입력 갯수  변경, 숫자만 입력 가능 , 2번째자리 입력시 3번쨰로 이동
    		$('.phone-input-2').on
    		({
    			keypress : function()
				{
					var N = ($('.phone-input-1')[0].value == '019') ? 2 : 3; 
					if( ($(this).val().length > N ) || event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
					if( $(this).val().length == N+1 ) $('.phone-input-3').focus();
				},
				keyup : function()
				{
					if( kor.test( $(this).val() ) ) $(this).val("");
				}
			});
    		
    		//휴대폰 번호 끝 - 숫자만 입력 , 4자리만 입력
    		$('.phone-input-3').on
    		({
    			keypress : function ()
    			{
					if( ($(this).val().length > 3) || event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
    			},
    			keyup : function()
				{
					if(kor.test( $(this).val() )) $(this).val("");
				}
			});
    		</script>
    		
    <div class="col-sm-2 sidenav">

    </div>
    
  </div>
</div>

</body>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</html>
