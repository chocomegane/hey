<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminCommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理者メニュー</title>
</head>
<body>
<h2 align="center">管理者メニュー</h2>
<div align="center">
	<ul>
		<li><a href="/admin/displayList">取り扱い商品一覧</a></li>
		<li><a href="/admin/orderList">注文一覧</a></li>
		<li><a href="/admin/insert">商品を登録</a></li>
	</ul>
	<hr>
	<ul>
		<li><a href="/admin/register/">新規登録</a></li>
		<li><a href="/admin/logout">ログアウト</a></li>
	</ul>
</div>
</body>
</html>