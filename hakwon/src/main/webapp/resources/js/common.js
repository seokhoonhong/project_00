var korRe = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글 정규식
//특수 문자 정규식

var emailRe=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
//이메일 정규식

var cookies = document.cookie.split(";");

//쿠키 전부삭제
function cookiesDelete()
						{
						    for (var i = 0; i < cookies.length; i++) 
						    {
						    	var cookie = cookies[i];
						        var eqPos = cookie.indexOf("=");
						        console.log("eqPos : " + eqPos);
						        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
						        console.log( cookie + eqPos + name );
						        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
						    }
						 }
						 
//쿠키저장		 
function idStore(name,value)
	    {
	    	var date = new Date();
	    	date.setDate(date.getDate() + 7);
	    	
	    	var cookie = "";
	    	cookie += name+"="+value+";"; // 쿠키객체 키,값
	    	cookie += "expires="+date; // 쿠키 시간 설정
	    	
	    	document.cookie = cookie;
	    }