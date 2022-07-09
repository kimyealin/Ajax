var xhrObject; //XMLHttpRequest객체를 저장할 변수를 전역변수로 선언

function createXHR(){ //XMLHttpRequest객체 생성하는 메소드
	if(window.ActiveXObject){
		xhrObject = new ActiveXObject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		xhrObject = new XMLHttpRequest();
	}
}
function startMethod(){ //클라이언트로부터 이벤트발생 시 실행할 메소드
	createXHR();
	xhrObject.onreadystatechange = resultProcess; //응답결과 처리메소드 설정
	xhrObject.open("GET", "xhrTest1.xml", "true"); //서버 요청설정
	xhrObject.send(null); //요청보냄
}
function resultProcess(){ //응답결과오면 자동으로 실행
	if(xhrObject.readyState == 4){ //요청객체의 상태가 모든 데이터 받을 수 있는 상태로 완료된경우
		if(xhrObject.status == 200){ //서버로부터 응답받는 Http상태가 정상인경우
			document.getElementById("displayArea").innerHTML = xhrObject.responseText;
			//문자열로 이루어진 서버응답받아서 id값을 displayArea에 표시
		}
	}
}