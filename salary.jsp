<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
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
		text-align: center;
	}
</style>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<section>
		<h3>회원매출조회</h3>
		<form action="">
			<table border="1">
				<tr>
					<td>
						회원번호
					</td>
					<td>
						회원성명
					</td>
					<td>
						고객등급
					</td>
					<td>
						매출
					</td>
				</tr>
				<%
					Connection conn = null;
					Statement stmt = null;
					String grade = "";
					try{
						conn = Util.getConnection();
						stmt = conn.createStatement();
						String sql = "select me.custno, me.custname, me.grade, sum(mo.prive) price " +
												"from member_tbl_02 me, money_tbl_02 mo " + 
												"where me.custno = mo.custno " + 
												"group by me.custno, me.custname, me.grade " +
												"order by sum(mo.prive) desc";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							grade = rs.getString("grade");
							switch(grade){
							case "A" : 
								grade = "VIP";
								break;
							case "B" : 
								grade = "일반";
								break;
							case "C" : 
								grade = "직원";
								break;
							}
				%>
				<tr>
					<td>
						<%=rs.getString("custno") %>
					</td>
					<td>
						<%=rs.getString("custname") %>
					</td>
					<td>
						<%=grade %>
					</td>
					<td>
						<%=rs.getString("price") %>
					</td>
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