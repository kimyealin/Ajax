<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>jQuery Ajax메소드 - $.ajax()</title>
<style type="text/css">
#result {
	width: 200px;
	height: 200px;
	border: 5px double #6699FF;
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#b1").click(function(){
		var query = {name : "kingdora", stus: "homebody"};
		$.ajax({
			type:"POST",
			url: "process.jsp",
			data: query,
			success: function(data){ //요청페이지 실행한 결과
				$("#result").html(data);
			}
		});
	});
});
</script>
</head>
<body>
	<button id="b1">결과</button>
	<div id="result"></div>
</body>
</html>