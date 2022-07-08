<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"%>
<%@page import="util.DB"%>
<%@page import="util.Util" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		conn=DB.getConnection();
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement("delete from tablement where id=?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		System.out.println(i+"개 행 삭제");
		conn.commit();
%>
<result>
	<code>success</code>
	<id><%=id %></id>
</result>
<%
	}catch(Throwable e){
		try{conn.rollback();}catch(SQLException ex){}
%>
<result>
	<code>error</code>
	<message><![CDATA[<%=e.getMessage()%>]]></message>
</result>
<%
	}finally{
		try{if(pstmt!=null)pstmt.close();}catch(SQLException pstmte){}
		try{if(conn!=null){
			conn.setAutoCommit(true);
			conn.close();
			}
		}catch(SQLException conne){}
	}
%>