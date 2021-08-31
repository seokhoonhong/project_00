<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script src="../../resources/js/join.js" defer></script>

<body>

<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
    </div>
    
    <div class="col-sm-8 text-left">
				<form action="joinTry" class="joinTry" method="post">
						</br>
						</br>
						<label for="usr">아이디</label> <input type="text"class="form-control" id="usr" name="id">
						<sapn class="usr-text"></sapn>
						</br>
						<button type="button" class="btn idCheck">중복 검사</button>
						</br>
						</br>
						
						<label for="pwd">비밀번호</label> <input type="password"class="form-control pwd-1" name="passowrd">
						<sapn class="pw-text1"></sapn>
						</br>
						
						<label for="pwd">비밀번호 재확인</label> <input type="password"class="form-control pwd-2">
						<sapn class="pw-text2"></sapn>
						</br>
						
						<label for="usr">이름</label> <input type="text"class="form-control name" name="name">
						<textarea rows="5" cols="100" class ="form-control hidden name-textarea"></textarea>
						</br>
						
						<label for="usr">전화번호   </label>
						</br>
						<select class="phone-input-1 form-control">
							<option selected>010</option>
							<option>019</option>
						</select>
						- <input type="text" class="phone-input-2 form-control"/>
						- <input type="text" class="phone-input-3 form-control"/>
						<input type="hidden" class="phoneNumber" name="phoneNumber">
						</br>
						</br>
						
						<label>주소</label>
						</br>
						
						<select class="adress form-control sido" name="sido_adress">
							<!--  js로 동적 생성 구간 -->
						</select>
						<select class="adress form-control sigungu" name="sigungu_adress">
							<!--  js로 동적 생성 구간 -->
						</select>
						</br>
						</br>
						
						<label>Email</label>
						</br>
						<input type="email" class="form-control email" name="email">
						</br>
						
						<button type="button" class="btn joinBtn">회원가입</button>
				</form>
			</div>
    		
    		<script>
    			$('.idCheck').on("click",function()
    			{
    				console.log("작동함?");
    				console.log($('#usr').val());
    				$.ajax
    		    	({
    		    		type : "post",
    		    		url : "idCheck",
    		    		dataType : "json",
    		    		contentType : "application/json; charset=UTF-8",
    		    		data : JSON.stringify( {"id" : $('#usr').val() } ),
    		    		success : function(data)
    		    		{
    		    			if(data.length == 0) $('#usr').attr("readonly",true);
    		    		},
    		    		error : function(error)
    		    		{
    		    			console.log(error);
    		    		}
    				})
    			})
    		</script>
    	
    <div class="col-sm-2 sidenav">
    </div>
    
  </div>
</div>

</body>
