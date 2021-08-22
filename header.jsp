<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
	header{
		background: blue;
		color: white;
		position : fixed;
		top: 0px;
		width: 100%;
		text-align: center;
		height: 90px;
	}
	nav{
		position: fixed;
		top: 90px;
		width: 100%;
		background: lightblue;
		color: white;
		height: 50px;
		font-size: 20px;
		line-height: 50px;
	}
	nav a{
		text-decoration: none;
		color: white;
	}
</style>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav>　　　
			<a href="join.jsp"><b>회원등록</b></a>　　　
			<a href="list.jsp"><b>회원목록조회/수집</b></a>　　　
			<a href="salary.jsp"><b>회원매출조회</b></a>　　　
			<a href="index.jsp"><b>홈으로</b></a>
	</nav>
</body>
</html>