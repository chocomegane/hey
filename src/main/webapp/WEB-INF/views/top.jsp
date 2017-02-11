<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ECサイト</h1>
<%--
説明
modelAttribute ：　formクラスにパラメータを送る動作　正規表現式でバリデーションチェックなど設定が可能
エラーも返せる

action :　通るコントローラの指定

 <form:form modelAttribute = "" action=""></form:form>  --%>
 
<form:form modelAttribute="userForm" action="${pageContext.request.contextPath}/main">

ユーザID　:　 <form:textarea path = "userId"></form:textarea><br>
パスワード　: <form:textarea path = "password"></form:textarea>

<input type="submit" value="login"></input>



</form:form>


</body>
</html>