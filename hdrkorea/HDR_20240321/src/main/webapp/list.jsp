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
<link rel="stylesheet" type="text/css" href="css/list.css">

<body>
<jsp:include page="header.jsp"></jsp:include>


<section>
<h2 >회원 목록조회</h2><br/>

<form>
	
	
<table>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>전화번호</td>
		<td>주소</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주지역</td>
	</tr>
	
<%
Connection conn= null;
Statement stmt=null;
String grade="";

try{
	conn =Util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT  *  FROM member_tbl_02 ORDER BY custno";
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
		<td>
		<a href="modify.jsp?mod_custno=<%=rs.getString("custno") %>" style="color: black;">
        <%=rs.getString("custno") %>
    </a> 
		</td>
		<td> <%=rs.getString("custname") %></td>
		<td> <%=rs.getString("phone") %></td>
		<td> <%=rs.getString("address") %></td>
		<td> <%=rs.getDate("joindate") %></td>
		<td> <%=grade %></td>
		<td> <%=rs.getString("city") %></td>

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