<%@page import="DBPKG.Util"%>
<%@page import="java.sql.ResultSet"%>
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
	section form table{
		text-align: center;
		width: 50%;
	}
	form{
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>
<script type="text/javascript" src="joincheck.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	
	<section>
		<h3>홈쇼핑 회원 등록</h3>
		<form action="action.jsp" name="frm" method="post">
			<input type="hidden" name="mode" value="insert" >	
			<table border="1">
	<%
		
		Connection conn = null;
		Statement stmt = null;
		String custno ="";
	
		try{
			conn = Util.getConnection(); 	 // DB 연결
			stmt = conn.createStatement(); // SQL 실행하기 위한 변수 생성
			String sql = "select max(custno)+1 custno from member_tbl_02";
			ResultSet rs = stmt.executeQuery(sql);//stmt 통해서 sql 실행 결과 받아오기
			rs.next();//1개의 결과물 출력
			custno = rs.getString("custno");
		}catch(Exception e){
			e.printStackTrace();
		}		
	%>
				<tr>
					<td>
						회원번호(자동발생)
					</td>
					<td>
						<input type="text" value="<%=custno%>" readonly="readonly" name="custno">
					</td> 
				</tr>
				<tr>
					<td>
						회원성명
					</td>
					<td>
						<input type="text" name="custname">
					</td> 
				</tr>
				<tr>
					<td>
						회원전화
					</td>
					<td>
						<input type="text" name="phone">
					</td> 
				</tr>
				<tr>
					<td>
						회원주소
					</td>
					<td>
						<input type="text" name="address">
					</td> 
				</tr>
				<tr>
					<td>
						가입일자
					</td>
					<td>
						<input type="text" name="joindate">
					</td> 
				</tr>
				<tr>
					<td>
						고객등급 [A:VIP B:일반 C:직원]
					</td>
					<td>
						<input type="text" name="grade">
					</td> 
				</tr>
				<tr>
					<td>
						거주도시
					</td>
					<td>
						<input type="text" name="city">
					</td> 
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="return check()">
						<input type="button" value="조회" onclick="return golist()">
					</td>
				</tr>
			</table>

		</form>
	</section>	
	
	<jsp:include page="footer.jsp"/>
</body>
</html>