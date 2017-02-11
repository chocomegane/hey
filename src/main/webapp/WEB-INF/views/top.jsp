<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
<!DOCTYPE html >
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

 <form:form modelAttribute = "使用するformを指定する" action="遷移するためのコントローラのパス"></form:form> 
 
 modelAttribute→事前にコントローラでフォームをマッピングする必要がある
 
  --%>
<form:form modelAttribute="userForm" action="${pageContext.request.contextPath}/main">

ユーザID　:　 <form:input path = "userId"></form:input><br>
パスワード　: <form:password path = "password"></form:password>

<input type="submit" value="login"></input>
</form:form>
<br>

<a href="<%=request.getContextPath() %>/registerUser">新規登録はこちら</a>
</body>
</html>