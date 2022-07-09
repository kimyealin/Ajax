<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>jQuery Ajax메소드 - $.get()</title>
<style type="text/css">
#result {
	width: 200px;
	height: 250px;
	border: 5px double #6699FF;
}
</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#b1").click(function(){
		$.get("xhrTest3.txt", function(data,status){//xhrTest3.txt를 get방식으로 요청
	var resultStr = "데이터: " + data + "\n처리상태: " + status;
			//data: xhrTest3.txt의 내용 + status: 처리상태 => resultStr에 저장
			$("#result").text(resultStr);
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