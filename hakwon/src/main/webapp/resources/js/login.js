var cookiesArr = cookies[cookies.length-1].replace(" ","").split("=");
    	
    	if( cookies[cookies.length-1] != "" )
    	{
    		$('.usr').val( cookiesArr[0] );
    		console.log("진행중");
    		$('#checkBox').attr("checked", true);
    	}

$('.loginBtn').on("click" , function()
				{
					if( $(".usr").val() == "" ) return alert("아이디를 입력해 주세요.");
					if( $(".password").val() == "" ) return alert("비밀번호를 입력해 주세요.");
					
					if( $('#checkBox').is(":checked") == true )
					{
						cookiesDelete();
						idStore( $('.usr').val() , 0 );
					}else if( $('#checkBox').is(":checked") == false )
					{
						cookiesDelete();
					}
					
					$('.loginTry').submit();
				})
			
			
