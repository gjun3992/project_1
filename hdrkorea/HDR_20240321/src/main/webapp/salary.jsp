<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/salary.css">
<body>
<jsp:include page="header.jsp"></jsp:include>


<section style=" position: fixed;
	top: 80px;
	width: 100%;
	height: 100%;
	background-color:white; ">
<h2 style="text-align: center">쇼핑몰 회원관리 프로그램</h2><br/>

<form 
	style="display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;">

<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
	
<%
Connection conn= null;
Statement stmt=null;
String grade="";

try{
	conn =Util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT mem.custno,mem.custname,mem.grade,sum(mon.price) as mprice "+
			"FROM   member_tbl_02  mem "+
			"INNER JOIN money_tbl_02  mon "+
			"ON mem.custno = mon.custno "+
			"GROUP BY mem.custno, mem.custname, mem.grade "+
			"ORDER BY mprice desc ";
	ResultSet rs= stmt.executeQuery(sql);
	
	while(rs.next()){
		grade=rs.getString("grade");
		switch(grade){
		case "A":
			grade="VIP";
			break;
		
		case "B":
			grade="일반";
			break;
		
		case "C":
			grade="직원";
			break;
		}
		
%>	
	<tr>
		<td> <%=rs.getString("custno") %></td>
		<td> <%=rs.getString("custname") %></td>
		<td> <%=grade %></td>
		<td> <%=rs.getString("mprice") %></td>

	</tr>
<%
	}
}catch (Exception e){
		e.printStackTrace();
	}

%>	
	
</table>	
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>