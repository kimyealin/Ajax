<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] titles = {
			"고은디 계속졸려... 졸린지 3일째",
			"예솔 대장 '고은디 정신차려라 소리쳐'",
			"깜짝놀란 애기 가형, 심장떨어져.."
	};
	for(int i=0; i<titles.length; i++){
%>
<% if (i==0){ %><strong><%} %>
<%=titles[i] %>
<% if (i==0) {%></strong><%} %>
<br>
<%
	}
%>