<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<link rel="stylesheet" type="text/css" href="css/modify.css">

<body>

<script type="text/javascript" src="check1.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section >
<h2>홈쇼핑몰 회원정보 수정 / 삭제</h2> <br>

<form  method="post" action="action.jsp" name="frm">

<%-- <input type = "hidden" name = "mode" value = "modify"> --%>
<table border ="1">

<%
System.out.println("modify.jsp");

String mod_custno = request.getParameter("mod_custno");
Connection conn = null;
Statement stmt = null;
String grade = "";
try {
	// request.setCharacterEncoding("UTF-8");
	 conn = Util.getConnection(); //DB 연결
	 stmt=conn.createStatement(); // sql 실행하기 위한 변수 생성
	 String sql = "SELECT * FROM member_tbl_02 WHERE custno = " + mod_custno;
	 ResultSet rs = stmt.executeQuery(sql);
		 
	
	 if(rs.next()) { 
	
 %>

     <tr>
		<td>회원번호</td>
		<td><input type="text" name ="custno" value="<%=mod_custno %>"></td>
	</tr>
	<tr>
		<td>회원성명</td>
			<td><input type="text" name="custname" value="<%=rs.getString(2) %>"></td>   
	</tr>
	<tr>
		<td>회원전화</td>
		<td><input type="text" name="phone" value="<%=rs.getString(3) %>"></td>
		
	</tr>
	<tr>
		<td>회원주소</td>
		<td><input type="text" name="address" value="<%=rs.getString(4) %>"> </td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=rs.getDate(5) %>"></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade" value="<%=rs.getString(6) %>"> </td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td><input type="text" name="city" value="<%=rs.getString(7) %>"></td>
	</tr>
	<tr>
    
    <tr>
		<td colspan="2">
		
		<button type="submit" name="mode" value="modify"onclick="window.open("popup.jsp", "width : 300px", "팝업 옵션");">수 정</button>
        <button type="submit" value="look up" formaction="list.jsp">조 회</button>
        <button type="submit" name="mode" value="delete" onclick="check_del()">삭 제</button>
		</td>
	</tr>
	
<%
	  }
} catch(Exception e) {
	 	 e.printStackTrace();
 }
%>	

<tr>
  

</table>
</form>

</section>

<script>
function check_del() {
	 var result = confirm("삭제하시겠습니까?");
     
     if(result)
     {
         document.write("<h1> 실행합니다. </h1>")
     }
     else
     {
         document.write("<h1> 실행하지 않습니다. </h1>")
     }
	
}
       
    </script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>