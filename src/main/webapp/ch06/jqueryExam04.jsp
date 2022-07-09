<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>jQuery Ajax메소드 -load()</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){ //[결과]버튼 클릭하면 xhrTest1.jsp실행됨
	$("#b1").click(function(){
		$("#result").load("xhrTest1.jsp");
	});
});
</script>
</head>
<body>
	<button id="b1">결과</button>
	<div id="result"></div>
</body>
</html>