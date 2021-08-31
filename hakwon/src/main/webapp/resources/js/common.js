var korRe = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글 정규식
var numRe = name.search(/[0-9]/g); //숫자 정규식 
var engRe = name.search(/[a-z]/ig); // 영어 정규식 
var speRe = name.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
//특수 문자 정규식