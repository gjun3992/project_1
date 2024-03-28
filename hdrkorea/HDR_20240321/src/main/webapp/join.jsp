<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<link rel="stylesheet" type="text/css" href="css/join.css">


<body>
<jsp:include page="header.jsp"></jsp:include>


<section >
<h2 >홈쇼핑 회원등록</h2><br/>


<form  method="post" action="action.jsp" name="frm"
onsubmit="return check(this);">

<input type="hidden" name="mode" value="insert" />
		
	
<%
Connection conn= null;
Statement stmt=null;
String grade="";
String custno="";
try{
	conn =Util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT  max(custno)+1 custno  FROM member_tbl_02 ";
	ResultSet rs= stmt.executeQuery(sql);
	rs.next();
	
	custno=rs.getString("custno");
	
}catch (Exception e){
	e.printStackTrace();
}
Date date= new Date();
SimpleDateFormat smd= new SimpleDateFormat("yyyy-MM-dd");
String today= smd.format(date);
System.out.println(today);

%>		
<table border="1">
	
		<tr>
			<td >회원번호</td>
			<td><input type="text" name="custno" value="<%=custno%>"></td>
		</tr>
		<tr>
			<td>회원 성명</td>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원 전화</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원 주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" value="<%=today %>"></td>
		</tr>
		<tr>
			<td>고객등급</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="등록 " >
			<input type="button" value="조회 " onclick="location='list.jsp'">
			</td>
		</tr>
			
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
function check(form) {
	 if (form.custname.value === "") {
	        alert("이름을 입력하시오");
	        form.custname.focus();
	        return false;
	    }
	    
	    if (form.phone.value === "") {
	        alert("전화번호를 입력하시오");
	        form.phone.focus();
	        return false;
	    }
	    
	    if (form.address.value === "") {
	        alert("주소를 입력하시오");
	        form.address.focus();
	        return false;
	    }
	    
	    if (form.joindate.value === "") {
	        alert("가입 날짜를 입력하시오");
	        form.joindate.focus();
	        return false;
	    }
	    
	    if (form.grade.value === "") {
	        alert("등급을 입력하시오");
	        form.grade.focus();
	        return false;
	    }
	    
	    if (form.city.value === "") {
	        alert("도시코드를 입력하시오");
	        form.city.focus();
	        return false;
	    }
	    
	    alert("회원등록이 완료 되었습니다");
	    return true;
	}

</script>
</body>
</html>