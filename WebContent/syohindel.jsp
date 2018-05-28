<%@ page import="bean.SyouhinBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>削除確認</title>
</head>
<body>
	<div id="header">
		<div class="outline">
			&nbsp;STEPPY
			<div class="controls">
				<form action="Menu" method="post">
					<button class="buttonA" name="bname" value="メニュー">メニュー</button>
				</form>
			</div>
		</div>
	</div>
	<div id="wrapper">
		<%
			ArrayList<SyouhinBean> syohinlist = (ArrayList<SyouhinBean>) session.getAttribute("syohinlist");
		%>
		<br>
		<center>
			<div id="Enclose3">
				<h3>以下の内容の商品を削除します</h3>
				<table id="bordernone">
					<tr>
						<td>商品ID</td>
						<td>：</td>
						<td><%=syohinlist.get(0).getS_id()%></td>
					<tr>
						<td>商品名</td>
						<td>：</td>
						<td><%=syohinlist.get(0).getS_name()%></td>
					</tr>
					<tr>
						<td>カテゴリ名</td>
						<td>：</td>
						<td><%=syohinlist.get(0).getC_id()%></td>
					</tr>
				</table>
				<form action="SyohinDel" method="post">
					<fieldset>
						<button class="buttonA" name="bname" value="はい">削除</button>
					</fieldset>
				</form>
				<form action="Syohin" method="post">
					<fieldset>
						<button class="buttonA" name="bname" value="いいえ">キャンセル</button>
					</fieldset>
				</form>
			</div>
		</center>
	</div>
	<div id="footer">Copyright ©2018 STEPPY All Rights Reserved.</div>

</body>
</html>