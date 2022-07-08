<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java"  contentType="text/xml; charset=UTF-8"%>
<%@page import="util.DB"%>
<%@page import= "util.Util" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		conn = DB.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement("update tablement set name=?, content=? where id=?");
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		pstmt.setInt(3, id);
		int i = pstmt.executeUpdate();
		System.out.println(i+"개 행 수정");
		conn.commit();
%>
<result>
	<code>success</code>
	<data><![CDATA[
	{
		id: <%=id %>,
		name: '<%=Util.toJS(name) %>',
		content: '<%=Util.toJS(content) %>'
	}
	]]></data>
</result>
<%
	}catch(Throwable e){
		try{conn.rollback();}catch(SQLException ex){}
%>
<result>
	<code>error</code>
	<message><![CDATA[<%= e.getMessage() %>]]></message>
</result>
<%
	}finally{
			try{if(pstmt!=null)pstmt.close();}catch(SQLException pstmte){}
			try{if(conn!=null){
				conn.setAutoCommit(true);
				conn.close();
				}
			}catch(SQLException pstmte){}
	}
%>