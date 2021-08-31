			
	   		//아이디 - 공백x , 한글x
	   		$('#usr').on("keyup",idCheck);
	   		
	   		function idCheck()
	   		{
	   	    	var usr = $("#usr").val();
	   		
	   		   	if(usr.search(/\s/) != -1){
	   		   	$('.usr-text').html("아이디는 공백 없이 입력해주세요.");
	   		   	$('.usr-text').css('color','red');
	   		 	$("#usr").focus();
	   		   	return;
	   		   	}else if(korRe.test(usr))
	   		    {
	   		   		$('.usr-text').html("한글은 아이디로 사용할수 없습니다.");
	   		   		$('.usr-text').css('color','red');
	   		   		$("#usr").focus();
	   		   		return;
	   		   	}else {
	   		   		$('.usr-text').html(""); 
	   		   	}
	   		}

    		//비밀번호 검증 - 공백x , 한글x 
    		$('.pwd-1').on("keyup",passwordCheck);
    		
    		function passwordCheck()
			{
    			 var pw = $(".pwd-1").val();
	
	   			 if(pw.search(/\s/) != -1){
	   				$('.pw-text1').html("비밀번호는 공백 없이 입력해주세요.");
	   				$('.pw-text1').css('color','red');
	   				$('.pwd-1').focus();
	   			  	return;
	   			 }else if(korRe.test(pw))
	   			{
	   				$('.pw-text1').html("한글은 비밀번호로 사용할수 없습니다.");
	   				$('.pw-text1').css('color','red');
	   				$('.pwd-1').focus();
	   			  	return;
	   			}else
	   			{
	   				 $('.pw-text1').html("사용가능한 비밀번호입니다."); 
	   				 $('.pw-text1').css('color','green');
	   			}
			}
	   		
	   		//비밀번호 재확인 - 1차 비밀번호랑 일치해야함
    		$('.pwd-2').on("keyup",passwordReCheck);
	   		
    		function passwordReCheck()
    		{
    			if( $('.pwd-1')[0].value != event.target.value){
    				$('.pw-text2').html("비밀번호가 일치하지 않습니다.");
    				$('.pw-text2').css('color' , 'red');
    				$('.pwd-2').focus();
    				return;
    			}
    			else{
    				$('.pw-text2').html("비밀번호가 일치합니다.");
    				$('.pw-text2').css('color','green');
    			}
    		}
    		
	   		//이름 - 한글만 , 4글자 이상시 textarea로 변경
    		$('.name , .name-textarea').on
    		({
    			keypress : function()
	    		{
	    			var name = $('.name').val();
	    			
	    			if ( name.search(/\s/) != -1 || numRe < 0 || engRe < 0 || speRe < 0 )
	    			{
	    				event.returnValue = false;
	    			}
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
    		
    		//휴대폰 번호 중간 칸- 010,019에따라 2번째칸 숫자입력 갯수  변경, 숫자만 입력 가능 , 2번째자리 입력시 3번쨰로 이동
    		$('.phone-input-2').on
    		({
    			keypress : function()
				{
					if( event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
				},
				keyup : function()
				{
					var N = ($('.phone-input-1')[0].value == '019') ? 2 : 3;
					if( korRe.test( $(this).val() ) ) $(this).val("");
					if( $(this).val().length == N+1 ) $('.phone-input-3').focus();
				}
			});
    		
    		//휴대폰 번호 마지막 칸 - 숫자만 입력 , 4자리만 입력
    		$('.phone-input-3').on
    		({
    			keypress : function ()
    			{
					if( ($(this).val().length > 3) || event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;
    			},
    			keyup : function()
				{
					if(korRe.test( $(this).val() )) $(this).val("");
				}
			});
    		
	    	//주소에 사용되는 함수 - 1. 시,도 값이 null이면  시도 값을 가져온다 / 2. 시,도 값이 not null이면 시,군,구 값을 가져온다 
	    	function getAdress()
	    	{
		    	$.ajax
		    	({
		    		type : "post",
		    		url : "getAdress",
		    		dataType : "json",
		    		contentType : "application/json; charset=UTF-8",
		    		data : JSON.stringify( {"sido_name" : $('.sido').val() } ),
		    		success : function(data)
		    		{
		    			if(data[0].sido_name != null)
		    			{
			    			var sidoAdd = "";
			    			for(var i=0; i<data.length; i++)
			    			{
			    				sidoAdd += '<option>'+data[i].sido_name+'</option>';
			    			}
			    			$(".sido").html(sidoAdd);
		    			}else if(data[0].sigungu_name != null)
		    			{
		    				var sigunguAdd = "";
		    				for(var i=0; i<data.length; i++)
		    				{
		    					sigunguAdd += '<option>'+data[i].sigungu_name+'</option>';
		    				}
		    				$(".sigungu").html(sigunguAdd);
		    			}
		    		},
		    		error : function()
		    		{
		    			console.log(error);
		    		}
		    	})
	    	}
	    	//join페이지 호출시 자동으로 한번 getAdress함수를 호출한다  -> 시,도값을 받아온다
	    	getAdress();
	    	//시,도 값을 선택할때 getAdress함수를 호출하도록 이벤트를 할당한다 -> 시,군,구 값을 받아온다
	    	document.querySelector(".sido").onchange = function()
	    	{
	    		getAdress();
	    	}
			
	    	//회원가입 - 입력값의 유효값을 다시한번 체크 -> 유효하다면 submit실행
	    	$('.joinBtn').on("click" , function()
	    	{
	    		$('.phoneNumber').val( $('.phone-input-1').val() + $('.phone-input-2').val() + $('.phone-input-3').val() );
	    		
		   	    var usr = $("#usr").val();
		   		
		   		if(usr.search(/\s/) != -1)	return alert("아이디 형식이 맞지 않습니다.");
		   		else if(korRe.test(usr)) return alert("아이디 형식이 맞지 않습니다.")

		   		var pw = $(".pwd-1").val();
		
		   		if(pw.search(/\s/) != -1)	return alert("비밀번호 형식이 맞지 않습니다.");
		   		else if(korRe.test(pw))	return alert("비밀번호 형식이 맞지 않습니다.");
		   			
				var name = $('.name').val();
	    		if ( name.search(/\s/) != -1 || numRe < 0 || engRe < 0 || speRe < 0 ) return alert("이름은 한글만 입력 가능합니다.");
					    		
	    		if( $("#usr").val() == "" ) return alert("아이디를 입력해 주세요.");
	    		if( $(".pwd-2").val() == "" ) return alert("비밀번호 형식이 맞지 않습니다..");
	    		if( $(".pwd-1").val() == "" ) return alert("비밀번호를 입력해 주세요.");
	    		if( $('.phoneNumber').val() == "" ) return alert("휴대폰 번호를 입력해 주세요.");
	    		if( $('.phoneNumber').val() == "" ) return alert("이름을 입력해 주세요.");
	    		if( $('.sido').val()== "" || $('.sigungu').val()== "" ) return alert("주소를 입력해 주세요.");
	    		if( $('.email').val() == "" ) return alert("이메일을 입력해 주세요")
	    		
	    		$('.joinTry').submit();
	    	})
