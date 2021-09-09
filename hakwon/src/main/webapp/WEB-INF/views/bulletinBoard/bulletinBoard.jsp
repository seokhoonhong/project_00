<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.js"></script>
<script src="../../../resources/js/bulletinBoard.js" defer></script>

<style>
	.list {
		height : 825px;
		overflow: auto; 
	}
	.text-center{
		align-text : center;
	}
	
	.write-btn button{
		font-size : 20px;
		margin-left : 920px;
	}
	.search
	{
		padding: .5em .75em;
		background-color: #fdfdfd;
		color: black;
		surso: pointer;
		border: 1px solid black;
		border-radius: .25em;
	}
</style>

<body>
	<div class= "list" style="odverflow:auto;">
				<div class="text-center"><h1>게시판</h1></div>
				
				 <table id="table_id" class="display">
				    <thead>
				        <tr>
				            <th>제목</th>
				            <th>업로드 날짜</th>
				        </tr>
				    </thead>
				    
				    
				</table>
				<div class="write-btn">
					<button class="search">글쓰기</button>
				</div>
			
  	</div>

</body>
