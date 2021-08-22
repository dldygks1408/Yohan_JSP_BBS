<%@page import="java.sql.ResultSet"%>
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
<style type="text/css">
	body{
		margin: 0px;
	}
	section{
		background: lightgray;
		position: fixed;
		top: 140px;
		width: 100%;
		height: 100%;
	}
	section h3{
		text-align: center;
	}
	section p{
		padding-left: 10px;
	}
	section form table {
		text-align: center;
		width: 90%;
	}
	form{
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<section>
		<h3>회원목록조회/수집</h3>
		<form>
			<table border="1">
				<tr>
					<td>회원번호</td><td>회원성명</td><td>전화번호</td><td>주소</td>
					<td>가입일자</td><td>고객등급</td><td>거주지역</td>
				</tr>
				<%
					Connection conn = null;
					Statement stmt = null;
					String grade = "";
					try{
						conn = Util.getConnection();
						stmt = conn.createStatement();
						String sql = "select * from MEMBER_TBL_02 order by custno";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							grade = rs.getString("grade");
							if(grade.equals("A")){
								grade = "VIP";
							}else if(grade.equals("B")){
								grade = "일반";
							}else{
								grade = "직원";
							}
						
				%>
				<tr>
					<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno")%>"><%=rs.getString("custno")%></a></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=rs.getString("phone")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getDate("joindate")%></td>
					<td><%=grade%></td>
					<td><%=rs.getString("city")%></td>
				</tr>
				<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
				
			</table>
		</form>
	</section>	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>