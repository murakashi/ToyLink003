<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="styles.css">
<title>発注金額合計確認</title>
</head>
<body>
  <div id="header"><div class = "outline">&nbsp;STEPPY</div></div>
	<div id="wrapper">
<%
	String siire_name = (String)session.getAttribute("siire_name");
	String siire_kin = (String)session.getAttribute("siire_kin");
%>
<center>
<br>
<p>
<div id="Enclose">
<br>
<h2>発注内容確認</h2>
<p class="example2">以下の内容でよろしいですか？</p>

仕入先名：<%=siire_name %><br>
合計金額：<%= siire_kin %>円<br>

<form action="OrderFinish" method="Post">
<fieldset><p><button class="buttonA" value="はい">確定</button><br></p></fieldset>
</form>
<form action="OrderError" method="Post">
<fieldset><p><button class="buttonA" value="いいえ">戻る</button><br></p></fieldset>
</form>
</div>
<br>
</center>
</div>
<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>