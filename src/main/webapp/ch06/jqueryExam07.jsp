<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>jQuery Ajax메소드 - $.post()</title>
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
	$("#b1").click(function(){ //결과버튼 클릭하면
		$.post("process.jsp", { //여기로 요청데이터 보낸후 결과반환받음
			name:"kingdora",  //요청페이지 실어서보낼 데이터
			stus:"homebody"
		},
		function(data,status){ //응답내용 처리
			if(status = "success")
				$("#result").html(data);
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