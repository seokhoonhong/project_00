function getBulletinBoard()
{
	console.log("sadad");
	$.ajax
	({
		type : "post",
	  	url : "getBulletinBoard",
	  	dataType: "json",
	  	contentType : "application/json; charset=UTF-8",
	  	success : function(data)
	  	{
	  		console.log(data);
	  		callbackFunction(data);
	  	},
	  		error : function(error)
	  	{
	  		console.log(error);
	  	}
	  });
}


//dataㄹㄹ 
function callbackFunction(response)
{
	 var data = []; // 배열 하나 만들어 주기! 
	 console.log( response );
	 for(var i=0; i<response.length; i++)
	 { 
	 	var tableData = 
	 	{ 
	 		data1 : response[i].contentTitle+"&&&%&&&"+response[i].bulletinBoardNum, 
	 		data2 : response[i].uploadDate ,
	 	}
	 	data.push(tableData);
	 	console.log(data);
	 }; 
	 createDataTable($('#table_id'), data); 
}


function createDataTable(tableId, data)
{
	var dataArr = [];
	console.log("체크!");
	console.log(data);
	console.log("체크!");
	 tableId.DataTable
	 ({
		  data : data, 
		  columns : 
		  [
		  	 {
			  	  data : 'data1',
			  	  render: function(data, type, row, meta)
			  	  {
			  	  	dataArr = data.split("&&&%&&&"); // 게시물번호의 값을 따로 넘기기 어려워 -->>  제목 + 게시물번호로 한번에받고 &&&%&&&로 split한후 제목 ,게시물번호 사용
			  	  	console.log("검사맨" + dataArr[1]);
			         if(type === 'display')
			         {
			          	data = '<a href="/bulletinBoard/getPage?bulletinBoardNum='+dataArr[1]+'">' + dataArr[0] + '</a>';
			         }
		          return data;
	        	  }
		  	 }, 
		  	 { data : 'data2'}
		  ] 
	  });
}



$(document).ready( function () 
			{
				
		    	
		    	getBulletinBoard();
		    	
		    	$('.search').on("click",function()
		    	{
		    		location.href = "/bulletinBoard/write";
		    	})
			} );
			