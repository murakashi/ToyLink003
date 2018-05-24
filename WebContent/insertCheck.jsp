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
 <div id="header"><div class = "outline"><font size="7" color="white" height="center">STEPPY</font></div></div>
 <%
	String c_name = (String)session.getAttribute("c_name");
%>
	<center>
	<br>
	<br>
<div id="Enclose">
<br>
		<p class="example2">以下の商品を追加しますか？</p>

		<table id=bordernone>
			<tr>
				<td>商品ID</td>
				<td>：</td>
				<td><%=session.getAttribute("s_id")%></td>
			</tr>
			<tr>
				<td>商品名</td>
				<td>：</td>
				<td><%=session.getAttribute("s_name")%></td>
			</tr>
			<tr>
				<td>カテゴリ</td>
				<td>：</td>
				<td><%= c_name %></td>
			</tr>
			<tr>
				<td>仕入基準単価</td>
				<td>：</td>
				<td><%=session.getAttribute("siire_tanka")%></td>
		    </tr>
		    <tr>
				<td>販売単価</td>
				<td>：</td>
				<td><%=session.getAttribute("h_tanka")%></td>
			</tr>
            <tr>
				<td>安全在庫数</td>
				<td>：</td>
				<td><%=session.getAttribute("safe_zaiko")%></td>
			</tr>
		</table>
		<form action="InsertFinish" method="post">
			<fieldset>
				<p>
					<button class="buttonA">はい</button>
				</p>
			</fieldset>
		</form>

		<form action="NewSyohin" method="post">
			<fieldset>
				<p>
					<button class="buttonA">いいえ</button>
				</p>
			</fieldset>
			<br>
			<br>
		</form>
		</div>
		<br>
		<br>
	</center>
	<div id="footer"></div>
</body>
</html>