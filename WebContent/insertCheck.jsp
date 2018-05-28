<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Insert title here</title>
</head>
<body>
 <div id="header"><div class = "outline">&nbsp;STEPPY</div></div>
 <%
	String c_name = (String)session.getAttribute("c_name");
%>
	<center>
	<br>
	<br>

	<br>
	<br>
	<h3>以下の商品を追加しますか？</h3>
	<br>
<div id="Enclose">
		<table id=bordernone>
		<br>
			<tr>
				<td width="120">商品ID</td>
				<td>：</td>
				<td><%=session.getAttribute("s_id")%></td>
			</tr>
			<tr>
				<td width="120">商品名</td>
				<td>：</td>
				<td><%=session.getAttribute("s_name")%></td>
			</tr>
			<tr>
				<td width="120">カテゴリ</td>
				<td>：</td>
				<td><%= c_name %></td>
			</tr>
			<tr>
				<td width="150">仕入基準単価</td>
				<td>：</td>
				<td><%=String.format("%1$,3d",Integer.parseInt((String)session.getAttribute("siire_tanka")))%></td>
		    </tr>
		    <tr>
				<td width="120">販売単価</td>
				<td>：</td>
				<td><%=String.format("%1$,3d",Integer.parseInt((String)session.getAttribute("h_tanka")))%></td>
			</tr>
            <tr>
				<td width="150">安全在庫数</td>
				<td>：</td>
				<td><%=String.format("%1$,3d",Integer.parseInt((String)session.getAttribute("safe_zaiko")))%></td>
			</tr>
		</table>
		<form action="InsertFinish" method="post">
			<fieldset>
					<button class="buttonA">はい</button>
			</fieldset>
		</form>
		<form action="NewSyohin" method="post">
			<fieldset>
					<button class="buttonA">いいえ</button>
			</fieldset>
			<br>
			<br>
		</form>
		</div>
		<br>
		<br>
	</center>
	<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>